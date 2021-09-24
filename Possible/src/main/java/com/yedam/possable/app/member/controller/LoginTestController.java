package com.yedam.possable.app.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/loginTest/*")
public class LoginTestController {
	
	@GetMapping("/all")
	public void doAll() {
		log.info("모든 접속 쌉가능");
	}
	
	@GetMapping("/member")
	public void doMember() {
		log.info("회원만 쌉가능");
	}
	@GetMapping("/admin")
	public void doAdmin() {
		log.info("어드민만 쌉가능");
	}
}
