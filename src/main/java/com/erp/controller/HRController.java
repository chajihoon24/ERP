package com.erp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String employeeManagementPage(Model model,@RequestParam(defaultValue = "1") int page) {
		
		model.addAttribute("currentPage", page);
		List<Employee> list =  hrServiceImpl.getAllEmployee(page);
		int totalPages = hrServiceImpl.getTotalPages();
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("EmployeeList",list);
		model.addAttribute("contentPage","/WEB-INF/views/HR/employeeM.jsp");
			
		return "layout/layout";
	}
	
	
	@RequestMapping("/employee_m/detail/{id}")
	public String employeeDetail(Model model,@RequestParam(defaultValue = "1") int page,@PathVariable("id")int id) {
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
	
	
	
	
	
	
	
	
	@RequestMapping("/department_m")
	public String departmentManagementPage(Model model) {
		System.out.println("departmentManagement 페이지 접근");
		
		List<Department> list = hrServiceImpl.getAllDepartment();
		
		model.addAttribute("data",list);
		model.addAttribute("contentPage","/WEB-INF/views/HR/departmentM.jsp");
			
		return "layout/layout";
	}

}
