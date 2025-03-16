package com.erp.repository;

import java.util.List;

import com.erp.domain.Notice;

public interface NoticeRepository {
	List<Notice> getAll();
	void insertNotice(Notice notice);
	Notice getNoticeById(int id);
	void noticeDelete(int id);
}
