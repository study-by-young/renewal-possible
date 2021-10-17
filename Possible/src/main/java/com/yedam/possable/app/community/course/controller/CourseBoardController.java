package com.yedam.possable.app.community.course.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.possable.app.common.criteria.domain.Criteria;
import com.yedam.possable.app.common.criteria.domain.PageVO;
import com.yedam.possable.app.community.course.domain.CourseBoardLikeVO;
import com.yedam.possable.app.community.course.domain.CourseBoardVO;
import com.yedam.possable.app.community.course.domain.CourseVO;
import com.yedam.possable.app.community.course.service.CourseBoardService;
import com.yedam.possable.app.community.course.service.CourseService;
import com.yedam.possable.app.community.tour.domain.TestVO;
import com.yedam.possable.app.member.domain.MemberVO;
import com.yedam.possable.app.member.service.MemberService;

@Controller
@RequestMapping("/community/course")
public class CourseBoardController {
	@Autowired
	CourseBoardService courseBoardService;
	@Autowired
	CourseService courseService;
	@Autowired
	MemberService memberService;

	// 전체조회
	@GetMapping
	public String courseList(Model model, Authentication authentication, @ModelAttribute("cri") Criteria cri) {
		int total = courseBoardService.getTotalCount(cri);
		model.addAttribute("list", courseBoardService.getList(cri));
	    model.addAttribute("pageMaker", new PageVO(cri, total));
	    MemberVO loginUser = memberService.getLoginMember(authentication);
	    model.addAttribute("user", loginUser);
	    return "community/course/list";
	}

	// 단건조회
	@GetMapping("/view")
	public String courseView(Model model, CourseBoardVO board, CourseVO course, CourseBoardLikeVO like, Authentication authentication) {
		courseBoardService.plusViews(board);
		model.addAttribute("board", courseBoardService.read(board));
		model.addAttribute("cnt", courseBoardService.courseCnt(board));
		model.addAttribute("likes", courseBoardService.countLike(board));
		model.addAttribute("course", courseBoardService.courseSelect(board));
		MemberVO loginUser = memberService.getLoginMember(authentication);
		if(loginUser == null) {
			return "community/course/view";
		}
		model.addAttribute("user", loginUser.getSeq());
		model.addAttribute("id", loginUser.getId());
		like.setBoardSeq(board.getSeq());
		like.setMemberSeq(loginUser.getSeq());
		model.addAttribute("checkLike",courseBoardService.checkLike(like));
		return "community/course/view";
	}

	//등록폼
	@GetMapping("/write")
	public String courseWriteForm(Model model, Authentication authentication) {
		MemberVO loginUser = memberService.getLoginMember(authentication);
		model.addAttribute("user", loginUser.getId());
	    return "community/course/write";
	}
	
	// 등록 처리
	/*
	 * @PostMapping("/write") public String courseWrite(Model model, CourseBoardVO
	 * board, CourseVO course){ courseBoardService.insert(board);
	 * 
	 * return "redirect:/community/course"; }
	 */
    
    @PostMapping("/write")
    @ResponseBody
    public String courseInsert(@RequestBody CourseBoardVO board) {
    	System.out.println(board);	
    	courseBoardService.insert(board);
    	System.out.println(board.getSeq());
    	Long num = board.getSeq();
    	courseBoardService.courseInsert(board.getBoardList(), num);
    	return "success";
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
    @PostMapping("/view/delete")
    public String courseDelete(CourseBoardVO board){
    	System.out.println(board.toString());
    	courseBoardService.delete(board);
	    return "redirect:/community/course";
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
	
	@RequestMapping(value = "/plusLike")
	@ResponseBody
	public int plusLike(@RequestBody CourseBoardLikeVO vo) {
		int i = 1;
		courseBoardService.plusLike(vo);
		return i;
	}

	@RequestMapping(value = "/minusLike")
	@ResponseBody
	public int minusLike(@RequestBody CourseBoardLikeVO vo) {
		int i = 1;
		courseBoardService.minusLike(vo);
		return i;
	}
	
}