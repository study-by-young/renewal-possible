package com.possible.community.qna.controller;

import com.possible.common.criteria.domain.Criteria;
import com.possible.common.criteria.domain.PageVO;
import com.possible.community.qna.service.QnaService;
import com.possible.member.service.MemberService;
import com.yedam.possable.app.community.qna.domain.QnaVO;
import com.yedam.possable.app.member.domain.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/qna/*")
public class QnaController {

	@Autowired
	QnaService qnaService;
	@Autowired
	MemberService memberService;
	
	@GetMapping("/list")
	public void list(Model model
				   , @ModelAttribute("cri") Criteria cri
				   , Authentication authentication) {
		int total = qnaService.getTotalCount(cri);
		model.addAttribute("list", qnaService.getList(cri));
		model.addAttribute("pagination", new PageVO(cri, total));
		
		MemberVO loginUser = memberService.getLoginMember(authentication);
        model.addAttribute("user", memberService.memberOneSelect(loginUser));
	}
	
	@GetMapping("/get")
	public void get(Model model, QnaVO vo
				  , @ModelAttribute("cri") Criteria cri, Authentication authentication) {
		model.addAttribute("qna", qnaService.read(vo));
		int total = qnaService.getTotalCount(cri);
		model.addAttribute("pagination", new PageVO(cri, total));
		
		MemberVO loginUser = memberService.getLoginMember(authentication);
		model.addAttribute("user", memberService.memberOneSelect(loginUser));
	}
	
	@GetMapping("/insert")
	public void insertForm(Model model, @ModelAttribute("cri") Criteria cri, Authentication authentication) {
		
		int total = qnaService.getTotalCount(cri);
		model.addAttribute("pagination", new PageVO(cri, total));
		
		MemberVO loginUser = memberService.getLoginMember(authentication);
		model.addAttribute("user", memberService.memberOneSelect(loginUser));
		
	}
	
	@PostMapping("/insert")
	public String insert(Model model, RedirectAttributes rttr, QnaVO vo, @ModelAttribute("cri") Criteria cri, Authentication authentication) {
		qnaService.insert(vo);
		rttr.addFlashAttribute("insertResult", vo.getSeq());
		
		int total = qnaService.getTotalCount(cri);
		model.addAttribute("pagination", new PageVO(cri, total));
		
		MemberVO loginUser = memberService.getLoginMember(authentication);
		model.addAttribute("user", memberService.memberOneSelect(loginUser));
		
		// 1:1문의글을 작성한 후 마이페이지 내 문의글 확인으로 이동
		return "redirect:/mypage/qna";
	}
	
	@GetMapping("/update")
	public void updateForm(Model model, QnaVO vo
						 , @ModelAttribute("cri") Criteria cri, Authentication authentication) {
		model.addAttribute("qna", qnaService.read(vo));
		
		int total = qnaService.getTotalCount(cri);
		model.addAttribute("pagination", new PageVO(cri, total));
		
		MemberVO loginUser = memberService.getLoginMember(authentication);
		model.addAttribute("user", memberService.memberOneSelect(loginUser));
	}
	
	@PostMapping("/update")
	public String update(Model model, RedirectAttributes rttr, QnaVO vo
					   , @ModelAttribute("cri") Criteria cri) {
		
		int result = qnaService.update(vo);
		
		if (result == 1) {
			rttr.addFlashAttribute("updateResult", vo.getSeq());
		}
		
		rttr.addAttribute("seq", vo.getSeq());
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		int total = qnaService.getTotalCount(cri);
		model.addAttribute("pagination", new PageVO(cri, total));
		
		return "redirect:/qna/get";
	}
	
	@GetMapping("/delete")
	public String delete(Model model, RedirectAttributes rttr, QnaVO vo
					   , @ModelAttribute("cri") Criteria cri) {
		
		int result = qnaService.delete(vo);
		
		if (result == 1) {
			rttr.addFlashAttribute("deleteResult", vo.getSeq());
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		int total = qnaService.getTotalCount(cri);
		model.addAttribute("pagination", new PageVO(cri, total));
		
		return "redirect:/mypage/qna";
	}
	
}
