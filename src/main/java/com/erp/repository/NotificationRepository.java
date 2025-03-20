package com.erp.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.erp.domain.Notification;

@Mapper
public interface NotificationRepository {
	
	List<Notification> getAll(String username);
	
	void deleteNotification(int id);
	
	int getTotalCountByUsername(String username);
	
	void changeRead(int id);


}
