package com.erp.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.erp.domain.Notice;

public interface NoticeRepository {
	
	List<Notice> getAll(@Param("pageSize") int pageSize,@Param("offset") int offset);
	
	void insertNotice(Notice notice);
	
	Notice getNoticeById(int id);
	
	void noticeDelete(int id);
	
	void updateNotice(Notice notice);
	
	int getTotalCount();
}
