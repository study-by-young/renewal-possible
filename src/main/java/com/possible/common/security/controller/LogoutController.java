package com.possible.common.security.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LogoutController {

    //로그아웃 처리
    @GetMapping("/logout")
    public String logout(String logout){

        System.out.println(logout);
        return "login/loginForm";
    }
}
