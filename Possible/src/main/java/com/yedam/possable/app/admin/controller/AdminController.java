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
import com.yedam.possable.app.common.code.mapper.CodeMapper;
import com.yedam.possable.app.common.code.service.CodeService;
import com.yedam.possable.app.company.domain.CompanyVO;
import com.yedam.possable.app.company.service.CompanyService;
import com.yedam.possable.app.member.domain.MemberVO;
import com.yedam.possable.app.member.service.MemberService;

import lombok.extern.java.Log;

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


	//회원관리 - 전체조회
	@GetMapping("/memberList")
	public void memberList(Model model, @ModelAttribute("cri") Criteria cri) {
		System.out.println("cri========" + cri);
		int total = memberService.getTotalCount(cri);
		model.addAttribute("memberList",memberService.memberList(cri) );
		model.addAttribute("pageMaker", new PageVO(cri, total));

	}

	//회원관리 - 단건조회(수정페이지)
	@GetMapping("/memberOneSelect")
	public void memberOneSelect(Model model, MemberVO vo, @ModelAttribute("cri") Criteria cri) {	//bno 파라미터 -> 커맨드 객체
		model.addAttribute("member", memberService.memberOneSelect(vo));
	}

	//회원관리 - 수정처리
	@PostMapping("/memberOneSelect")
	public String memberUpdate(MemberVO vo,
							 @ModelAttribute("cri") Criteria cri,
							 RedirectAttributes rttr) {
			int result = memberService.memberUpdate(vo);
			if(result == 1) {
				rttr.addFlashAttribute("result", "success");
			}
			return "redirect:/admin/memberList";
		}

	//업체승인요청 페이지
	 @GetMapping("/companyRegList")
	    public String companyRegList(Model model){
		 model.addAttribute("comRegList", companyService.companyRegList());
	        return "admin/companyRegList";
	    }

	 //업체상세 페이지
	 @GetMapping("/companyOneSelect")
		 public String companyOneSelect(Model model, CompanyVO vo) {
		 vo = companyService.companyOneSelect(vo);
		 
		 String status = codeService.getCodeByValue(vo.getStatus()).getName();
		 
		 model.addAttribute("comRegList", vo);
		 model.addAttribute("status", status);
			 return "admin/companyOneSelect";
		 }

	//업체승인 처리
	@PostMapping("/companyOneSelect")
		public String companyReg(CompanyVO vo, @RequestParam("memSeq") Long memSeq, RedirectAttributes rttr) {
			
			MemberVO memVo = new MemberVO();
			memVo.setSeq(memSeq);
			memVo.setAuthor("COMPANY");
			vo.setMemSeq(memSeq);
			memberService.authorUpdate(memVo);
		
			int result = companyService.companyRegUpdate(vo);
			if(result == 1) {
				rttr.addFlashAttribute("result", "success");
			}
			return "redirect:/admin/companyList";
		}

	//업체승인 거부
	@PostMapping("/companyRegDelete")
	public String delete(CompanyVO vo, RedirectAttributes rttr) {
		int result = companyService.companyRegDelete(vo);
		if(result == 1) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/admin/companyRegList";
	}

	//업체정보관리 페이지
	@GetMapping("/companyList")
		public String companyList(Model model, @ModelAttribute("cri") Criteria cri){
		System.out.println("cri========" + cri);
		int total = companyService.getTotalCount(cri);
		model.addAttribute("companyList",companyService.companyList(cri) );
		System.out.println(companyService.companyList(cri));
		model.addAttribute("pageMaker", new PageVO(cri, total));
			return "admin/companyList";
	    }

		 
//	 //업체상세 페이지(아작스 테스트..)
//	 @GetMapping("/{seq}")
//	 @ResponseBody
//		 public CompanyVO companyOne(@PathVariable Long seq, CompanyVO vo) {
//		 vo.setSeq(seq);
//		 return  companyService.companyOneSelect(vo);
//
//	 }



}
