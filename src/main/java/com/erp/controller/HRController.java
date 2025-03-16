package com.erp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/HR")
public class HRController {
	
	@RequestMapping("/employee_m")
	public String employeeManagementPage(Model model) {
		System.out.println("employeeManagement 페이지 접근");

		model.addAttribute("contentPage","/WEB-INF/views/HR/employeeM.jsp");
			
		return "layout/layout";
	}
	
	@RequestMapping("/department_m")
	public String departmentManagementPage(Model model) {
		System.out.println("departmentManagement 페이지 접근");

		model.addAttribute("contentPage","/WEB-INF/views/HR/departmentM.jsp");
			
		return "layout/layout";
	}

}
