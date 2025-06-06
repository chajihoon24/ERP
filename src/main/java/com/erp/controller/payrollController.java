package com.erp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.erp.domain.Employee;
import com.erp.domain.InsuranceTax;
import com.erp.domain.PayrollRecord;
import com.erp.serviceImpl.HRServiceImpl;
import com.erp.serviceImpl.NIServiceImpl;

@Controller
@RequestMapping("/HR/payroll")
public class payrollController {
	
	@Autowired
	NIServiceImpl niServiceImpl;
	@Autowired
	HRServiceImpl hrService;
	
	
	@RequestMapping("/main")
	public String payrollMain(Model model) {
		
		List<Employee> employeeList= hrService.getAllNone();
		int count = employeeList.size();
		InsuranceTax tax = niServiceImpl.getInsuranceTaxInfo();
		
		model.addAttribute("count",count);
		model.addAttribute("employeeList",employeeList);
		model.addAttribute("tax",tax);
		model.addAttribute("contentPage","/WEB-INF/views/HR/payrollM/payroll_M.jsp");		
		
		return "layout/layout";
	}
	
	@RequestMapping("/main/detail/{id}")
	@ResponseBody
	public Employee getDetail(@PathVariable("id") int id){
		System.out.println("상세 디테일 진입");		
		return hrService.getEmployeeById(id);
	}
	
	
	
	@RequestMapping(value="/main/insert",method = RequestMethod.POST)
	public ResponseEntity<String> insertPayrollRecord(Model model,@RequestBody PayrollRecord payrollRecord) {
		System.out.println(payrollRecord.toString());
		hrService.insertRecord(payrollRecord);
		
		return ResponseEntity.ok("신고 성공");
	}	
	
	
	
	
	@RequestMapping("/record")
	public String payrollRecord(Model model,@RequestParam(defaultValue = "1") int page) {
		
		List<PayrollRecord> list = hrService.getAllPayRecord(page);
		
		int totalPages = hrService.getTotalCount();
		model.addAttribute("currentPage", page);
		model.addAttribute("data",list);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("contentPage","/WEB-INF/views/HR/payrollM/payroll_record.jsp");		
		
		return "layout/layout";
	}
	
	@RequestMapping(value="/record/delete/{id}",method=RequestMethod.DELETE)
	public ResponseEntity<String> payrollRecordDelete(Model model,@PathVariable("id") int id) {
		
		
		hrService.deleteRecord(id);
		System.out.println("리코드 삭제");
		
		return ResponseEntity.ok("성공");

	}
	
	
	
	
	
	

}
