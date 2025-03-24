package com.erp.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.erp.domain.Employee;

@Mapper
public interface EmployeeRepository {
	
	List<Employee> getAll(@Param("pageSize") int pageSize,@Param("offset") int offset);
	
	void insertEmployee(Employee employee);

	int getTotalCount();
	
	Employee getEmployeeById(int id);
	
	void deleteById(int id);
	
	void updateEmployee(Employee employee);
	
	List<Employee> getAllNone();
	
	
}
