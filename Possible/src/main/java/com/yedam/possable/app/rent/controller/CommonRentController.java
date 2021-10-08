package com.yedam.possable.app.rent.controller;

import com.yedam.possable.app.common.code.mapper.CodeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/commonRent")
public class CommonRentController {
    @Autowired
    private CodeMapper codeMapper;

    // 렌트카 리스트
    @GetMapping
    public String rentCarList(Model model){
        model.addAttribute("areaCodes",codeMapper.getCodesByParentCode("지역"));
        return "rent/comm/carList";
    }

    // 렌트카 상세보기
    @GetMapping("/view")
    public String rentCarView(){
        return "rent/comm/carView";
    }

    // 렌트카 예약 폼
    @GetMapping("/view/book")
    public String rentCarBook(){
        return "rent/comm/carBook";
    }

    // 렌트카 예약 완료
    @GetMapping("/view/bookCmpl")
    public String bookComplete(){
        return "rent/comm/bookComplete";
    }
}
