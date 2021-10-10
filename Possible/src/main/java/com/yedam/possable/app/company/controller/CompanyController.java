package com.yedam.possable.app.company.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.yedam.possable.app.car.service.CarService;
import com.yedam.possable.app.member.service.MemberService;
import com.yedam.possable.app.rent.domain.RentHistoryVO;
import com.yedam.possable.app.rent.service.RentHistoryService;

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
    @Autowired
    RentHistoryService rentHistoryService;

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
        
        HttpSession session = request.getSession();
        session.setAttribute("cmpnSeq", companyVO.getSeq());
        
        
        return "company/dashboard";
    }

    //업체 정보 수정 페이지
    @GetMapping("/editInfo")
    public String editCompanyInfoForm(CompanyVO vo, Model model, @RequestParam Long cmpnSeq) {

        vo.setSeq(cmpnSeq);
        model.addAttribute("company", companyService.companyOneSelect(vo));

        return "company/editInfo";
    }

    // 업체 정보 수정 전 검증 폼
    @GetMapping("/editInfo/checkPw")
    public String beforeEditCompanyInfo(){
        return "company/editInfoBefore";
    }

    // 업체 정보 수정 처리
    @PostMapping("/editInfo/complete")
    public String editCompanyInfo(CompanyVO vo,
                                  Model model,
                                  RedirectAttributes attributes){

        int result = companyService.companyInfoUpdate(vo);
        if (result == 1) {
            attributes.addFlashAttribute("result", "success");
        }
        return "redirect:/company/dashboard";

    }

    // 업체 삭제 처리
    @GetMapping("/editInfo/delete")
    public String deleteCompany(){
        return "";
    }

    //업체 보유 렌트카 리스트
    @GetMapping("/car")
    public String companyCarList(CompanyVO vo,
                                 Model model,
                                 @RequestParam Long cmpnSeq){
        vo.setSeq(cmpnSeq);
        List<CarVO> carList = carService.getCompanyCarList(vo);
        model.addAttribute("companyCarList", carList);
        return "company/carList";
    }

    // 업체 보유 렌트카 상세
    @ResponseBody
    @GetMapping("/car/view")
    public CarVO companyCarOneSelect(CarVO vo, @RequestParam Long seq, @RequestParam Long cmpn) {
       vo.setSeq(seq);
       vo.setCmpnSeq(cmpn);
    	return carService.getCompanyCar(vo);          // JSP에서 company 시퀀스 넘겨줘야함
    }

    // 업체 렌트카 등록 폼
    @GetMapping("/car/register")
    public String carRegisterForm(){
        return "company/carRegForm";
    }

    // 업체 렌트카 등록 처리
    @PostMapping("/car/register")
    public String registerCar(){
        return "";
    }

    // 업체 렌트카 수정 폼
    @GetMapping("/car/update")
    public String carUpdateForm(){
        return "company/carRegForm";
    }

    // 업체 렌트카 등록 처리
    @PostMapping("/car/update")
    public String updateCar(){
        return "";
    }

    // 업체 렌트카 삭제 처리
    @ResponseBody
    @PostMapping("/car/delete")
    public int deleteCar(CarVO vo, HttpSession session,
                            @RequestParam(value = "chbox[]") List<String> chArr){

    	int result = 0;
        Long seq = 0L;
        
        for (String i : chArr) {
            seq = Long.parseLong(i);
            vo.setSeq(seq);
            
            carService.deleteCompanyCar(vo);
        }
        result = 1;

        return result;
    }

    // 견적 제출 리스트
    @GetMapping("/estSubmit")
    public String estSubmitList(){
        return "company/estSubmitList";
    }

    // 견적 제출 상세
    @GetMapping("/estSubmit/view")
    public String estSubmitView(){
        return "company/estSubmitView";
    }

    // 견적 제출 수정 폼
    @GetMapping("/estSubmit/update")
    public String estSubmitUpdateForm(){
        return "";
    }

    // 견적 제출 수정 처리
    @PostMapping("/estSubmit/update")
    public String updateEstSubmit(){
        return "";
    }

    // 렌트 내역 리스트
    @GetMapping("/rent")
    public String rentHistoryList(Model model, @RequestParam Long cmpnSeq){
    	model.addAttribute("rentHistoryList", rentHistoryService.getRentHistoryList(cmpnSeq));
    	
        return "company/rentHistoryList";
    }

    // 렌트 내역 상세
    @GetMapping("/rent/view")
    public String rentHistoryView(RentHistoryVO vo, Model model){
    	 model.addAttribute("rentHistory", rentHistoryService.getRentHistory(vo));
    	return "company/rentHistoryView";
    }
  

    // -----------------------------------------------------------------------------



    //차트 테스트
    @GetMapping("/incomeTest")
    public String incomeTest(Model model) {

        HashMap<String, Object> map = companyService.companyIncome();
        System.out.println(map);

        return "company/incomeTest";
    }
}

