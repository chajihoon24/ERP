package com.erp.service;

import java.util.List;

import com.erp.domain.ErpUser;
import com.erp.domain.Notice;

public interface MainService {
		
	List<Notice> getAllNotice(int page);
	
	int getTotalPages();
	
	void insertNotice(Notice notice);
	
	Notice getNoticeById(int id);
	
	void noticeDelete(int id);
	
	ErpUser getUserByUsername(String username);
	
	void updateNotice(Notice notice);
	
	void deleteNotification(int id);
	
	void changeRead(int id);
	
}
