package com.yedam.possable.app.community.course.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.possable.app.community.course.domain.CourseBoardVO;
import com.yedam.possable.app.community.course.service.CourseBoardService;

@Controller
@RequestMapping("/courseBoard/*")
public class CourseBoardController {

	@Autowired
	CourseBoardService courseBoardService;

	// 전체조회
	@GetMapping("/list")
	public void list(Model model) {
		model.addAttribute("list", courseBoardService.getList());
	}

	// 단건조회(수정페이지)
	@GetMapping("/get")
	public void get(Model model, CourseBoardVO board) {
		model.addAttribute("board", courseBoardService.read(board));
	}

}
