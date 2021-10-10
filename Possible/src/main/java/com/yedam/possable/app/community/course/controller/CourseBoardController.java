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
import com.yedam.possable.app.community.course.domain.CourseVO;
import com.yedam.possable.app.community.course.service.CourseBoardService;
import com.yedam.possable.app.community.course.service.CourseService;
import com.yedam.possable.app.community.tour.domain.TestVO;

@Controller
@RequestMapping("/community/course")
public class CourseBoardController {
	@Autowired
	CourseBoardService courseBoardService;
	CourseService courseService;

	// 전체조회
	@GetMapping
	public String courseList(Model model) {
	    model.addAttribute("list", courseBoardService.getList());
	    return "community/course/list";
	}

	// 단건조회(수정페이지)
	@GetMapping("/view")
	public String courseView(Model model, CourseBoardVO board, CourseVO course) {
		model.addAttribute("board", courseBoardService.read(board));
		model.addAttribute("cnt", courseBoardService.courseCnt(board));
		model.addAttribute("course", courseBoardService.courseSelect(board));
		return "community/course/view";
	}

	//등록폼
	@GetMapping("/write")
	public String courseWriteForm(Model model) {
	    return "community/course/write";
	}
	
	// 등록 처리
    @PostMapping("/write")
    public String courseWrite(Model model, CourseBoardVO board, CourseVO course){
    	courseBoardService.insert(board);
    	//courseService.insert(course);
	    return "redirect:/community/course/list";
    }

    // 수정 폼
    @GetMapping("/view/update")
    public String courseUpdateForm(){
	    return "community/course/write";
    }

    // 수정 처리
    @PostMapping("/view/update")
    public String courseUpdate(){
	    return "redirect:/view";
    }

    // 코스 삭제
    @GetMapping("/view/delete")
    public String courseDelete(){
	    return "redirect:../../";
    }

    // 코스 댓글 작성
    @GetMapping("/view/writeCmt")
    public String courseCommentWrite(){
	    return "community/course/writeCmt";
    }

    // 코스 신고
    @RequestMapping("/view/report")
    public String courseReport(){
	    return "community/report";
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
