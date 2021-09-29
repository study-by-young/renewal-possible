package com.yedam.possable.app.rent.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/premiumRent/*")
public class PremiumRentController {

    @GetMapping("estimate/list")
    public String estimateList(){
        return "/premiumRent/estimateList";
    }


    @GetMapping("estimate/insert")
    public String estimateInsert(){
        return "/premiumRent/estimateInsert";
    }

    @GetMapping("estimate/read")
    public String estiamteRead(){
        return "/premiumRent/estimateRead";
    }
}
