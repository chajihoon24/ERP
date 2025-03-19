package com.erp.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erp.domain.ErpUser;
import com.erp.domain.Notice;
import com.erp.repository.ErpUserRepository;
import com.erp.repository.NoticeRepository;
import com.erp.repository.NotificationRepository;
import com.erp.service.MainService;

@Service
public class MainServiceImpl implements MainService {
	
	 private static final int PAGE_SIZE = 8; // 한 페이지당 10개씩
	@Autowired
	NotificationRepository notificationRepository;
	@Autowired
	NoticeRepository noticeRepository;
	@Autowired
	ErpUserRepository erpUserRepository;
	
	@Override
	public List<Notice> getAllNotice(int page){
		int offset = (page - 1) * PAGE_SIZE;
		
		return noticeRepository.getAll(PAGE_SIZE,offset);
		
	}
	
    public int getTotalPages() {
        int totalRecords = noticeRepository.getTotalCount();
        System.out.println("total : "+totalRecords);
        return (int) Math.ceil((double) totalRecords / PAGE_SIZE);
    }
	
	@Override
	public void insertNotice(Notice notice) {
		noticeRepository.insertNotice(notice);
	};
	@Override
	public Notice getNoticeById(int id) {
		return noticeRepository.getNoticeById(id);
	};
	@Override
	public void noticeDelete(int id) {
		noticeRepository.noticeDelete(id);
	};
	
	@Override
	public ErpUser getUserByUsername(String username) {
		return erpUserRepository.getUserByUsername(username);
	}
	@Override
	public void updateNotice(Notice notice) {
		noticeRepository.updateNotice(notice);
		
	}
	@Override
	public void deleteNotification(int id) {
		
		notificationRepository.deleteNotification(id);
	}
	
	
	
}
