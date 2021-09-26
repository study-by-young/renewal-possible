package com.yedam.possable.app.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

    @GetMapping("/")
    public String dashboard(){
        return "admin/dashboard";
    }
    
    @GetMapping("/memberList")
    public String memberList(){
        return "admin/memberList";
    }
}
