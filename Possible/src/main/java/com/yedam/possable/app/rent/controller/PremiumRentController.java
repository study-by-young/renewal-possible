package com.yedam.possable.app.rent.controller;

import java.security.Principal;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.possable.app.car.domain.CarVO;
import com.yedam.possable.app.car.service.CarService;
import com.yedam.possable.app.common.code.domain.CodeSubVO;
import com.yedam.possable.app.common.code.service.CodeService;
import com.yedam.possable.app.common.criteria.domain.Criteria;
import com.yedam.possable.app.common.criteria.domain.PageVO;
import com.yedam.possable.app.company.domain.CompanyVO;
import com.yedam.possable.app.company.service.CompanyService;
import com.yedam.possable.app.member.domain.MemberVO;
import com.yedam.possable.app.rent.domain.EstiSubmitHistoryVO;
import com.yedam.possable.app.rent.domain.EstimateHistoryVO;
import com.yedam.possable.app.rent.service.PremiumRentService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/premiumRent/*")
public class PremiumRentController {
    @Autowired
    CodeService codeService;
    @Autowired
    PremiumRentService premiumRentService;
    @Autowired
    CompanyService companyService;
    @Autowired
    CarService carService;

    // 견적 요청 리스트
    @GetMapping("/estimate")
    public String estimateList(Model model, @ModelAttribute("cri") Criteria cri) {
        Map<String, Object> attr = new LinkedHashMap<>();
        int listCount = premiumRentService.getEstimateCount();
        List<Map<String, Object>> estimateList = premiumRentService.getEstimateList(cri);


        attr.put("estList", estimateList);
        attr.put("pagination", new PageVO(cri, listCount));
        model.addAllAttributes(attr);

        return "rent/prm/estimateList";
    }

    // 견적 요청 작성
    @GetMapping("estimate/register")
    public String estimateRegisterForm(Model model) {
        String carOptCode = codeService.getMasterCodeByName("차량 옵션").getCode();
        String itemOptCode = codeService.getMasterCodeByName("캠핑 옵션").getCode();
        model.addAttribute("brands", codeService.getBrandList());
        model.addAttribute("carOpt", codeService.getCodesByParentCode(carOptCode));
        model.addAttribute("itemOpt", codeService.getCodesByParentCode(itemOptCode));

        return "/rent/prm/estimateRegForm";
    }

    // 견적 요청 제출
    @PostMapping("estimate/register")
    public String estimateRegister(EstimateHistoryVO vo,
                                 @RequestParam("options") String[] optionsArr,
                                 @RequestParam("items") String[] itemsArr,
                                 RedirectAttributes attributes) {
        // 옵션 배열 -> 스트링
        vo.setOptions(Arrays.toString(optionsArr));
        vo.setItems(Arrays.toString(itemsArr));

        // 코드 -> 네임 변환
        vo.setSegment(codeService.getCodeByValue(vo.getSegment()).getName());
        vo.setBrand(codeService.getBrand(vo.getBrand()).getName());
        vo.setModel(codeService.getModel(vo.getModel()).getName());
        vo.setTrim(codeService.getTrim(vo.getTrim()).getName());

        int result = premiumRentService.insertEstimate(vo);
        String resultStr = "";
        if (result != 0) {
            resultStr = "견적 요청이 등록되었습니다.";
        } else {
            resultStr = "견적 요청이 등록되지 않았습니다.\n 잠시후 다시 시도해주세요.";
        }

        attributes.addFlashAttribute("resultMsg", resultStr);

        return "redirect:./view";
    }

    // 견적 요청 상세
    @GetMapping("/estimate/view")
    public String estimateView(@RequestParam Long seq,
                               Principal principal,
                               RedirectAttributes attributes,
                               HttpServletRequest request,
                               Model model,
                               @ModelAttribute Criteria cri) {
        
//        if(user == null || user.getAuthor().equals("USER")){
//            String denyMsg = "업체회원만 열람 가능합니다.";
//            attributes.addFlashAttribute("denyMsg", denyMsg);
//
//            return "redirect:" + request.getHeader("REFERER");
//        }

        model.addAttribute("estimate", premiumRentService.getEstimate(seq));

        return "rent/prm/estimateView";
    }

    // 견적 요청 삭제
    @GetMapping("/estimate/view/delete")
    public String estimateDelete(@RequestParam Long seq,
                                 RedirectAttributes attributes,
                                 HttpServletRequest request,
                                 Principal principal) {
        // principal 객체로 견적 소유자 검증(id or seq)
        EstimateHistoryVO vo = (EstimateHistoryVO) premiumRentService.getEstimate(seq).get("estimate");
        String user = ((MemberVO) principal).getId();
        String writer = vo.getMemSeq().toString();

        if (user == null || !user.equals(writer)) {
            attributes.addFlashAttribute("deleteMsg", "작성자만 삭제 가능합니다.");
            return "redirect:" + request.getHeader("REFERER");
        }

        int deleteResult = premiumRentService.deleteEstimate(seq);

        String resultMsg = "";
        if (deleteResult == 1) {
            resultMsg = "견적 요청이 삭제되었습니다.";
        } else {
            resultMsg = "견적 요청 삭제에 실패했습니다.\n잠시 후 다시 시도해주세요.";
        }
        attributes.addFlashAttribute("deleteMsg", deleteResult);

        return "redirect:../..";
    }

    // 견적 요청 수정
    @GetMapping("estimate/view/update")
    public String estimateUpdateForm(@RequestParam Long seq,
                                     Principal principal,
                                     HttpServletRequest request,
                                     RedirectAttributes attributes,
                                     Model model) {
        // principal 객체로 견적 소유자 검증(id or seq)
        EstimateHistoryVO vo = (EstimateHistoryVO) premiumRentService.getEstimate(seq).get("estimate");
        String user = ((MemberVO) principal).getId();
        String writer = vo.getMemSeq().toString();

        if (user == null || !user.equals(writer)) {
            attributes.addFlashAttribute("updateMsg", "작성자만 수정 가능합니다.");
            return "redirect:" + request.getHeader("REFERER");
        }
        model.addAttribute("estimate", premiumRentService.getEstimate(seq));

        return "rent/prm/estimateRegForm";
    }

    // 견적 요청 수정 제출
    @PostMapping("estimate/view/update")
    public String estimateUpdate(EstimateHistoryVO vo,
                                 RedirectAttributes attributes) {
        int updateResult = premiumRentService.updateEstimate(vo);

        String resultMsg = "";
        if (updateResult == 1) {
            resultMsg = "견적이 수정되었습니다.";
        } else {
            resultMsg = "견적 수정에 실패했습니다. \n잠시후 다시 시도해주세요.";
        }
        attributes.addFlashAttribute("updateMsg", resultMsg);
        attributes.addAttribute("seq", vo.getSeq());

        return "redirect:../";
    }

    // 견적 제출 리스트
    @GetMapping("/submit")
    public String submitList(Model model,
                               @RequestParam Long seq,
                               HttpServletRequest request,
                               Principal principal) {
        Map<String, Object> estimate = premiumRentService.getEstimate(seq);
//        if(principal == null){
//            return "redirect:" + request.getHeader("REFERER");
//        }
//        MemberVO memberVO = ((MemberVO) principal);
//        CompanyVO companyVO = companyService.getCompanyByMemSeq(memberVO);      // pricipal에서 업체 시퀀스 조회
//        List<CarVO> carList = carService.getCompanyCarList(companyVO);          // 업체시퀀스로 카 리스트 조회
//        List<String> companyItems = companyService.getCompanyItems(companyVO);  // 업체시퀀스로 업체아이템 조회

        MemberVO memberVO = new MemberVO();
        memberVO.setSeq(22L);
        CompanyVO companyVO = companyService.getCompanyByMemSeq(memberVO);      // pricipal에서 업체 시퀀스 조회
        List<CarVO> carList = carService.getCompanyCarList(companyVO);          // 업체시퀀스로 카 리스트 조회
        List<String> companyItems = companyService.getCompanyItems(companyVO);  // 업체시퀀스로 업체아이템 조회
        String carOptionCode = codeService.getMasterCodeByName("차량 옵션").getCode();
        List<CodeSubVO> carOptions = codeService.getCodesByParentCode(carOptionCode);

        model.addAttribute("companyVO", companyVO);
        model.addAttribute("carList", carList);
        model.addAttribute("companyItems", companyItems);
        model.addAttribute("estimate", estimate);
        model.addAttribute("carOptions", carOptions);
        return "rent/prm/submitList";
    }

    // 견적 제출 상세
    @PostMapping("submit/view")
    public String submitView(RedirectAttributes attributes,
                                   EstiSubmitHistoryVO vo) {
        return "/rent/prm/submitView";
    }

    // 견적 제출 수정
    @GetMapping("submit/view/update")
    public String submitUpdateForm(){
    	
        return "rent/prm/submitRegForm";
    }

    // 견적 제출 수정 처리
    @PostMapping("submit/view/update")
    public String submitUpdate(){
        return "redirect:../";
    }

    // 견적 제출 삭제 처리
    @GetMapping("submit/view/delete")
    public String deleteSubmit(){
        return "redirect:../../";
    }

    // 견적 제출 예약 처리
    @GetMapping("submit/view/bookCmpl")
    public String submitBookComplete(){
        return "rent/prm/bookComplete";
    }

    // 견적 제출 등록 폼
    @GetMapping("submit/register")
    public String submitRegForm(){
        return "rent/prm/submitRegForm";
    }

    // 견적 제출 등록
    @PostMapping("submit/register")
    public String registerSubmit(){
        return "redirect:view";
    }
}
