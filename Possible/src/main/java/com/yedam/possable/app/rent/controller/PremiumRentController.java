package com.yedam.possable.app.rent.controller;

import com.yedam.possable.app.common.domain.BrandCodeVO;
import com.yedam.possable.app.common.mapper.CodeMapper;
import com.yedam.possable.app.rent.domain.EstimateHistoryVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/premiumRent/*")
public class PremiumRentController {
    @Autowired
    CodeMapper codeMapper;

    @GetMapping("estimate/list")
    public String estimateList(){
        return "/premiumRent/estimateList";
    }


    @GetMapping("estimate/insert")
    public String estimateInsert(Model model){
        model.addAttribute("brands", codeMapper.getBrands());
        model.addAttribute("carOpt", codeMapper.getCodesByParentCodeName("차량 옵션"));

        return "/premiumRent/estimateInsert";
    }

    @PostMapping("estimate/insert")
    public String estimateFormInsert(EstimateHistoryVO vo, RedirectAttributes attributes){
        System.out.println("est vo is ==========" + vo.toString());

        return "redirect: list";
    }

    @GetMapping("estimate/read")
    public String estiamteRead(){
        return "/premiumRent/estimateRead";
    }
}
