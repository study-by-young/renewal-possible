package com.possible.community.faq.controller;

import com.possible.common.criteria.domain.Criteria;
import com.possible.common.criteria.domain.PageVO;
import com.possible.community.faq.domain.FaqVO;
import com.possible.community.faq.service.FaqService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/faq/*")
public class FaqController {

	@Autowired
	FaqService faqService;
	
	@GetMapping("/list")
	public void list(Model model, @ModelAttribute("cri") Criteria cri) {
		int total = faqService.getTotalCount(cri);
		model.addAttribute("list", faqService.getList(cri));
		model.addAttribute("pageMaker", new PageVO(cri, total));
	}
	
	@GetMapping("/category")
	@ResponseBody
	public List<FaqVO> category(@RequestParam (value="category", required=false) String category , RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
		System.out.println(category);
		faqService.getCategoryList(cri, category);
		//rttr.addAttribute("categoryTab", faqService.getCategoryList(cri, category));
		
		return faqService.getCategoryList(cri, category);
	}
	
	@GetMapping("/get")
	public void get(Model model, FaqVO vo
					, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("faq", faqService.read(vo));
	}
	
	@GetMapping("/insert")
	public void insertForm() {
		
	}
	
	@PostMapping("/insert")
	public String insert(RedirectAttributes rttr, FaqVO vo) {
		faqService.insert(vo);
		rttr.addFlashAttribute("insertResult", vo.getSeq());
		
		return "redirect:/faq/list";
	}
	
	@GetMapping("/update")
	public void updateForm(Model model, FaqVO vo
							, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("faq", faqService.read(vo));
	}
	
	@PostMapping("/update")
	public String update(RedirectAttributes rttr, FaqVO vo
						, @ModelAttribute("cri") Criteria cri) {
		
		int result = faqService.update(vo);
		
		if (result == 1) {
			rttr.addFlashAttribute("updateResult", vo.getSeq());
		}
		
		rttr.addAttribute("seq", vo.getSeq());
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/faq/list";
	}
	
	@ResponseBody
	@RequestMapping(value = "/delete")
	public int delete(@RequestParam(value = "seq") Long seq) {
		
		/*
		 * int result = faqService.delete(vo);
		 * 
		 * if (result == 1) { rttr.addFlashAttribute("deleteResult", vo.getSeq()); }
		 * 
		 * rttr.addAttribute("pageNum", cri.getPageNum()); rttr.addAttribute("amount",
		 * cri.getAmount());
		 */
		
		return faqService.delete(seq);
	}
 	
}
