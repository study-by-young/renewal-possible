package com.yedam.possable.app.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.possable.app.member.domain.Criteria;
import com.yedam.possable.app.member.domain.MemberVO;
import com.yedam.possable.app.member.domain.PageVO;
import com.yedam.possable.app.member.service.MemberService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/admin/*")
public class AdminController {

    @GetMapping("/")
    public String dashboard(){
        return "admin/dashboard";
    }
    
	@Autowired MemberService memberService;
	
	//회원관리 - 전체조회
	@GetMapping("/memberList")
	public void memberList(Model model, @ModelAttribute("cri") Criteria cri) {
		System.out.println("cri========" + cri);
		int total = memberService.getTotalCount(cri);
		model.addAttribute("memberList",memberService.memberList(cri) );
		model.addAttribute("pageMaker", new PageVO(cri, total));
		
	}
	
	//회원관리 - 단건조회(수정페이지)
	@GetMapping("/memberOneSelect")
	public void memberOneSelect(Model model, MemberVO vo, @ModelAttribute("cri") Criteria cri) {	//bno 파라미터 -> 커맨드 객체
		model.addAttribute("member", memberService.memberOneSelect(vo));
	}
		
	//회원관리 - 수정처리
	@PostMapping("/memberOneSelect")
	public String memberUpdate(MemberVO vo, 
							 @ModelAttribute("cri") Criteria cri, 
							 RedirectAttributes rttr) {
			int result = memberService.memberUpdate(vo);
			if(result == 1) {
				rttr.addFlashAttribute("result", "success");			
			}
			System.out.println("실행중");
			return "redirect:/admin/memberList";		
		}
    
}
