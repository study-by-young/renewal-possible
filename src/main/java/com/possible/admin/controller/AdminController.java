package com.possible.admin.controller;

import com.possible.common.code.service.CodeService;
import com.possible.common.criteria.domain.Criteria;
import com.possible.common.criteria.domain.PageVO;
import com.possible.community.notice_finish_delete.service.NoticeService;
import com.possible.community.qna_finish_delete.service.QnaService;
import com.possible.community.report.service.ReportService;
import com.possible.company.domain.CompanyVO;
import com.possible.company.service.CompanyService;
import com.possible.member.service.MemberService;
import com.yedam.possable.app.community.report.domain.ReportVO;
import com.yedam.possable.app.member.domain.MemberVO;
import lombok.extern.java.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@Log
@Controller
@RequestMapping("/admin/*")
public class AdminController {
    @Autowired
    MemberService memberService;
    @Autowired
    CompanyService companyService;
    @Autowired
    CodeService codeService;
    @Autowired
    ReportService reportService;
    @Autowired
    NoticeService noticeService;
    @Autowired
    QnaService qnaService;

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session,Model model, @ModelAttribute("cri") Criteria cri) {

		model.addAttribute("notice", noticeService.getList(cri));
		model.addAttribute("comRegList", companyService.companyRegList());
		model.addAttribute("qnaList", qnaService.getList(cri));
		return "admin/dashboard";
    }

    // 회원 관리 리스트
    @GetMapping("/maintenance/member")
    public String memberList(Model model,
                             @ModelAttribute("cri") Criteria cri) {

        int total = memberService.getTotalCount(cri);
        model.addAttribute("pageMaker", new PageVO(cri, total));
        model.addAttribute("memberList", memberService.memberList(cri));
        System.out.println("memCri========" + cri);

        return "admin/maintenance/memberList";
    }

    // 회원 관리 회원 조회
    @GetMapping("/maintenance/member/view")
    public String memberView(Model model,
                             MemberVO vo,
                             @ModelAttribute("cri") Criteria cri) {
        model.addAttribute("memberView", memberService.memberOneSelect(vo));
        return "admin/maintenance/memberView";
    }

    //회원 관리 수정 처리
    @PostMapping("/maintenance/member/view")
    public String updateMember(MemberVO vo,
                               @ModelAttribute("cri") Criteria cri,
                               RedirectAttributes attributes) {
        int result = memberService.memberUpdate(vo);

        if (result == 1) {
            attributes.addFlashAttribute("result", "success");
        }

        return "redirect:/admin/maintenance/member";
    }

    //회원 관리 제명 처리
    @RequestMapping("/maintenance/member/view/ban")
    public String banMember() {
        return "";
    }

    // 미승인 업체 리스트
    @GetMapping("/maintenance/company")
    public String nonConfirmCompanyList(Model model,  @ModelAttribute("cri") Criteria cri){
    	int total = companyService.getTotalCount(cri);
    	model.addAttribute("comRegList", companyService.companyRegList());
    	model.addAttribute("pageMaker", new PageVO(cri, total));
        return "admin/maintenance/companyList";
    }

    // 미승인 업체 상세
    @GetMapping("/maintenance/company/view")
    public String nonConfirmCompanyView(Model model,
                                        CompanyVO vo){

    	vo = companyService.companyOneSelect(vo);

        String status = codeService.getCodeByValue(vo.getStatus()).getName();

        model.addAttribute("comRegList", vo);
        model.addAttribute("status", status);
        return "admin/maintenance/companyView";
    }

    // 미승인 업체 승인 처리
    @PostMapping("/maintenance/company/view/confirm")
    public String confirmCompany(CompanyVO vo,
                                 @RequestParam("memSeq") Long memSeq,
                                 RedirectAttributes attributes){
        MemberVO memVo = new MemberVO();
        memVo.setSeq(memSeq);
        memVo.setAuthor("ROLE_COMPANY");
        vo.setMemberVO(memVo);
        memberService.authorUpdate(memVo);

        int result = companyService.companyRegUpdate(vo);
        if (result == 1) {
            attributes.addFlashAttribute("result", "success");
        }
        return "redirect:/admin/maintenance/confirmCompany";
    }

    // 미승인 업체 승인 거부 처리
    @PostMapping("/maintenance/company/view/deny")
    public String denyCompany(CompanyVO vo,
                              RedirectAttributes attributes){
        int result = companyService.companyRegDelete(vo);
        if (result == 1) {
            attributes.addFlashAttribute("result", "success");
        }
        return "redirect:/admin/maintenance/confirmCompany";
    }

    // 승인 업체 리스트
    @GetMapping("/maintenance/confirmCompany")
    public String confirmCompanyList(Model model,
                                     @ModelAttribute("cri") Criteria cri){
        List<Map<String, Object>> companyList = new LinkedList<>();
        List<CompanyVO> voList = companyService.companyList(cri);

        for(CompanyVO vo : voList) {
            Map<String, Object> voMap = new HashMap<>();
            String status = codeService.getCodeByValue(vo.getStatus()).getName();
            voMap.put("companyVO", vo);
            voMap.put("status", status);
            companyList.add(voMap);
        }

        int total = companyService.getTotalCount(cri);
        model.addAttribute("pageMaker", new PageVO(cri, total));
        model.addAttribute("companyList",companyList);
        // model.addAttribute("status", status);
        System.out.println("cri========" + cri);

        return "admin/maintenance/cnfmCompanyList";
    }

    // 승인 업체 상세
    @GetMapping("/maintenance/confirmCompany/view")
    public String confirmCompanyView(Model model,CompanyVO vo){

    	vo = companyService.companyOneSelect(vo);

        String status = codeService.getCodeByValue(vo.getStatus()).getName();

        model.addAttribute("comRegList", vo);
        model.addAttribute("status", status);
        return "admin/maintenance/cnfmCompanyView";
    }

    // 승인 업체 미승인 처리
    @PostMapping("/maintenance/confirmCompany/ban")
    public String banConfirmCompany(CompanyVO vo,
            RedirectAttributes attributes){
    	  int result = companyService.companyRegDelete(vo);
          if (result == 1) {
              attributes.addFlashAttribute("result", "success");
          }
        return "redirect:/admin/maintenance/confirmCompany";
    }

    // 승인 업체 다시 승인 처리
    @PostMapping("/maintenance/confirmCompany/update")
    public String updateCompany(CompanyVO vo,
                                 @RequestParam("memSeq") Long memSeq,
                                 RedirectAttributes attributes){
        MemberVO memVo = new MemberVO();
        memVo.setSeq(memSeq);
        memVo.setAuthor("ROLE_COMPANY");
        vo.setMemberVO(memVo);
        memberService.authorUpdate(memVo);

        int result = companyService.companyRegUpdate(vo);
        if (result == 1) {
            attributes.addFlashAttribute("result", "success");
        }
        return "redirect:/admin/maintenance/confirmCompany";
    }



    // 신고 리스트
    @GetMapping("/maintenance/report")
    public String reportList(Model model,
                             @ModelAttribute("cri") Criteria cri){
        System.out.println("cri========" + cri);
        int total = reportService.getTotalCount(cri);
        model.addAttribute("reportList", reportService.getReportList(cri));
        System.out.println(reportService.getReportList(cri));
        model.addAttribute("pageMaker", new PageVO(cri, total));

        return "admin/maintenance/reportList";
    }

    // 신고 상세
    @GetMapping("/maintenance/report/view")
    public String reportView(Model model,
                             ReportVO vo,
                             @ModelAttribute("cri") Criteria cri){
        model.addAttribute("report", reportService.getReport(vo));

        return "admin/maintenance/reportView";
    }

    //신고 게시글작성자 정보 불러우기
    @GetMapping("getInfo")
    @ResponseBody
    public MemberVO reportOneSelect(String id, MemberVO vo) {
    	vo.setId(id);
    	return memberService.reportOneSelect(id);
    }
}
