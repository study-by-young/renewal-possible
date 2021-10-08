package com.yedam.possable.app.company.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.yedam.possable.app.car.service.CarService;
import com.yedam.possable.app.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.possable.app.car.domain.CarVO;
import com.yedam.possable.app.company.domain.CompanyVO;
import com.yedam.possable.app.company.service.CompanyService;
import com.yedam.possable.app.member.domain.MemberVO;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/company/*")
public class CompanyController {
    @Autowired
    CompanyService companyService;
    @Autowired
    CarService carService;
    @Autowired
    MemberService memberService;

    //업체 대시보드
    @GetMapping("/dashboard")
    public String dashboard(HttpServletRequest request,
                            RedirectAttributes attributes,
                            Authentication authentication) {
        MemberVO loginUser = memberService.getLoginMember(authentication);
        CompanyVO companyVO = companyService.getCompanyByMemSeq(loginUser);
        if (companyVO == null) {
            attributes.addFlashAttribute("denyMsg", "업체회원이 아닙니다.");
            return "redirect:" + request.getHeader("REFERER");
        }
        return "company/companyDashboard";
    }

    //업체 정보수정페이지
    @GetMapping("/info/edit")
    public String companyEditInfo(CompanyVO vo, Model model, @RequestParam Long seq) {

    	vo.setSeq(seq);
    	model.addAttribute("company", companyService.companyOneSelect(vo));

    	return "company/companyEditInfo";
    }

    //정보수정처리
    @PostMapping("/info/edit")
    public String companyInfoUpdate(CompanyVO vo, Model model, @RequestParam("seq") Long seq, RedirectAttributes rttr) {

		int result = companyService.companyInfoUpdate(vo);
		if(result == 1) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:edit";


    }

    //업체 보유 렌트카 리스트
    @GetMapping("/companyCarList")
    public String companyCarList(CompanyVO vo, Model model, @RequestParam Long seq ) {
    	vo.setSeq(seq);
    	List<CarVO> carList = carService.getCompanyCarList(vo);
        model.addAttribute("companyCarList", carList);
        return "company/companyCarList";
    }

    //업체 보유 렌트카 한건
    @GetMapping("/companyCarOneSelect")
    @ResponseBody
    public CarVO companyCarOneSelect(CarVO vo, @RequestParam Long seq) {
        return carService.getCompanyCar(seq, new CompanyVO());          // JSP에서 company 시퀀스 넘겨줘야함
    }

    //업체 보유 렌트카 삭제
    @PostMapping("/companyCarDel")
    @ResponseBody
    public int companyCarDel(CarVO vo, @RequestParam(value = "chbox[]") List<String> chArr) {

        int result = 0;
        Long seq = 0L;

        for (String i : chArr) {
            seq = Long.parseLong(i);
            vo.setSeq(seq);
            carService.deleteCompanyCar(seq, new CompanyVO());
        }
        result = 1;

        return result;

    }

    //차트 테스트
    @GetMapping("/incomeTest")
    public String incomeTest(Model model) {

    	HashMap<String, Object> map = companyService.companyIncome();
    	System.out.println(map);

        return "company/incomeTest";
    }
}

