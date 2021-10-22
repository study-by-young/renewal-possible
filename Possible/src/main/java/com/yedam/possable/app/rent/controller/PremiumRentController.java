package com.yedam.possable.app.rent.controller;

import java.security.Principal;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.possable.app.common.code.domain.BrandCodeVO;
import com.yedam.possable.app.common.code.domain.ModelCodeVO;
import com.yedam.possable.app.common.code.domain.TrimCodeVO;
import com.yedam.possable.app.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
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
@RequestMapping("/premiumRent")
public class PremiumRentController {
    @Autowired
    CodeService codeService;
    @Autowired
    PremiumRentService premiumRentService;
    @Autowired
    CompanyService companyService;
    @Autowired
    CarService carService;
    @Autowired
    MemberService memberService;

    // 견적 요청 리스트
    @GetMapping("/estimate")
    public String estimateList(Model model, @ModelAttribute("cri") Criteria cri) {
        int listCount = premiumRentService.getEstimateCount();
        cri.setAmount(5);
        model.addAttribute("estList", premiumRentService.getEstimateList(cri));
        model.addAttribute("pagination", new PageVO(cri, listCount));

        return "rent/prm/estimateList";
    }

    @ResponseBody
    @GetMapping("estimate/registerCheck")
    public int estimateRegisterAJax(Authentication authentication){
        int result = 0; // 로그인 후 이용 가능합니다.
        MemberVO loginMember = memberService.getLoginMember(authentication);
        if(authentication != null) {
            if (loginMember.getAuthor().equals("ROLE_USER") || loginMember.getAuthor().equals("ROLE_ADMIN")) {
                result = 1; // ACCESS
                if(premiumRentService.isRegistered(loginMember.getSeq())){
                    result = 4; // 이미 작성한 견적이 있습니다.
                }
            } else {
                result = 2; // 일반 회원만 이용 가능합니다.
            }
        }
        return result;
    }

    // 견적 요청 작성
    @GetMapping("estimate/register")
    public String estimateRegisterForm(Model model,
                                       Authentication authentication,
                                       RedirectAttributes attributes) {
        MemberVO loginUser = memberService.getLoginMember(authentication);
        if(loginUser == null){
            attributes.addFlashAttribute("alertMsg", "로그인 후 이용 가능합니다.");
            return "redirect:/login";
        }
        if(!loginUser.getAuthor().equals("ROLE_USER") && !loginUser.getAuthor().equals("ROLE_ADMIN")) {
            attributes.addFlashAttribute("alertMsg", "회원만 작성 가능합니다.");
            return "redirect:/premiumRent/estimate";
        }

        model.addAttribute("brands", codeService.getBrandList());
        model.addAttribute("carOpt", codeService.getCodesByParentCode("COP"));
        model.addAttribute("itemOpt", codeService.getCodesByParentCode("ITO"));

        return "rent/prm/estimateRegForm";
    }

    // 견적 요청 제출
    @PostMapping("estimate/register")
    public String estimateRegister(EstimateHistoryVO vo,
                                   Authentication authentication,
                                   @RequestParam("options") String[] optionsArr,
                                   @RequestParam("items") String[] itemsArr,
                                   RedirectAttributes attributes) {
        MemberVO loginUser = memberService.getLoginMember(authentication);

        if(loginUser == null){
            attributes.addFlashAttribute("alertMsg", "잘못된 접근입니다.");
            return "redirect:/login";
        }
        if(!loginUser.getAuthor().equals("ROLE_USER") && !loginUser.getAuthor().equals("ROLE_ADMIN")) {
            attributes.addFlashAttribute("alertMsg", "잘못된 접근입니다.");
            return "redirect:/premiumRent/estimate";
        }

        // 옵션 배열 -> 스트링
//        vo.setOptions(Arrays.toString(optionsArr));
//        vo.setItems(Arrays.toString(itemsArr));

        int result = premiumRentService.insertEstimate(vo);
        if (result != 0) {
            attributes.addFlashAttribute("resultMsg", "견적 요청이 등록되었습니다.");
        } else {
            attributes.addFlashAttribute("resultMsg",  "견적 요청이 등록되지 않았습니다.\n 잠시후 다시 시도해주세요.");
            return "redirect:/premiumRent/estimate";
        }
       attributes.addAttribute("seq", vo.getSeq());

        return "redirect:/premiumRent/estimate/view";
    }

    @ResponseBody
    @GetMapping("/estimate/viewCheck")
    public int viewCheck(Authentication authentication, @RequestParam("estimateSeq") Long seq){
        int result = 0; // 로그인 후 이용 가능합니다.
        MemberVO loginMember = memberService.getLoginMember(authentication);
        if(loginMember != null){
            if(loginMember.getAuthor().equals("ROLE_USER") || loginMember.getAuthor().equals("ROLE_ADMIN")){
                result = 1; // ACCESS
                if(!loginMember.getSeq().equals(premiumRentService.getEstimate(seq).getMemberVO().getSeq())){
                    result = 3; // 본인 견적만 조회 가능합니다.
                }
            } else {
                result = 2; // 일반 회원만 이용 가능합니다.
            }
        }
        return result;
    }


    // 견적 요청 상세
    @GetMapping("/estimate/view")
    public String estimateView(@RequestParam Long seq,
                               Authentication authentication,
                               RedirectAttributes attributes,
                               Model model,
                               @ModelAttribute("cri") Criteria cri) {
        MemberVO user = memberService.getLoginMember(authentication);
        EstimateHistoryVO estimate = premiumRentService.getEstimate(seq);

        if(authentication == null){
            attributes.addFlashAttribute("alertMsg", "로그인 후 이용 가능합니다.");
            return "redirect:/login";
        }

        if(!estimate.getMemberVO().getId().equals(user.getId())){
            if (!user.getAuthor().equals("ROLE_COMPANY") && !user.getAuthor().equals("ROLE_ADMIN")) {
                attributes.addFlashAttribute("alertMsg", "업체회원 및 작성자만 열람 가능합니다.");
                return "redirect:/premiumRent/estimate";
            }
        }

        model.addAttribute("estimate", premiumRentService.getEstimate(seq));

        return "rent/prm/estimateView";
    }

    // 견적 요청 삭제
    @GetMapping("/estimate/view/delete")
    public String estimateDelete(@RequestParam Long seq,
                                 Authentication authentication,
                                 HttpServletRequest request,
                                 RedirectAttributes attributes) {
        MemberVO user = memberService.getLoginMember(authentication);
        EstimateHistoryVO estimate = premiumRentService.getEstimate(seq);

        if (authentication == null) {
            attributes.addFlashAttribute("alertMsg", "잘못된 접근입니다.");
            return "redirect:" + request.getHeader("REFERER");
        }

        if(!estimate.getMemberVO().getId().equals(user.getId())){
            if (!user.getAuthor().equals("ROLE_ADMIN")) {
                attributes.addFlashAttribute("alertMsg", "작성자만 삭제 가능합니다.");
                return "redirect:" + request.getHeader("REFERER");
            }
        }

        int deleteResult = premiumRentService.deleteEstimate(seq);

        String resultMsg;
        if (deleteResult == 1) {
            resultMsg = "견적 요청이 삭제되었습니다.";
        } else {
            resultMsg = "견적 요청 삭제에 실패했습니다.\n잠시 후 다시 시도해주세요.";
        }
        attributes.addFlashAttribute("resultMsg", resultMsg);

        return "redirect:/premiumRent/estimate";
    }

    // 견적 요청 수정
    @GetMapping("estimate/view/update")
    public String estimateUpdateForm(@RequestParam Long seq,
                                     Authentication authentication,
                                     HttpServletRequest request,
                                     RedirectAttributes attributes,
                                     Model model) {
        if(authentication == null) {
            attributes.addFlashAttribute("alertMsg", "잘못된 접근입니다.");
            return "redirect:" + request.getHeader("REFERER");
        }

        EstimateHistoryVO estimate = premiumRentService.getEstimate(seq);
        MemberVO loginMember = memberService.getLoginMember(authentication);

        if(!estimate.getMemberVO().getId().equals(loginMember.getId())){
            if (!loginMember.getAuthor().equals("ROLE_ADMIN")) {
                attributes.addFlashAttribute("alertMsg", "작성자만 수정 가능합니다.");
                return "redirect:" + request.getHeader("REFERER");
            }
        }

        String carOptCode = codeService.getMasterCodeByName("차량 옵션").getCode();
        String itemOptCode = codeService.getMasterCodeByName("여행용품 옵션").getCode();
        List<BrandCodeVO> brands = codeService.getBrandList();
        List<ModelCodeVO> models = codeService.getModelList(estimate.getBrand());
        List<TrimCodeVO> trims = codeService.getTrimList(estimate.getTrim());

        model.addAttribute("brands", brands);
        model.addAttribute("models", models);
        model.addAttribute("trims", trims);
        model.addAttribute("estimate", premiumRentService.getEstimate(seq));
        model.addAttribute("carOpt", codeService.getCodesByParentCode(carOptCode));
        model.addAttribute("itemOpt", codeService.getCodesByParentCode(itemOptCode));

        return "rent/prm/estimateUpdateForm";
    }

    // 견적 요청 수정 제출
    @PostMapping("estimate/view/update")
    public String estimateUpdate(EstimateHistoryVO vo,
                                 Authentication authentication,
                                 HttpServletRequest request,
                                 @RequestParam("options") String[] optionsArr,
                                 @RequestParam("items") String[] itemsArr,
                                 RedirectAttributes attributes) {
        if(authentication == null) {
            attributes.addFlashAttribute("alertMsg", "잘못된 접근입니다.");
            return "redirect:" + request.getHeader("REFERER");
        }

        MemberVO loginMember = memberService.getLoginMember(authentication);

        if(!vo.getMemberVO().getSeq().equals(loginMember.getSeq())){
            if (!loginMember.getAuthor().equals("ROLE_ADMIN")) {
                attributes.addFlashAttribute("alertMsg", "작성자만 수정 가능합니다.");
                return "redirect:" + request.getHeader("REFERER");
            }
        }

        log.info(vo.toString());

        // 옵션 배열 -> 스트링
//        vo.setOptions(Arrays.toString(optionsArr));
//        vo.setItems(Arrays.toString(itemsArr));

        int updateResult = premiumRentService.updateEstimate(vo);

        String resultMsg;
        if (updateResult == 1) {
            resultMsg = "견적이 수정되었습니다.";
        } else {
            resultMsg = "견적 수정에 실패했습니다. \n잠시후 다시 시도해주세요.";
        }
        attributes.addFlashAttribute("resultMsg", resultMsg);
        attributes.addAttribute("seq", vo.getSeq());
        attributes.addAttribute("sPageNum", 1);

        return "redirect:/premiumRent/estimate/view";
    }

    // 견적 제출 리스트
    @GetMapping("/submit")
    public String submitList(Model model,
                             @RequestParam Long seq,
                             @RequestParam("sPageNum") int submitPageNum,
                             @ModelAttribute("cri") Criteria cri) {
        int submitCount = premiumRentService.getEstSubmitCount(seq);
        cri.setAmount(5);
        cri.setPageNum(submitPageNum);
        List<EstiSubmitHistoryVO> submitList = premiumRentService.getEstSubmitListByEstiSeq(cri, seq);
        model.addAttribute("submitList",submitList);
        model.addAttribute("pagination", new PageVO(cri,submitCount));

        return "rent/prm/submitList";
    }

    // 견적 제출 수정
    @GetMapping("submit/update")
    public String submitUpdateForm(@ModelAttribute("seq") Long estimateSeq,
                                   @ModelAttribute("sSeq") Long submitSeq,
                                   Authentication authentication,
                                   RedirectAttributes attributes,
                                   HttpServletRequest request,
                                   Model model) {
        MemberVO loginUser = memberService.getLoginMember(authentication);

        if (loginUser == null) {
            attributes.addFlashAttribute("alertMsg", "잘못된 접근입니다.");
            return "redirect:" + request.getHeader("REFERER");
        }

        EstiSubmitHistoryVO submitHistoryVO = premiumRentService.getEstSubmit(submitSeq);

        if (!loginUser.getAuthor().equals("ROLE_COMPANY") && !loginUser.getAuthor().equals("ROLE_ADMIN")) {
            attributes.addFlashAttribute("alertMsg", "업체회원만 수정 가능합니다.");
            if(loginUser.getSeq().equals(submitHistoryVO.getCompanyVO().getMemberVO().getSeq())){
                attributes.addFlashAttribute("alertMsg", "작성자만 수정 가능합니다.");
            }
            return "redirect:" + request.getHeader("REFERER");
        }

        CompanyVO companyVO = companyService.getCompanyByMemSeq(loginUser);
        model.addAttribute("carList", carService.getCompanyCarList(companyVO));
        model.addAttribute("itemOpt", companyService.getCompanyItems(companyVO));
        model.addAttribute("submit", submitHistoryVO);

        return "rent/prm/submitUpdateForm";
    }

    // 견적 제출 수정 처리
    @PostMapping("submit/update")
    public String submitUpdate(@RequestParam("seq") Long estimateSeq,
                               @RequestParam("sSeq") Long submitSeq,
                               RedirectAttributes attributes) {


        attributes.addAttribute("seq", estimateSeq);
        return "redirect:/premiumRent/estimate/view";
    }

    // 견적 제출 삭제 처리
    @GetMapping("submit/delete")
    public String deleteSubmit(@RequestParam("seq") Long submitSeq,
                               Authentication authentication,
                               HttpServletRequest request,
                               RedirectAttributes attributes) {
        EstiSubmitHistoryVO submit = premiumRentService.getEstSubmit(submitSeq);
        MemberVO user = memberService.getLoginMember(authentication);

        if (authentication == null) {
            attributes.addFlashAttribute("alertMsg", "잘못된 접근입니다.");
            return "redirect:" + request.getHeader("REFERER");
        }
        log.info(submit.getCompanyVO().getMemberVO().toString());
        if(!submit.getCompanyVO().getMemberVO().getId().equals(user.getId())){
            if (!user.getAuthor().equals("ROLE_ADMIN")) {
                attributes.addFlashAttribute("alertMsg", "작성자만 삭제 가능합니다.");
                return "redirect:" + request.getHeader("REFERER");
            }
        }

        int result = premiumRentService.deleteEstSubmit(submitSeq);

        String resultMsg;
        if (result == 1) {
            resultMsg = "견적이 삭제되었습니다.";
        } else {
            resultMsg = "견적 삭제에 실패했습니다.\n잠시 후 다시 시도해주세요.";
        }
        attributes.addFlashAttribute("resultMsg", resultMsg);
        attributes.addAttribute("seq", submit.getEstimateHistoryVO().getSeq());

        return "redirect:/premiumRent/estimate/view";
    }

    // 견적 제출 예약 처리
    @GetMapping("submit/view/bookCmpl")
    public String submitBookComplete() {
        return "rent/prm/bookComplete";
    }

    // 견적 제출 등록 폼
    @GetMapping("submit/register")
    public String submitRegForm(@ModelAttribute("seq") Long estimateSeq,
                                Authentication authentication,
                                RedirectAttributes attributes,
                                HttpServletRequest request,
                                Model model) {
        MemberVO loginUser = memberService.getLoginMember(authentication);

        if (loginUser == null) {
            attributes.addFlashAttribute("alertMsg", "잘못된 접근입니다.");
            return "redirect:" + request.getHeader("REFERER");
        }
        if (!loginUser.getAuthor().equals("ROLE_COMPANY") && !loginUser.getAuthor().equals("ROLE_ADMIN")) {
            attributes.addFlashAttribute("alertMsg", "업체회원만 작성 가능합니다.");
            return "redirect:" + request.getHeader("REFERER");
        }

        CompanyVO companyVO = companyService.getCompanyByMemSeq(loginUser);
        model.addAttribute("carList", carService.getCompanyCarList(companyVO));

        String carOptCode = codeService.getMasterCodeByName("차량 옵션").getCode();
        model.addAttribute("carOpt", codeService.getCodesByParentCode(carOptCode));
        model.addAttribute("itemOpt", companyService.getCompanyItems(companyVO));

        EstimateHistoryVO estimate = premiumRentService.getEstimate(estimateSeq);
        model.addAttribute("estimate", estimate);
        return "rent/prm/submitRegForm";
    }

    // 견적 제출 등록
    @PostMapping("submit/register")
    public String registerSubmit(EstiSubmitHistoryVO submitVO,
                                 RedirectAttributes attributes,
                                 Authentication authentication,
                                 @RequestParam("estiSeq") Long estimateSeq,
                                 @RequestParam("selectCar") Long carSeq) {
        MemberVO loginUser = memberService.getLoginMember(authentication);
        if (loginUser == null) {
            attributes.addFlashAttribute("alertMsg", "잘못된 접근입니다.");
            attributes.addAttribute("seq",estimateSeq);
            return "redirect:/premiumRent/estimate/view";
        }
        CompanyVO companyVO = companyService.getCompanyByMemSeq(loginUser);

        CarVO carVO = new CarVO();
        carVO.setSeq(carSeq);
        carVO = carService.getCar(carVO);
        carVO.setStatus("CST02");
        carService.updateStatus(carVO);

        EstimateHistoryVO estimateHistoryVO = premiumRentService.getEstimate(estimateSeq);

        submitVO.setCompanyVO(companyVO);
        submitVO.setCarVO(carVO);
        submitVO.setEstimateHistoryVO(estimateHistoryVO);

        int result = premiumRentService.insertEstSubmit(submitVO);

        if(result != 0){
            attributes.addFlashAttribute("resultMsg", "견적이 제출되었습니다.");
        } else {
            attributes.addFlashAttribute("resultMsg", "견적 제출에 실패했습니다.");
        }
        attributes.addAttribute("seq", submitVO.getEstimateHistoryVO().getSeq());
        return "redirect:/premiumRent/estimate/view";
    }
}
