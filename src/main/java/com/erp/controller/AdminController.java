package com.erp.controller;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.erp.domain.ErpUser;
import com.erp.serviceImpl.AdminServiceImpl;


@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminServiceImpl adminServiceImpl;
	
	@RequestMapping()
	public String userM(Model model) {
		ErpUser UserDetail = adminServiceImpl.getUserById(1);
		List<ErpUser> deletedUser = adminServiceImpl.getDeletedUser();
		model.addAttribute("deletedUser",deletedUser);
		List<ErpUser> user = adminServiceImpl.getAll();
		model.addAttribute("UserList",user);
		System.out.println("사용자관리 페이지 접근");		
		model.addAttribute("UserDetail", UserDetail);
		model.addAttribute("contentPage","/WEB-INF/views/admin/userM.jsp");
		return "layout/layout";
		
	}
	@RequestMapping("/detail")
	public String userDetail(@RequestParam("id") int id, Model model) {
		ErpUser UserDetail = adminServiceImpl.getUserById(id);
	    System.out.println("일련번호 " + id + " 상세보기 성공");
	    List<ErpUser> deletedUser = adminServiceImpl.getDeletedUser();
	    List<ErpUser> user = adminServiceImpl.getAll();
	    model.addAttribute("deletedUser",deletedUser);
	    model.addAttribute("UserDetail", UserDetail);
	    model.addAttribute("UserList", user);
	    model.addAttribute("contentPage", "/WEB-INF/views/admin/userM.jsp");

	    return "layout/layout";
	}
	
	@RequestMapping(value="/delete/all",method =RequestMethod.DELETE)
    public ResponseEntity<String> CompletelyDeleteUser() {
        adminServiceImpl.deleteDeletedUsers();;
        System.out.println("전체 삭제 성공");

        return ResponseEntity.ok("User deleted successfully");
    }
	
	@RequestMapping(value="/delete/{id}",method =RequestMethod.DELETE)
    public ResponseEntity<String> userDelete(@PathVariable("id") int id) {
        adminServiceImpl.deleteById(id);
        System.out.println("일련번호 " + id + " 삭제 성공");

        return ResponseEntity.ok("User deleted successfully");
    }
	
	@RequestMapping(value="/rollback/{id}",method =RequestMethod.PUT)
	public ResponseEntity<String> rollbackUser(@PathVariable("id") int id){
		
		adminServiceImpl.updateUserStatus(id);
		
		return ResponseEntity.ok("User deleted successfully");
		
	}
	@RequestMapping(value="/change_delete/{id}",method =RequestMethod.PATCH)
	public ResponseEntity<String> changeDelete(@PathVariable("id") int id){
		
		adminServiceImpl.changeDelete(id);

		return ResponseEntity.ok("User updated successfully");
		
	}

	
	@RequestMapping(value="/updateUser", method=RequestMethod.PATCH, consumes="application/json;")
	public ResponseEntity<String> updateUser(@RequestBody Map<String, Object> updates){
		System.out.println("updateUser 진입 "+ updates.toString());
		adminServiceImpl.updateUser(updates);
		
		return ResponseEntity.ok("User updated successfully");
		
	}
	
	@RequestMapping(value="/insertUser", method=RequestMethod.POST)
	public String insertUser(@ModelAttribute ErpUser user){
		 BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		 user.setPassword(passwordEncoder.encode(user.getPassword()));
		System.out.println("updateUser 진입 "+ user.toString());
		LocalDateTime date = LocalDateTime.now();
		user.setCreatedAt(date);
		adminServiceImpl.insertUser(user);
		
		return "redirect:/admin";
		
	}

	
}
