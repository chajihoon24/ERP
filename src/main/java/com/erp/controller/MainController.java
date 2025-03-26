package com.erp.controller;

import java.security.Principal;
import java.time.LocalDateTime;
import java.util.List;

import javax.ejb.Local;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.datetime.joda.LocalDateParser;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.erp.domain.ErpUser;
import com.erp.domain.Notice;
import com.erp.domain.Notification;
import com.erp.repository.NotificationRepository;
import com.erp.serviceImpl.AdminServiceImpl;
import com.erp.serviceImpl.MainServiceImpl;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@Autowired
	private AdminServiceImpl AdminService;	
	@Autowired
	private MainServiceImpl mainServiceImpl;
	@Autowired
	private NotificationRepository notificationRepository;
	
	
	@RequestMapping()
	public String homePage(Model model,@RequestParam(defaultValue = "1") int page) {
		
	    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    Object principal = authentication.getPrincipal();
	    String loginUsername = null;
	    loginUsername = ((UserDetails) principal).getUsername();		
		int notificationTotal = notificationRepository.getTotalCountByUsername(loginUsername);
	    List<Notification> notifications = notificationRepository.getAll(loginUsername);
        int totalPages = mainServiceImpl.getTotalPages();
		List<Notice> list = mainServiceImpl.getAllNotice(page);
		model.addAttribute("notifications",notifications);
		model.addAttribute("data",list);
		model.addAttribute("notificationTotal",notificationTotal);
		model.addAttribute("contentPage","/WEB-INF/views/home.jsp");
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("currentPage", page);
			
		return "layout/layout";
	}
	
	@RequestMapping("/notice/perform")
	public String notice_perform(Model model) {
	    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    Object principal = authentication.getPrincipal();
	    String loginUsername = null;
	    loginUsername = ((UserDetails) principal).getUsername();
	    model.addAttribute("loginUsername",loginUsername);
		model.addAttribute("contentPage","/WEB-INF/views/perform_notice.jsp");
			
		return "layout/layout";
	}
	@RequestMapping(value="/notice/perform", method=RequestMethod.POST)
	public String insertNotice(@ModelAttribute Notice notice,Model model) {
		System.out.println(notice.toString());
		mainServiceImpl.insertNotice(notice);
		
		model.addAttribute("contentPage","/WEB-INF/views/home.jsp");
		return "layout/layout";	
	}
	
	@RequestMapping(value="/notice/update_form/{id}", method=RequestMethod.GET)
	public String insertNotice(@PathVariable(value="id") int id,Model model) {
		Notice notice = mainServiceImpl.getNoticeById(id);
		model.addAttribute("data",notice);
		model.addAttribute("contentPage","/WEB-INF/views/update_notice.jsp");
		return "layout/layout";	
	}

	@RequestMapping(value="/notice/update", method=RequestMethod.PATCH,consumes = "application/json" )
	public ResponseEntity<String> noticeUpdate(@RequestBody Notice notice ,Model model) {
		System.out.println("패치 :"+notice.toString());
		mainServiceImpl.updateNotice(notice);;
		
		return ResponseEntity.ok("User updated successfully");
	}
	
	
	@RequestMapping("/notice/detail/{id}")
	public String noticeDatail(@PathVariable(value="id") int id ,Model model) {
		
	    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    Object principal = authentication.getPrincipal();
	    String loginUsername = null;
	    loginUsername = ((UserDetails) principal).getUsername();
		System.out.println(loginUsername);
		Notice notice = mainServiceImpl.getNoticeById(id);
		int notificationTotal = notificationRepository.getTotalCountByUsername(loginUsername);
		System.out.println(notice.toString());
		model.addAttribute("notificationTotal",notificationTotal);
		model.addAttribute("loginUsername",loginUsername);
		model.addAttribute("data",notice);
		model.addAttribute("contentPage","/WEB-INF/views/notice_detail.jsp");
			
		return "layout/layout";
	}
	
	
	
	@RequestMapping(value="/notice/delete/{id}", method=RequestMethod.GET )
	public String noticeDelete(@PathVariable(value="id") int id ,Model model) {
		
		mainServiceImpl.noticeDelete(id);
			
		return "redirect: /main";
	}

	@RequestMapping(value ="/login", method = RequestMethod.GET)
	public String loginPage(Model model) {
		System.out.println("login 페이지 접근");
		model.addAttribute("contentPage","/WEB-INF/views/login.jsp");
		
		return "layout/layout";
	}
	@RequestMapping(value="/deleteNotification", method = RequestMethod.POST)
	public String deleteNotification(@RequestParam("id") int id){
		
		notificationRepository.deleteNotification(id);
		
		return "redirect: /main";
	}
	
	@RequestMapping(value = "/changeRead/{id}")
	public String changeRead(@PathVariable("id")int id) {
		
		notificationRepository.changeRead(id);
		
		return "redirect:/main";
		
	}
	
}
