package com.erp.service;

import java.util.List;

import com.erp.domain.Department;
import com.erp.domain.Employee;
import com.erp.domain.PayrollRecord;

public interface HRService {
	
	List<Employee> getAllEmployee(int page);
	
	void insertEmployee(Employee employee);
	
	List<Department> getAllDepartment();
	
	void insertDepartment(Department department);
	
	int getTotalPages();
	
	Employee getEmployeeById(int id);
	
	void deleteById(int id);
	
	void updateEmployee(Employee employee);
	
	void deleteDepartment(int id);
	
	List<Employee> getAllNone();
	
	void insertRecord(PayrollRecord payrollRecord);
	
	List<PayrollRecord> getAllPayRecord(int page);
	
	int getTotalCount();
	
	void deleteRecord(int id);
}
