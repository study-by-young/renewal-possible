package com.yedam.possable.app.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.possable.app.common.criteria.domain.Criteria;
import com.yedam.possable.app.common.criteria.domain.PageVO;
import com.yedam.possable.app.community.notice.service.NoticeService;
import com.yedam.possable.app.community.qna.service.QnaService;
import com.yedam.possable.app.community.report.domain.ReportVO;
import com.yedam.possable.app.community.report.service.ReportService;
import com.yedam.possable.app.common.code.service.CodeService;
import com.yedam.possable.app.company.domain.CompanyVO;
import com.yedam.possable.app.company.service.CompanyService;
import com.yedam.possable.app.member.domain.MemberVO;
import com.yedam.possable.app.member.service.MemberService;

import lombok.extern.java.Log;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
		model.addAttribute("list",qnaService.getList(cri));
		return "admin/dashboard";
    }

    // 회원 관리 리스트
    @GetMapping("/maintenance/member")
    public String memberList(Model model,
                             @ModelAttribute("cri") Criteria cri) {

        int total = memberService.getTotalCount(cri);
        model.addAttribute("memberList", memberService.memberList(cri));
        model.addAttribute("pageMaker", new PageVO(cri, total));

        return "admin/maintenance/memberList";
    }

    // 회원 관리 회원 조회
    @GetMapping("/maintenance/member/view")
    public String memberView(Model model,
                             MemberVO vo,
                             @ModelAttribute("cri") Criteria cri) {
        model.addAttribute("member", memberService.memberOneSelect(vo));
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

        System.out.println("cri========" + cri);
        int total = companyService.getTotalCount(cri);
        model.addAttribute("companyList",companyList);
        System.out.println(companyService.companyList(cri));
        model.addAttribute("pageMaker", new PageVO(cri, total));
        // model.addAttribute("status", status);

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
}
