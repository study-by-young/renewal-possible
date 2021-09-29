package com.yedam.possable.app.company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.possable.app.company.domain.CompanyVO;
import com.yedam.possable.app.company.service.CompanyService;
import com.yedam.possable.app.member.domain.MemberVO;

import lombok.extern.java.Log;

@Log
@Controller
public class CompanyController {
	
	@Autowired CompanyService companyService;
	
	//업체등록
	
	
}
