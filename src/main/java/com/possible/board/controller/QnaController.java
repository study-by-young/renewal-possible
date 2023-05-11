package com.possible.board.controller;

import com.possible.common.criteria.domain.Criteria;
import com.possible.common.criteria.domain.PageVO;
import com.possible.community.qna_finish_delete.service.QnaAnswerService;
import com.possible.community.qna_finish_delete.service.QnaService;
import com.possible.member.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/qna")
public class QnaController {


    private final QnaService qnaService;
    private final MemberService memberService;
    private final QnaAnswerService qnaAnswerService;

    @GetMapping("/list")
    public void list(Model model
            , @ModelAttribute("cri") Criteria cri
            , Authentication authentication) {
        int total = qnaService.getTotalCount(cri);
        model.addAttribute("list", qnaService.getList(cri));
        model.addAttribute("pagination", new PageVO(cri, total));

        com.yedam.possable.app.member.domain.MemberVO loginUser = memberService.getLoginMember(authentication);
        model.addAttribute("user", memberService.memberOneSelect(loginUser));
    }

    @GetMapping("/get")
    public void get(Model model, com.yedam.possable.app.community.qna.domain.QnaVO vo
            , @ModelAttribute("cri") Criteria cri, Authentication authentication) {
        model.addAttribute("qna", qnaService.read(vo));
        int total = qnaService.getTotalCount(cri);
        model.addAttribute("pagination", new PageVO(cri, total));

        com.yedam.possable.app.member.domain.MemberVO loginUser = memberService.getLoginMember(authentication);
        model.addAttribute("user", memberService.memberOneSelect(loginUser));
    }

    @GetMapping("/insert")
    public void insertForm(Model model, @ModelAttribute("cri") Criteria cri, Authentication authentication) {

        int total = qnaService.getTotalCount(cri);
        model.addAttribute("pagination", new PageVO(cri, total));

        com.yedam.possable.app.member.domain.MemberVO loginUser = memberService.getLoginMember(authentication);
        model.addAttribute("user", memberService.memberOneSelect(loginUser));

    }

    @PostMapping("/insert")
    public String insert(Model model, RedirectAttributes rttr, com.yedam.possable.app.community.qna.domain.QnaVO vo, @ModelAttribute("cri") Criteria cri, Authentication authentication) {
        qnaService.insert(vo);
        rttr.addFlashAttribute("insertResult", vo.getSeq());

        int total = qnaService.getTotalCount(cri);
        model.addAttribute("pagination", new PageVO(cri, total));

        com.yedam.possable.app.member.domain.MemberVO loginUser = memberService.getLoginMember(authentication);
        model.addAttribute("user", memberService.memberOneSelect(loginUser));

        // 1:1문의글을 작성한 후 마이페이지 내 문의글 확인으로 이동
        return "redirect:/mypage/qna";
    }

    @GetMapping("/update")
    public void updateForm(Model model, com.yedam.possable.app.community.qna.domain.QnaVO vo
            , @ModelAttribute("cri") Criteria cri, Authentication authentication) {
        model.addAttribute("qna", qnaService.read(vo));

        int total = qnaService.getTotalCount(cri);
        model.addAttribute("pagination", new PageVO(cri, total));

        com.yedam.possable.app.member.domain.MemberVO loginUser = memberService.getLoginMember(authentication);
        model.addAttribute("user", memberService.memberOneSelect(loginUser));
    }

    @PostMapping("/update")
    public String update(Model model, RedirectAttributes rttr, com.yedam.possable.app.community.qna.domain.QnaVO vo
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
    public String delete(Model model, RedirectAttributes rttr, com.yedam.possable.app.community.qna.domain.QnaVO vo
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



    /* answer */
    // 전체조회(해당 문의의 답변만 조회)
    @GetMapping("/")
    public List<com.yedam.possable.app.community.qna.domain.QnaAnswerVO> getList(@RequestParam Long qnaSeq) {
        return qnaAnswerService.getList(qnaSeq);
    }

    // 단건조회 (답변의 seq를 파라미터로 받아서 조회한다.)
    @GetMapping("/{seq}")
    public com.yedam.possable.app.community.qna.domain.QnaAnswerVO read(@PathVariable Long seq, com.yedam.possable.app.community.qna.domain.QnaAnswerVO vo) {
        vo.setSeq(seq);
        return qnaAnswerService.read(vo);
    }

    @PostMapping("/")
    public com.yedam.possable.app.community.qna.domain.QnaAnswerVO insert(com.yedam.possable.app.community.qna.domain.QnaAnswerVO vo) {
        qnaAnswerService.insert(vo);
        return qnaAnswerService.read(vo);
    }

    @PutMapping("/")
    public com.yedam.possable.app.community.qna.domain.QnaAnswerVO update(@RequestBody com.yedam.possable.app.community.qna.domain.QnaAnswerVO vo) {
        qnaAnswerService.update(vo);
        return qnaAnswerService.read(vo);
    }

    // 삭제 (답변의 seq를 파라미터로 받아서 삭제한다.)
    @DeleteMapping("/{seq}")
    public boolean delete(@PathVariable Long seq, com.yedam.possable.app.community.qna.domain.QnaAnswerVO vo) {
        vo.setSeq(seq);
        int q = qnaAnswerService.delete(vo);
        return q == 1 ? true : false;
        // delete(vo)가 정상실행 되면 1을 반환, 1이 반환되면 true, 정상실행 되지 않으면 false.
    }


}
