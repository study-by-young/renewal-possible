package com.yedam.possable.app.company.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.possable.app.car.domain.CarVO;
import com.yedam.possable.app.company.domain.CompanyVO;
import com.yedam.possable.app.company.service.CompanyService;

import lombok.extern.java.Log;

@Log
@Controller
public class CompanyController {
	
	@Autowired CompanyService companyService;
	
	//업체 대시보드
	@GetMapping("/companyDashboard")
	   public String dashboard(){
	   return "admin/companyDashboard";
	 }
	  
	//업체 보유 렌트카 리스트
	@GetMapping("/companyCarList")
	public String companyCarList(CarVO vo, @RequestParam("comSeq") Long comSeq, Model model) {
		
		CompanyVO comVO = new CompanyVO();
		comVO.setSeq(comSeq);
		vo.setCompanyVO(comVO);
		
		model.addAttribute("companyCarList", companyService.companyCarList(vo));
		return "admin/companyCarList";
	}
	
	//업체 보유 렌트카 한건
	@GetMapping("/companyCarOneSelect")
	@ResponseBody
	 public CarVO companyCarOneSelect(CarVO vo, @RequestParam Long seq) {
		return companyService.companyCarOneSelect(vo);
	}
	
	//업체 보유 렌트카 삭제
	@PostMapping("/companyCarDel")
	@ResponseBody
	public int companyCarDel(CarVO vo, @RequestParam(value = "chbox[]") List<String> chArr){

		 int result = 0;
		 Long seq = 0L;
		 
		  for(String i : chArr) {   
		   vo.setSeq(seq);
		   companyService.companyCarDel(vo);
		  }   
		  result = 1;
		
		 return result;  
	
		}
	}
