package com.yedam.possable.app.rent.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.possable.app.car.mapper.CarMapper;
import com.yedam.possable.app.common.code.mapper.CodeMapper;

@Controller
@RequestMapping("/commonRent/*")
public class CommonRentController {
    @Autowired
    private CodeMapper codeMapper;
    @Autowired
    private CarMapper carMapper;

    @GetMapping("/list")
    public String rentList(Model model){
    	model.addAttribute("list", carMapper.getCarList());
        model.addAttribute("areaCodes", codeMapper.getCodesByParentCode("지역"));
        return "commonRent/list";
    }
    
    @GetMapping("/view")
    public String rentView(Model model) {
    	return "commonRent/carView";
    }
}
