package com.yedam.possable.app.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.yedam.possable.app.member.service.MemberService;

import lombok.extern.java.Log;

@Log
@Controller
public class MemberController {
	
	@Autowired MemberService memberService;
	
	@PostMapping("/memberList")
	public String memberList(Model model) {
		
		model.addAttribute("memberList",memberService.memberList() );
		
		return "member/memberList";
	}
	//업체전환 신청 페이지
	@GetMapping("/chngRole")
	public String chngRole(Model model) {
		
		return "mypage/chngRole";
	}
}
