package com.yedam.possable.app.rent.controller;

import com.yedam.possable.app.common.domain.Criteria;
import com.yedam.possable.app.common.domain.PageVO;
import com.yedam.possable.app.common.mapper.CodeMapper;
import com.yedam.possable.app.member.domain.MemberVO;
import com.yedam.possable.app.rent.domain.EstimateHistoryVO;
import com.yedam.possable.app.rent.service.PremiumRentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.*;


@Controller
@RequestMapping("/premiumRent/*")
public class PremiumRentController {
    @Autowired
    CodeMapper codeMapper;
    @Autowired
    PremiumRentService premiumRentService;

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


    @GetMapping("estimate/insert")
    public String estimateInsert(Model model) {
        model.addAttribute("brands", codeMapper.getBrands());
        model.addAttribute("carOpt", codeMapper.getCodesByParentCodeName("차량 옵션"));
        model.addAttribute("itemOpt", codeMapper.getCodesByParentCodeName("캠핑 옵션"));

        return "/premiumRent/estimateInsert";
    }

    @PostMapping("estimate/insert")
    public String estimateFormInsert(EstimateHistoryVO vo,
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
            resultStr = "견적이 등록되었습니다.";
        } else {
            resultStr = "견적이 등록되지 않았습니다.\n 잠시후 다시 시도해주세요.";
        }

        attributes.addFlashAttribute("resultMsg", resultStr);

        return "redirect:list";
    }

    @GetMapping("estimate/view")
    public String estiamteRead(@RequestParam Long seq,
                               Model model,
                               @ModelAttribute Criteria cri) {
        model.addAttribute("estimate", premiumRentService.getEstimate(seq));

        return "/premiumRent/estimateView";
    }
}
