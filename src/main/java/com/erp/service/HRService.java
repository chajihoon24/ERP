package com.erp.service;

import java.util.List;

import com.erp.domain.Department;
import com.erp.domain.Employee;

public interface HRService {
	
	List<Employee> getAllEmployee();
	
	void insertEmployee(Employee employee);
	
	List<Department> getAllDepartment();
	
	void insertDepartment(Department department);
}
