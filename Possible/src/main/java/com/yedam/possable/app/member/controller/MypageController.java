package com.yedam.possable.app.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.possable.app.common.code.service.CodeService;
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
	@Autowired CodeService codeService;

	//마이페이지 대쉬보드 페이지
		@GetMapping("/dashboard")
		public String dashboard(HttpSession session) {
			return "mypage/dashboard";
		}

		//마이페이지 회원정보수정 페이지
		@GetMapping("/editInfo")
		public String editInfo(Model model, @AuthenticationPrincipal MemberVO loginUser, HttpServletRequest request) {
			loginUser.getBirth();
			HttpSession session = request.getSession();
			
			loginUser = (MemberVO) session.getAttribute("member");
			System.out.println(loginUser.toString());
			System.out.println("야 뒤질래?"+ memberService.read(loginUser));
			model.addAttribute("memberList", memberService.read(loginUser));
			return "mypage/editInfo";
		}

		//마이페이지 견적관리 페이지
		@GetMapping("/eslist")
		public String eslist() {
			return "mypage/estimate/list";
		}

		//마이페이지 견적관리 상세 페이지
		@GetMapping("/esinfo")
		public String esinfo() {
			return "mypage/estimate/info";
		}

		//마이페이지 렌트내역 페이지
		@GetMapping("/rentHistory")
		public String rentHistory() {
			return "mypage/rentHistory";
		}

		//마이페이지 후기 작성 페이지
		@GetMapping("/review")
		public String review() {
			return "mypage/review/write";
		}

		//마이페이지 커뮤니티 관리 페이지
		@GetMapping("/community")
		public String community() {
			return "mypage/community";
		}

		//마이페이지 나의 문의 페이지
		@GetMapping("/qna")
		public String qna() {
			return "mypage/qna";
		}

		//업체전환 신청 페이지 페이지
		@GetMapping("/chngRole")
		public String chngRole(Model model, HttpSession session) {

			return "mypage/chngRole";
		}

		//업체전환 신청처리
		@PostMapping("/chngRole")
		public String chngRole(Model model, CompanyVO vo, RedirectAttributes rttr ) {
			
			// 외래 객체 담은 후 service 실행
			int result = companyService.companyReg(vo);
	  	    rttr.addFlashAttribute("result", result);

	    return"redirect:/mypage/dashboard";
		}
}