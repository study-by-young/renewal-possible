package com.yedam.possable.app.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.possable.app.common.criteria.domain.Criteria;
import com.yedam.possable.app.common.criteria.domain.PageVO;
import com.yedam.possable.app.community.report.domain.ReportVO;
import com.yedam.possable.app.community.report.service.ReportService;
import com.yedam.possable.app.common.code.service.CodeService;
import com.yedam.possable.app.company.domain.CompanyVO;
import com.yedam.possable.app.company.service.CompanyService;
import com.yedam.possable.app.member.domain.MemberVO;
import com.yedam.possable.app.member.service.MemberService;

import lombok.extern.java.Log;

import java.security.Principal;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@Log
@Controller
@RequestMapping("/admin/*")
public class AdminController {

    @GetMapping("/")
    public String dashboard(){
        return "admin/dashboard";
    }

	@Autowired MemberService memberService;
	@Autowired CompanyService companyService;
	@Autowired CodeService codeService;
	@Autowired ReportService reportService;


	//회원관리 - 전체조회
	@GetMapping("maintenance/member")
	public String memberList(Model model, @ModelAttribute("cri") Criteria cri) {
		System.out.println("cri========" + cri);
		int total = memberService.getTotalCount(cri);
		model.addAttribute("memberList",memberService.memberList(cri) );
		model.addAttribute("pageMaker", new PageVO(cri, total));

		return "admin/maintenance/memberList";
	}

	//회원관리 - 단건조회(수정페이지)
	@GetMapping("maintenance/member/view")
	public String memberOneSelect(Model model, MemberVO vo, @ModelAttribute("cri") Criteria cri) {	//bno 파라미터 -> 커맨드 객체
		model.addAttribute("member", memberService.memberOneSelect(vo));

		return "admin/maintenance/memberView";
	}


	//회원관리 - 수정처리
	@PostMapping("maintenance/member/view")
	public String memberUpdate(MemberVO vo,
							 @ModelAttribute("cri") Criteria cri,
							 RedirectAttributes rttr) {
			int result = memberService.memberUpdate(vo);
			if(result == 1) {
				rttr.addFlashAttribute("result", "success");
			}
			return "redirect:/admin/maintenance/member";
		}

	//업체승인요청 페이지
	 @GetMapping("maintenance/company/regList")
	    public String companyRegList(Model model){
		 model.addAttribute("comRegList", companyService.companyRegList());
	        return "admin/maintenance/companyRegList";
	    }

	 //업체상세 페이지
	 @GetMapping("maintenance/company/view")
		 public String companyOneSelect(Model model, CompanyVO vo) {
		 vo = companyService.companyOneSelect(vo);

		 String status = codeService.getCodeByValue(vo.getStatus()).getName();

		 model.addAttribute("comRegList", vo);
		 model.addAttribute("status", status);
			 return "admin/maintenance/companyView";
		 }

	//업체승인 처리
	@PostMapping("maintenance/company/view/confirm")
		public String companyReg(CompanyVO vo, @RequestParam("memSeq") Long memSeq, RedirectAttributes rttr) {

			MemberVO memVo = new MemberVO();
			memVo.setSeq(memSeq);
			memVo.setAuthor("ROLE_COMPANY");
			vo.setMemSeq(memSeq);
			memberService.authorUpdate(memVo);

			int result = companyService.companyRegUpdate(vo);
			if(result == 1) {
				rttr.addFlashAttribute("result", "success");
			}
			return "redirect:/admin/maintenance/company";
		}

	//업체승인 거부
	@PostMapping("maintenance/company/view/ban")
	public String delete(CompanyVO vo, RedirectAttributes rttr) {
		int result = companyService.companyRegDelete(vo);
		if(result == 1) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/admin/maintenance/company";
	}

	//업체정보관리 페이지
	@GetMapping("maintenance/company")
		public String companyList(Model model, @ModelAttribute("cri") Criteria cri){
		List<Map<String, Object>> companyList = new LinkedList<Map<String,Object>>();
		List<CompanyVO> voList = companyService.companyList(cri);

		for(CompanyVO vo : voList) {
			Map<String, Object> voMap = new HashMap<String, Object>();
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

			return "admin/maintenance/companyList";
	    }

	//신고글 리스트
	@GetMapping("maintenance/report")
	public String getReportList(Model model, @ModelAttribute("cri") Criteria cri){
		System.out.println("cri========" + cri);
		int total = reportService.getTotalCount(cri);
		model.addAttribute("reportList",reportService.getReportList(cri));
		System.out.println(reportService.getReportList(cri));
		model.addAttribute("pageMaker", new PageVO(cri, total));

		return "admin/maintenance/reportList";
	}

	//신고글 한건
	@GetMapping("maintenance/report/view")
	public String getReport(Model model, ReportVO vo, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("report", reportService.getReport(vo));

		return "admin/maintenance/reportView";
	}

}
