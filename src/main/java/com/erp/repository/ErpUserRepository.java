package com.erp.repository;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import com.erp.domain.ErpUser;

@Mapper
public interface ErpUserRepository {

	//사용자 관리
    ErpUser getUserById(int userId);
    
    List<ErpUser> getAll();
    
    List<ErpUser> getDeletedUser();
    
    void deleteDeletedUsers();
    
    void insertErpUser(ErpUser erpUser);
    
    void deleteById(int userId);
    
    void updateUserStatus(int id);
    
    void updateUser(Map<String, Object> map);
    
    void changeDelete(int userId);
    
    ErpUser getUserByUsername(String username);
}
