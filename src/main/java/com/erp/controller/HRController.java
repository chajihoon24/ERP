package com.erp.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.erp.domain.Department;
import com.erp.domain.Employee;
import com.erp.security.CustomUserDetails;
import com.erp.serviceImpl.HRServiceImpl;


@Controller
@RequestMapping("/HR")
public class HRController {
	
	BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	
    
    
	@Autowired
	HRServiceImpl hrServiceImpl;
	
	@RequestMapping("/employee_m")
	public String employeeManagementPage(Model model,@RequestParam(defaultValue = "1") int page) {
		
		model.addAttribute("currentPage", page);
		List<Employee> list =  hrServiceImpl.getAllEmployee(page);
		int totalPages = hrServiceImpl.getTotalPages();
		model.addAttribute("employee",null);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("EmployeeList",list);
		model.addAttribute("contentPage","/WEB-INF/views/HR/employeeM.jsp");
			
		return "layout/layout";
	}
	
	
	@RequestMapping("/employee_m/detail/{id}")
	public String employeeDetail(Model model,@RequestParam(defaultValue = "1") int page,@PathVariable("id")int id,Principal principal) {
		

		System.out.println(id);
		Employee employee = hrServiceImpl.getEmployeeById(id);
		System.out.println(employee.toString());
		List<Employee> list =  hrServiceImpl.getAllEmployee(page);
		int totalPages = hrServiceImpl.getTotalPages();
		model.addAttribute("employee",employee);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("EmployeeList",list);
		model.addAttribute("contentPage","/WEB-INF/views/HR/employeeM.jsp");		
		return "layout/layout";
	}
	
	@RequestMapping(value = "/employee_m/delete/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteEmployee(@PathVariable int id) {
	    // id로 직원 삭제 처리
	    hrServiceImpl.deleteById(id);
	    return ResponseEntity.ok("성공");
	}
	
	
	
	@RequestMapping(value="/employee_m/checkPassword", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> checkPassword(@RequestParam String password) {
	    System.out.println("입력된 비밀번호: " + password);
	    
	    // 현재 인증된 사용자의 정보를 가져옴
	    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    System.out.println("Authentication Principal: " + authentication.getPrincipal());

	    // Principal을 CustomUserDetails로 캐스팅
	    if (authentication.getPrincipal() instanceof CustomUserDetails) {
	        CustomUserDetails customUserDetails = (CustomUserDetails) authentication.getPrincipal();
	        String encodedPassword = customUserDetails.getPassword();
	        System.out.println("Encoded Password: " + encodedPassword);
	        
	        // 입력한 비밀번호와 저장된 비밀번호 비교
	        boolean isPasswordCorrect = passwordEncoder.matches(password, encodedPassword);
	        System.out.println("Password Match: " + isPasswordCorrect);
	        
	        // 결과를 반환
	        Map<String, Object> response = new HashMap<>();
	        response.put("isPasswordCorrect", isPasswordCorrect);
	        return response;
	    } else {
	        System.out.println("Principal is not an instance of CustomUserDetails");
	        Map<String, Object> response = new HashMap<>();
	        response.put("isPasswordCorrect", false);
	        return response;
	    }
	}
	
	
	@RequestMapping(value ="/employee_m/update", method=RequestMethod.PATCH,consumes = "application/json" )
	public ResponseEntity<String> updateEmployee(@RequestBody Employee employee) {
		System.out.println("desd 페이지 접근");
		
		hrServiceImpl.updateEmployee(employee);
		
			
		return ResponseEntity.ok("수정 성공");
	}
	
	
	
	@RequestMapping(value ="/employee_m/perform/{id}")
	public String employeePerform(Model model,@PathVariable int id) {
		System.out.println(" 등록 페이지 접근");
		
		Employee employee = hrServiceImpl.getEmployeeById(id);
		
		model.addAttribute("employee",employee);
		model.addAttribute("contentPage","/WEB-INF/views/HR/employeeM_perform.jsp");
			
		return "layout/layout";
	}	
	
	
	
	
	@RequestMapping("/department_m")
	public String departmentManagementPage(Model model) {
		System.out.println("departmentManagement 페이지 접근");
		
		List<Department> list = hrServiceImpl.getAllDepartment();
		
		model.addAttribute("data",list);
		model.addAttribute("contentPage","/WEB-INF/views/HR/departmentM.jsp");
			
		return "layout/layout";
	}

}
