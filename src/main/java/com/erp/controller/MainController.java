package com.erp.controller;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.datetime.joda.LocalDateParser;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.erp.domain.ErpUser;
import com.erp.domain.Notice;
import com.erp.serviceImpl.AdminServiceImpl;
import com.erp.serviceImpl.MainServiceImpl;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@Autowired
	private AdminServiceImpl AdminService;	
	@Autowired
	private MainServiceImpl mainServiceImpl;
	
	
	@RequestMapping()
	public String homePage(Model model) {

		List<Notice> list = mainServiceImpl.getAllNotice();
		model.addAttribute("data",list);
		model.addAttribute("contentPage","/WEB-INF/views/home.jsp");
			
		return "layout/layout";
	}
	
	@RequestMapping("/notice/perform")
	public String notice_perform(Model model) {
		
		model.addAttribute("contentPage","/WEB-INF/views/perform_notice.jsp");
			
		return "layout/layout";
	}
	@RequestMapping(value="/notice/perform", method=RequestMethod.POST)
	public String insertNotice(@ModelAttribute Notice notice,Model model) {
		System.out.println(notice.toString());
		mainServiceImpl.insertNotice(notice);
		
		model.addAttribute("contentPage","/WEB-INF/views/home.jsp");
		return "layout/layout";	
	}

	@RequestMapping("/notice/detail/{id}")
	public String noticeDatail(@PathVariable(value="id") int id ,Model model) {
		
		System.out.println(id);
		Notice notice = mainServiceImpl.getNoticeById(id);
		System.out.println(notice.toString());
		model.addAttribute("data",notice);
		model.addAttribute("contentPage","/WEB-INF/views/notice_detail.jsp");
			
		return "layout/layout";
	}
	@RequestMapping(value="/notice/delete/{id}", method=RequestMethod.GET )
	public String noticeDelete(@PathVariable(value="id") int id ,Model model) {
		
		mainServiceImpl.noticeDelete(id);
			
		return "redirect: /main";
	}

	@RequestMapping(value ="/login", method = RequestMethod.GET)
	public String loginPage(Model model) {
		System.out.println("login 페이지 접근");
		model.addAttribute("contentPage","/WEB-INF/views/login.jsp");
		
		return "layout/layout";
	}
	
	
}
