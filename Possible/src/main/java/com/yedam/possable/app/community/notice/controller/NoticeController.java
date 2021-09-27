package com.yedam.possable.app.community.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.possable.app.community.notice.domain.NoticeVO;
import com.yedam.possable.app.community.notice.service.NoticeService;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
	
	@GetMapping("/list")
	public void list(Model model) {
		model.addAttribute("list", noticeService.getList());
		model.addAttribute("title", "공지사항 리스트");
	}
	
	@GetMapping("/get")
	public void get(Model model, NoticeVO vo) {
		model.addAttribute("notice", noticeService.read(vo));
		model.addAttribute("title", "단건 조회");
	}
	
	@GetMapping("/insert")
	public void insertForm(Model model) {
		model.addAttribute("title", "등록폼");
	}
	
	@PostMapping("/insert")
	public String insert(Model model, RedirectAttributes rttr, NoticeVO vo) {
		model.addAttribute("title", "등록");
		noticeService.insert(vo);
		rttr.addFlashAttribute("insertResult", vo.getSeq());
		
		return "redirect:/notice/list";
	}
	
	@GetMapping("/update")
	public void updateForm(Model model, NoticeVO vo) {
		model.addAttribute("title", "수정폼");
		model.addAttribute("notice", noticeService.read(vo));
	}
	
	@PostMapping("/update")
	public String update(RedirectAttributes rttr, NoticeVO vo) {
		
		int result = noticeService.update(vo);
		
		if (result == 1) {
			rttr.addFlashAttribute("updateResult", vo.getSeq());
		}
		
		rttr.addAttribute("seq", vo.getSeq());
		
		return "redirect:/notice/get";
	}

	@GetMapping("/delete")
	public String delete(RedirectAttributes rttr, NoticeVO vo) {
		
		int result = noticeService.delete(vo);
		
		if (result == 1) {
			rttr.addFlashAttribute("deleteResult", vo.getSeq());
		}
		
		return "redirect:/notice/list";
	}
}
