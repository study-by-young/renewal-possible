package com.yedam.possable.app.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.possable.app.common.domain.Criteria;
import com.yedam.possable.app.member.domain.MemberVO;
import com.yedam.possable.app.member.service.MemberService;

import lombok.extern.java.Log;

@Log
@Controller
public class MemberController {
	
	@Autowired MemberService memberService;
	@Autowired BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@PostMapping("/memberList")
	public String memberList(Model model, @ModelAttribute("cri") Criteria cri) {
		
		model.addAttribute("memberList",memberService.memberList(cri) );
		
		return "member/memberList";
	}
	//회원 등록
	@PostMapping("/memberInsert")
	public String memberInsert(MemberVO vo, RedirectAttributes rttr) {
		log.info("암호화 되기전" + vo.getPassword());
		//vo.setPassword(bcryptPasswordEncoder.encode(vo.getPassword())); // bcrypt 암호화
		log.info("암호화 된 후" + vo.getPassword());
		memberService.memberInsert(vo);
		rttr.addFlashAttribute("result", vo);
		
		return "redirect:/";
	}
	//회원 아이디 중복 체크
	@PostMapping("/idChk")
	@ResponseBody
	public int idChk(MemberVO vo) {
		int r = memberService.idChk(vo);
		System.out.println(r);
		return r;
	}
	
	//업체전환 신청 페이지
	@GetMapping("/chngRole")
	public String chngRole(Model model) {
		
		return "mypage/chngRole";
	}
		
}
