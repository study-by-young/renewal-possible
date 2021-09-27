package com.yedam.possable.app.rent.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/car/*")
public class rentController {

	@GetMapping("/list")
	public String list() {
		return "car/list";
	}
	
	@GetMapping("/rentFin")
	public String rentFin() {
		return "car/rentFin";
	}
	
	@GetMapping("/info")
	public String info() {
		return "car/info";
	}
	
	@GetMapping("/rent")
	public String rent() {
		return "car/rent";
	}
	
	@GetMapping("/registration")
	public String registration() {
		return "car/registration";
	}

	@GetMapping("/listbackup")
	public String listbackup() {
		return "car/listbackup";
	}
}
