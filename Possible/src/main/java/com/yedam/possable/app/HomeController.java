package com.yedam.possable.app;

import com.yedam.possable.app.common.code.domain.CodeMasterVO;
import com.yedam.possable.app.common.code.service.CodeService;
import com.yedam.possable.app.common.criteria.domain.Criteria;
import com.yedam.possable.app.common.criteria.domain.PageVO;
import com.yedam.possable.app.community.faq.service.FaqService;
import com.yedam.possable.app.community.tour.service.TourService;
import lombok.extern.java.Log;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	CodeService codeService;
	@Autowired
	TourService tourService;
	@Autowired
	FaqService faqService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		CodeMasterVO codeMasterVO = codeService.getMasterCodeByName("지역");
		model.addAttribute("areaCodes",codeService.getCodesByParentCode(codeMasterVO.getCode()));
		model.addAttribute("tourList", tourService.getLatestList());
		model.addAttribute("faqList", faqService.getList(new Criteria()));
		return "home";
	}

	@RequestMapping("/pagination")
    public String pagination(){
	    return "tiles/pagination";
    }

	@RequestMapping("/errorPage")
    public String errorPage(){
	    return "errorPage";
    }
}

