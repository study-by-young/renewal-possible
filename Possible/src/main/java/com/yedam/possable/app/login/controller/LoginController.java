package com.yedam.possable.app.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.java.Log;

@Log
@Controller
public class LoginController {
	
	/*
	 * @GetMapping("/errorPage") public void accessDenid(Authentication auth, Model
	 * model) {
	 * 
	 * log.info("access Denied : " + auth);
	 * 
	 * model.addAttribute("massage", "연결 거부되었습니다. 관리자에게 문의해주세요."); }
	 */
	//로그인 폼으로
	@GetMapping("/login")
	public String loginForm(String error, String logout, Model model) {
		
		if (error != null) {
			model.addAttribute("error", "아이디 또는 비밀번호를 확인해주세요.");			
		}
		if (logout != null) {
			model.addAttribute("logout", "logout!");						
		}
		
		return "login/loginForm";
	}
	//회원가입 폼
	@GetMapping("/register")
	public String registerForm(Model model) {
		
		return "login/register";
	}
	
}
