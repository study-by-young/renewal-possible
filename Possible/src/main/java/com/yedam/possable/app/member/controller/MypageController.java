package com.yedam.possable.app.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.possable.app.common.code.mapper.CodeMapper;
import com.yedam.possable.app.company.domain.CompanyVO;
import com.yedam.possable.app.company.service.CompanyService;
import com.yedam.possable.app.member.domain.MemberVO;
import com.yedam.possable.app.member.service.MemberService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/mypage/*")
public class MypageController {

	@Autowired MemberService memberService;
	@Autowired CompanyService companyService;
	@Autowired CodeMapper codeMapper;

	//마이페이지 대쉬보드
		@GetMapping("/dashboard")
		public String dashboard(HttpSession session, MemberVO memVo, CompanyVO comVo) {
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

		//업체전환 신청 페이지
		@GetMapping("/chngRole")
		public String chngRole(Model model, HttpSession session) {

			return "mypage/chngRole";
		}

		//업체전환 신청처리
		@PostMapping("/chngRole")
		public String chngRole(Model model, CompanyVO vo, @RequestParam("memSeq") Long memSeq, RedirectAttributes rttr ) {
			// 외래 객체 생성 후 seq 입력
			MemberVO memVo = new MemberVO();
			memVo.setSeq(memSeq);
			vo.setMemberVO(memVo);

			// 외래 객체 담은 후 service 실행
			int result = companyService.companyReg(vo);
	  	    rttr.addFlashAttribute("result", result);

	    return"redirect:/mypage/dashboard";
		}
}
