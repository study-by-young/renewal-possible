package com.yedam.possable.app.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.possable.app.member.domain.MemberVO;
import com.yedam.possable.app.member.service.MemberService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	@Autowired MemberService memberService;
	//마이페이지 대쉬보드
		@GetMapping("/dashboard")
		public String dashboard(HttpSession session, MemberVO vo) {
			return "mypage/dashboard";
		}
		
		//마이페이지 회원정보수정
		@GetMapping("/editInfo")
		public String editInfo() {
			return "mypage/editInfo";
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
		
		//마이페이지 나의 문의
		@GetMapping("/qna")
		public String qna() {
			return "mypage/qna";
		}
}
