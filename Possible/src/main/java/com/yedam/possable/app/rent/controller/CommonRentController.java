package com.yedam.possable.app.rent.controller;

import com.yedam.possable.app.common.mapper.CodeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/commonRent/*")
public class CommonRentController {
    @Autowired
    private CodeMapper codeMapper;

    @GetMapping("/list")
    public String rentList(Model model){
        model.addAttribute("areaCodes",codeMapper.getNamesByParentCode("지역"));
        return "commonRent/list";
    }
}
