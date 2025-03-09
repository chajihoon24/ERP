package com.jihoon.ERP;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {

		model.addAttribute("contentPage","home.jsp");
		model.addAttribute("title", "HomePage");
		
		return "layout";
	}
	
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public String hr(Model model) {
		model.addAttribute("contentPage","tmp_user.jsp");
		model.addAttribute("title","HR");
		return "layout";
	}
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {
		model.addAttribute("contentPage","login.jsp");
		model.addAttribute("title","login");
		return "layout";
	}
	
}
