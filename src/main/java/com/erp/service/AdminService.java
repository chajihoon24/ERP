package com.erp.service;

import java.util.List;
import java.util.Map;

import com.erp.domain.ErpUser;

public interface AdminService {
	
	//개별 가져오기
	ErpUser getUserById(int userId);
	
	//유저 생성
	void insertUser(ErpUser erpUser);
	
	List<ErpUser> getAll();
	
	void deleteById(int userId);
	
	List<ErpUser> getDeletedUser();
	
	void deleteDeletedUsers();
	
	void updateUserStatus(int id);
	
	void updateUser(Map<String, Object> map);
	
	void changeDelete(int userId);

}
