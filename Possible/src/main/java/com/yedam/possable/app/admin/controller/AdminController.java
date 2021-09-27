package com.yedam.possable.app.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.possable.app.member.domain.Criteria;
import com.yedam.possable.app.member.domain.PageVO;
import com.yedam.possable.app.member.service.MemberService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

    @GetMapping("/")
    public String dashboard(){
        return "admin/dashboard";
    }
    
	@Autowired MemberService memberService;
	
	@GetMapping("/memberList")
	public void memberList(Model model, @ModelAttribute("cri") Criteria cri) {
		System.out.println("cri========" + cri);
		int total = memberService.getTotalCount(cri);
		model.addAttribute("memberList",memberService.memberList(cri) );
		model.addAttribute("pageMaker", new PageVO(cri, total));
		
	}
    
}
