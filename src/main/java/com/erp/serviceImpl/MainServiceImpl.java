package com.erp.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erp.domain.ErpUser;
import com.erp.domain.Notice;
import com.erp.repository.ErpUserRepository;
import com.erp.repository.NoticeRepository;
import com.erp.service.MainService;

@Service
public class MainServiceImpl implements MainService {
	
	@Autowired
	NoticeRepository noticeRepository;
	@Autowired
	ErpUserRepository erpUserRepository;
	
	@Override
	public List<Notice> getAllNotice(){
		return noticeRepository.getAll();
		
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
}
