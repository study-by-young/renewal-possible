package com.yedam.possable.app.community.faq.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.possable.app.common.criteria.domain.Criteria;
import com.yedam.possable.app.common.criteria.domain.PageVO;
import com.yedam.possable.app.community.faq.domain.FaqVO;
import com.yedam.possable.app.community.faq.service.FaqService;

@Controller
@RequestMapping("/community/faq")
public class FaqController {

	@Autowired
	FaqService faqService;

	// 자주 묻는 질문 리스트
	@GetMapping
	public String faqList(Model model, @ModelAttribute("cri") Criteria cri) {
		int total = faqService.getTotalCount(cri);
		model.addAttribute("list", faqService.getList(cri));
		model.addAttribute("pageMaker", new PageVO(cri, total));
		return "community/faq/list";
	}

	// 자주 묻는 질문 쓰기 폼
	@GetMapping("/write")
	public String writeFaqForm(Model model,
                           FaqVO vo,
                           @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("faq", faqService.read(vo));
        return "community/faq/write";
	}

	// 자주 묻는 질문 쓰기 처리
    @PostMapping("/write")
    public String writeFaq(RedirectAttributes rttr,
                           FaqVO vo){
        faqService.insert(vo);
        rttr.addFlashAttribute("insertResult", vo.getSeq());

	    return "redirect:../";
    }

    // 자주 묻는 질문 수정 폼
    @GetMapping("/update")
    public String faqUpdateForm(Model model,
                               FaqVO vo,
                               @ModelAttribute("cri") Criteria cri) {
        model.addAttribute("faq", faqService.read(vo));
        return "community/faq/write";
    }

    // 자주 묻는 질문 수정 처리
    @PostMapping("/update")
    public String updateFaq(RedirectAttributes rttr, FaqVO vo
            , @ModelAttribute("cri") Criteria cri) {

        int result = faqService.update(vo);

        if (result == 1) {
            rttr.addFlashAttribute("updateResult", vo.getSeq());
        }

        rttr.addAttribute("seq", vo.getSeq());
        rttr.addAttribute("pageNum", cri.getPageNum());
        rttr.addAttribute("amount", cri.getAmount());

	    return "redirect:../";
    }

    // 자주 묻는 질문 삭제
    @GetMapping("/delete")
    public String deleteFaq(RedirectAttributes rttr, FaqVO vo
            , @ModelAttribute("cri") Criteria cri) {

        int result = faqService.delete(vo);

        if (result == 1) {
            rttr.addFlashAttribute("deleteResult", vo.getSeq());
        }

        rttr.addAttribute("pageNum", cri.getPageNum());
        rttr.addAttribute("amount", cri.getAmount());

	    return "redirect:../";
    }
}
