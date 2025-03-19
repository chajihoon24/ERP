package com.erp.repository;

import java.util.List;

import com.erp.domain.Department;

public interface DepartmentRepository {

	List<Department> getAll();
	
	void insertDepartment(Department department);
	
}
