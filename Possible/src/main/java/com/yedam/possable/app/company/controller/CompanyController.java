package com.yedam.possable.app.company.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


import lombok.extern.java.Log;

@Log
@Controller
public class CompanyController {
	
	@GetMapping("/carList")
	public String carList() {
		return "company/carList";
	}

	
	
}
