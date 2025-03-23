package com.erp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/HR/payroll")
public class payrollController {
	
	
	@RequestMapping("/main")
	public String payrollMain(Model model) {
		
		model.addAttribute("contentPage","/WEB-INF/views/HR/payrollM/payroll_M.jsp");		
		
		return "layout/layout";
	}
	@RequestMapping("/record")
	public String payrollRecord(Model model) {
		
		model.addAttribute("contentPage","/WEB-INF/views/HR/payrollM/payroll_record.jsp");		
		
		return "layout/layout";
	}	
	
	
	
	
	
	

}
