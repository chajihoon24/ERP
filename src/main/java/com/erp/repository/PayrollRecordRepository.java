package com.erp.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.erp.domain.PayrollRecord;

public interface PayrollRecordRepository {
	
	
	List<PayrollRecord> getAll(@Param("pageSize") int pageSize,@Param("offset") int offset);
	
	void insertRecord(PayrollRecord payrollRecord);
	
	int getTotalCount();
	
	void deleteRecord(int id);
}
