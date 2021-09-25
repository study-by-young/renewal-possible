package com.yedam.possable.app;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import lombok.extern.java.Log;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

        model.addAttribute("serverTime", formattedDate );


		return "home";
	}

	@GetMapping("/test")
	public String test() {
		return "test/test";
	}
	
	//마이페이지 대쉬보드
	@GetMapping("/dashboard")
	public String dashboard() {
		return "mypage/dashboard";
	}
	
	//마이페이지 견적관리
	@GetMapping("/eslist")
	public String eslist() {
		return "mypage/estimate/list";
	}
	
	//마이페이지 견적관리 상세
	@GetMapping("/esinfo")
	public String esinfo() {
		return "mypage/estimate/info";
	}
	
	//마이페이지 렌트내역
	@GetMapping("/rentHistory")
	public String rentHistory() {
		return "mypage/rentHistory";
	}
	
	//마이페이지 후기 작성
	@GetMapping("/review")
	public String review() {
		return "mypage/review/write";
	}
	
	//마이페이지 커뮤니티 관리
	@GetMapping("/community")
	public String community() {
		return "mypage/community";
	}
	
}

