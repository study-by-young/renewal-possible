package com.yedam.possable.app.rent.controller;

import com.yedam.possable.app.car.domain.CarVO;
import com.yedam.possable.app.common.domain.Criteria;
import com.yedam.possable.app.common.domain.PageVO;
import com.yedam.possable.app.common.mapper.CodeMapper;
import com.yedam.possable.app.member.domain.MemberVO;
import com.yedam.possable.app.rent.domain.EstiSubmitHistoryVO;
import com.yedam.possable.app.rent.domain.EstimateHistoryVO;
import com.yedam.possable.app.rent.service.PremiumRentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;
import java.util.*;


@Controller
@RequestMapping("/premiumRent/*")
public class PremiumRentController {
    @Autowired CodeMapper codeMapper;
    @Autowired PremiumRentService premiumRentService;

    // 견적 요청 리스트
    @GetMapping("estimate/list")
    public String estimateList(Model model, @ModelAttribute("cri") Criteria cri) {
        Map<String, Object> attr = new HashMap<>();
        List<String[]> optionArrList = new ArrayList<>();
        List<String[]> itemArrList = new ArrayList<>();
        int listCount = premiumRentService.getEstimateCount();
        List<EstimateHistoryVO> estimateList = premiumRentService.getEstimateList(cri);

        // DB 문자열을 배열로 만듬
        for(EstimateHistoryVO vo : estimateList){
            String options = vo.getOptions();
            String items = vo.getItems();
            String[] optionArr = options.substring(1,options.length()-1).trim().split(",");
            String[] itemArr = items.substring(1,items.length() - 1).trim().split(",");

            optionArrList.add(optionArr);
            itemArrList.add(itemArr);
        }

        attr.put("estList", estimateList);
        attr.put("pagination", new PageVO(cri,listCount));
        attr.put("optionList", optionArrList);
        attr.put("itemList", itemArrList);
        model.addAllAttributes(attr);

        return "/premiumRent/estimateList";
    }

    // 견적 요청 작성
    @GetMapping("estimate/insert")
    public String estimateInsertForm(Model model) {
        model.addAttribute("brands", codeMapper.getBrands());
        model.addAttribute("carOpt", codeMapper.getCodesByParentCodeName("차량 옵션"));
        model.addAttribute("itemOpt", codeMapper.getCodesByParentCodeName("캠핑 옵션"));

        return "/premiumRent/estimateInsert";
    }

    // 견적 요청 제출
    @PostMapping("estimate/insert")
    public String estimateInsert(EstimateHistoryVO vo,
                                     @RequestParam("options") String[] optionsArr,
                                     @RequestParam("items") String[] itemsArr,
                                     @RequestParam("memSeq") Long memSeq,
                                     RedirectAttributes attributes) {
        // 옵션 배열 -> 스트링
        vo.setOptions(Arrays.toString(optionsArr));
        vo.setItems(Arrays.toString(itemsArr));

        // 외래키 객체 설정
        MemberVO memVo = new MemberVO();
        memVo.setSeq(memSeq);
        vo.setMemberVO(memVo);

        // 코드 -> 네임 변환
        vo.setSegment(codeMapper.getNameByCode(vo.getSegment()).getName());
        vo.setBrand(codeMapper.getBrand(vo.getBrand()).getName());
        vo.setModel(codeMapper.getModel(vo.getModel()).getName());
        vo.setTrim(codeMapper.getTrim(vo.getTrim()).getName());

        int result = premiumRentService.insertEstimate(vo);
        String resultStr = "";
        if (result != 0) {
            resultStr = "견적 요청이 등록되었습니다.";
        } else {
            resultStr = "견적 요청이 등록되지 않았습니다.\n 잠시후 다시 시도해주세요.";
        }

        attributes.addFlashAttribute("resultMsg", resultStr);

        return "redirect:list";
    }

    // 견적 요청 상세
    @GetMapping("estimate/view")
    public String estiamteRead(@RequestParam Long seq,
                               Model model,
                               @ModelAttribute Criteria cri) {
        model.addAttribute("estimate", premiumRentService.getEstimate(seq));

        return "/premiumRent/estimateView";
    }

    // 견적 요청 삭제
    @GetMapping("estimate/delete")
    public String estimateDelete(@RequestParam Long seq,
                                 RedirectAttributes attributes,
                                 Principal principal){
        // principal 객체로 견적 소유자 검증(id or seq)
        int deleteResult = premiumRentService.deleteEstimate(seq);

        String resultMsg = "";
        if(deleteResult == 1) {
            resultMsg = "견적 요청이 삭제되었습니다.";
        } else {
            resultMsg = "견적 요청 삭제에 실패했습니다.\n잠시 후 다시 시도해주세요.";
        }
        attributes.addFlashAttribute("deleteMsg", deleteResult);

        return "redirect:list";
    }

    // 견적 요청 수정
    @GetMapping("estimate/update")
    public String estimateUpdateForm(@RequestParam Long seq,
                                     Principal principal,
                                     Model model){
        // principal 객체로 견적 소유자 검증(id or seq)
        model.addAttribute("estimate", premiumRentService.getEstimate(seq));

        return "premiumRent/estimateInsert";
    }

    // 견적 요청 수정 제출
    @PostMapping("estimate/update")
    public String estimateUpdate(EstimateHistoryVO vo,
                                 RedirectAttributes attributes){
        int updateResult = premiumRentService.updateEstimate(vo);

        String resultMsg = "";
        if(updateResult == 1) {
            resultMsg = "견적이 수정되었습니다.";
        } else {
            resultMsg = "견적 수정에 실패했습니다. \n잠시후 다시 시도해주세요.";
        }
        attributes.addFlashAttribute("updateMsg", resultMsg);
        attributes.addAttribute("seq", vo.getSeq());

        return "redirect: view";
    }

    @GetMapping("submit/insert")
    public String submitInsert(Model model,
                               @RequestParam("estSeq") Long estSeq,
                               Principal principal){
        EstimateHistoryVO estimateHistoryVO = premiumRentService.getEstimate(estSeq);
        Long companySeq = 1L; // principal.getName();    pricipal에서 업체 시퀀스 조회
        List<CarVO> carList = new ArrayList<>();    // 업체시퀀스로 카 리스트 조회
        String[] companyItems = {};                 // 업체시퀀스로 업체아이템 조회

        model.addAttribute("companySeq", companySeq);
        model.addAttribute("carList", carList);
        model.addAttribute("companyItems", companyItems);
        model.addAttribute("estimate", estimateHistoryVO);
        return "premiumRent/estimateSubmitInsert";
    }

    @PostMapping("submit/insert")
    public String submitFormInsert(RedirectAttributes attributes,
                                   EstiSubmitHistoryVO vo){
        return "redirect:../estimate/list";
    }
}
