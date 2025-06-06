package com.erp.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erp.domain.Department;
import com.erp.domain.Employee;
import com.erp.domain.PayrollRecord;
import com.erp.repository.DepartmentRepository;
import com.erp.repository.EmployeeRepository;
import com.erp.repository.PayrollRecordRepository;
import com.erp.service.HRService;

@Service
public class HRServiceImpl implements HRService {
	
	private static final int PAGE_SIZE = 9; // 한 페이지당 10개씩
	
	@Autowired
	EmployeeRepository employeeRepository;
	
	@Autowired
	DepartmentRepository departmentRepository;
	@Autowired
	PayrollRecordRepository payrollRecordRepository;
 	
	
	@Override
	public List<Employee> getAllEmployee(int page) {
	    int offset = (page - 1) * PAGE_SIZE;
	    
	    List<Employee> list = employeeRepository.getAll(PAGE_SIZE, offset);
	    
	    for (Employee n : list) {
	        switch (n.getPosition()) {
	            case "INTERN":
	                n.setPosition("인턴");
	                break;
	            case "JUNIOR":
	                n.setPosition("사원");
	                break;
	            case "ASSOCIATE":
	                n.setPosition("대리");
	                break;
	            case "SENIOR":
	                n.setPosition("과장");
	                break;
	            case "MANAGER":
	                n.setPosition("차장");
	                break;
	            case "DIRECTOR":
	                n.setPosition("부장");
	                break;
	            case "EXECUTIVE":
	                n.setPosition("임원");
	                break;
	            case "CEO":
	                n.setPosition("대표이사");
	                break;
	            default:
	                n.setPosition("기타");
	                break;
	        }
	    }
	    
	    return list;
	}
	
	@Override
	public void insertEmployee(Employee employee) {
		
		employeeRepository.insertEmployee(employee);
		
	}
	@Override
	public List<Department> getAllDepartment() {
		return departmentRepository.getAll();
	}
	@Override
	public void insertDepartment(Department department) {
		departmentRepository.insertDepartment(department);
		
	}
	@Override
    public int getTotalPages() {
        int totalRecords = employeeRepository.getTotalCount();
        return (int) Math.ceil((double) totalRecords / PAGE_SIZE);
    }
	@Override
	public Employee getEmployeeById(int id) {
		
		Employee employee = employeeRepository.getEmployeeById(id);
	    
	        switch (employee.getPosition()) {
	            case "INTERN":
	            	employee.setPosition("인턴");
	                break;
	            case "JUNIOR":
	            	employee.setPosition("사원");
	                break;
	            case "ASSOCIATE":
	            	employee.setPosition("대리");
	                break;
	            case "SENIOR":
	            	employee.setPosition("과장");
	                break;
	            case "MANAGER":
	            	employee.setPosition("차장");
	                break;
	            case "DIRECTOR":
	            	employee.setPosition("부장");
	                break;
	            case "EXECUTIVE":
	            	employee.setPosition("임원");
	                break;
	            case "CEO":
	            	employee.setPosition("대표이사");
	                break;
	            default:
	            	employee.setPosition("기타");
	                break;
	        }
	        return employee;
	    }
	    
	@Override
	public void deleteById(int id) {
		employeeRepository.deleteById(id);
		
	}
	@Override
	public void updateEmployee(Employee employee) {
		employeeRepository.updateEmployee(employee);
		
	}
	@Override
	public void deleteDepartment(int id) {
		departmentRepository.deleteDepartment(id);	
	}
	
	@Override
	public List<Employee> getAllNone() {
		return employeeRepository.getAllNone();
	}
	@Override
	public void insertRecord(PayrollRecord payrollRecord) {
		payrollRecordRepository.insertRecord(payrollRecord);
	}
	@Override
	public List<PayrollRecord> getAllPayRecord(int page) {
		int offset = (page - 1) * 20;
		int page_Size = 20;
		System.out.println("offset:" + offset );
		return payrollRecordRepository.getAll(page_Size,offset);
	}
	@Override
	public int getTotalCount() {
		int totalRecord = payrollRecordRepository.getTotalCount();
		return (int) Math.ceil((double) totalRecord/20);
	}
	@Override
	public void deleteRecord(int id) {
		payrollRecordRepository.deleteRecord(id);
	}
	
}
