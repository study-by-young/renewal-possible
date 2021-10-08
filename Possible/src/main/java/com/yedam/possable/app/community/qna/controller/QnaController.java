package com.yedam.possable.app.community.qna.controller;

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
import com.yedam.possable.app.community.qna.domain.QnaVO;
import com.yedam.possable.app.community.qna.service.QnaService;

@Controller
@RequestMapping("/community/qna")
public class QnaController {
	@Autowired
	QnaService qnaService;

	// 1:1 문의 리스트
	@GetMapping
	public String qnaList(Model model
				   , @ModelAttribute("cri") Criteria cri) {
		int total = qnaService.getTotalCount(cri);
		model.addAttribute("list", qnaService.getList(cri));
		model.addAttribute("pageMaker", new PageVO(cri, total));
		return "community/qna/list";
	}

	// 1:1 문의 상세
	@GetMapping("/view")
	public String qnaView(Model model,
                          QnaVO vo,
                          @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("qna", qnaService.read(vo));
		return "community/qna/view";
	}

	// 1:1 문의 수정 폼
    @GetMapping("/view/update")
    public String qnaUpdateForm(Model model,
                                QnaVO vo,
                                @ModelAttribute("cri") Criteria cri){
        model.addAttribute("qna", qnaService.read(vo));
	    return "community/qna/write";
    }

    // 1:1 문의 수정 처리
    @PostMapping("/view/update")
    public String qnaUpdate(RedirectAttributes rttr,
                            QnaVO vo,
                            @ModelAttribute("cri") Criteria cri) {

        int result = qnaService.update(vo);

        if (result == 1) {
            rttr.addFlashAttribute("updateResult", vo.getSeq());
        }

        rttr.addAttribute("seq", vo.getSeq());
        rttr.addAttribute("pageNum", cri.getPageNum());
        rttr.addAttribute("amount", cri.getAmount());

	    return "redirect:../";
    }

    // 1:1 문의 삭제
    @GetMapping("/view/delete")
    public String deleteQna(RedirectAttributes rttr,
                            QnaVO vo,
                            @ModelAttribute("cri") Criteria cri) {

        int result = qnaService.delete(vo);

        if (result == 1) {
            rttr.addFlashAttribute("deleteResult", vo.getSeq());
        }

        rttr.addAttribute("pageNum", cri.getPageNum());
        rttr.addAttribute("amount", cri.getAmount());

	    return "redirect:../../";
    }

    // 1:1 문의 답변 등록
    @GetMapping("/view/writeCmt")
    public String qnaWriteCmt(){
	    return "";
    }

    // 1:1 문의 작성 폼
    @GetMapping("/write")
    public String qnaWriteForm(){
	    return "community/qna/write";
    }

    // 1:1 문의 작성 처리
    @PostMapping("/write")
    public String qnaWrite(RedirectAttributes attributes,
                           QnaVO vo){
        qnaService.insert(vo);
        attributes.addFlashAttribute("insertResult", vo.getSeq());
	    return "redirect:/view";
    }
}
