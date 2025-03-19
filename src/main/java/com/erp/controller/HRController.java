package com.erp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.erp.domain.Department;
import com.erp.domain.Employee;
import com.erp.repository.EmployeeRepository;
import com.erp.serviceImpl.HRServiceImpl;


@Controller
@RequestMapping("/HR")
public class HRController {
	
	@Autowired
	HRServiceImpl hrServiceImpl;
	
	@RequestMapping("/employee_m")
	public String employeeManagementPage(Model model) {
		System.out.println("employeeManagement 페이지 접근");
		List<Employee> list =  hrServiceImpl.getAllEmployee();
		model.addAttribute("EmployeeList",list);
		model.addAttribute("contentPage","/WEB-INF/views/HR/employeeM.jsp");
			
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
