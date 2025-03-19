package com.erp.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erp.domain.Department;
import com.erp.domain.Employee;
import com.erp.repository.DepartmentRepository;
import com.erp.repository.EmployeeRepository;
import com.erp.service.HRService;

@Service
public class HRServiceImpl implements HRService {
	
	@Autowired
	EmployeeRepository employeeRepository;
	
	@Autowired
	DepartmentRepository departmentRepository;
 	
	
	@Override
	public List<Employee> getAllEmployee() {
		return employeeRepository.getAll();
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
	

}
