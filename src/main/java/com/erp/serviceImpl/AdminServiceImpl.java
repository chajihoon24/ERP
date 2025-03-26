package com.erp.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erp.domain.ErpUser;
import com.erp.domain.Notification;
import com.erp.repository.ErpUserRepository;
import com.erp.repository.NotificationRepository;
import com.erp.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private ErpUserRepository erpUserRepository;
	@Autowired
	private NotificationRepository notificationRepository;
	
	//유저 가져오기
	@Override
	public ErpUser getUserById(int userId) {
		return erpUserRepository.getUserById(userId);
	}
	
	//유저 추가하기
	@Override
	public void insertUser(ErpUser erpUser) {		
		erpUserRepository.insertErpUser(erpUser);		
	}
	
	//유저목록 가져오기
	@Override
	public List<ErpUser> getAll() {
		return erpUserRepository.getAll();		
	}
	
	@Override
	public void deleteById(int userId) {
		erpUserRepository.deleteById(userId);
	}
	
	@Override
	public List<ErpUser> getDeletedUser() {
		return erpUserRepository.getDeletedUser();
	}
	
	@Override
	public void deleteDeletedUsers() {
		erpUserRepository.deleteDeletedUsers();
	};
	
	@Override
	public void updateUserStatus(int id) {
		
		ErpUser erpUser = erpUserRepository.getUserById(id);
		
		
		
		Notification notification = new Notification();
		notification.setUsername(erpUser.getUsername());
		notification.setMessage("권한이 변경되었습니다.");
		notificationRepository.insertNotification(notification);
		erpUserRepository.updateUserStatus(id);
	}
	@Override
	public void updateUser(Map<String, Object> map) {
		erpUserRepository.updateUser(map);
	}
	@Override
	public void changeDelete(int userId) {
		erpUserRepository.changeDelete(userId);
	};
	
	
	
}
