package com.yedam.possable.app;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import com.yedam.possable.app.admin.mapper.TestMapper;
import lombok.extern.java.Log;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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

    @Autowired
    TestMapper testMapper;

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

        log.info("===========================");
        log.info(testMapper.getList().toString());

        model.addAttribute("serverTime", formattedDate );


		return "home";
	}

	@GetMapping("/test")
	public String test() {
		return "test/test";
	}
}
