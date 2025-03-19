package com.erp.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.erp.domain.Employee;

@Mapper
public interface EmployeeRepository {
	
	List<Employee> getAll();
	
	void insertEmployee(Employee employee);

}
