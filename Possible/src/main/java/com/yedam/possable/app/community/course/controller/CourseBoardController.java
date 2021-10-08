package com.yedam.possable.app.community.course.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.possable.app.common.criteria.domain.Criteria;
import com.yedam.possable.app.community.course.domain.CourseBoardVO;
import com.yedam.possable.app.community.course.service.CourseBoardService;
import com.yedam.possable.app.community.tour.domain.TestVO;

@Controller
@RequestMapping("/course/*")
public class CourseBoardController {

	@Autowired
	CourseBoardService courseBoardService;

	// 전체조회
	@GetMapping("/list")
	public void list(Model model) {
		model.addAttribute("list", courseBoardService.getList());
	}

	// 단건조회(수정페이지)
	@GetMapping("/view")
	public void get(Model model, CourseBoardVO board) {
		model.addAttribute("board", courseBoardService.read(board));
	}

	// 등록폼
	@GetMapping("/write")
	public void insertForm(Model model) {
	}
	
	// 등록
	@PostMapping("/write")
	public String insert(Model model, CourseBoardVO board) {
		courseBoardService.insert(board);
		return "redirect:/course/list";
	}

	@GetMapping("/tourSearch/{type}/{keyword}")
	@ResponseBody
	public List<TestVO> tourSearch(Model model,
							@PathVariable String type,
							@PathVariable String keyword,
							Criteria cri) {
		cri.setKeyword(keyword);
		cri.setType(type);
		System.out.println("cri========" + cri);
		//int total = courseBoardService.getTotalCount(cri);
		model.addAttribute("tourList", courseBoardService.tourList(cri));
		// model.addAttribute("pageMaker", new PageVO(cri, total));
		List<TestVO> list = courseBoardService.tourList(cri);
		return list;
	}

}
