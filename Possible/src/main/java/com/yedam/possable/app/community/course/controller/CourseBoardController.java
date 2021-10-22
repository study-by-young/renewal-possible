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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.possable.app.common.criteria.domain.Criteria;
import com.yedam.possable.app.common.criteria.domain.PageVO;
import com.yedam.possable.app.community.course.domain.CourseBoardCmtVO;
import com.yedam.possable.app.community.course.domain.CourseBoardLikeVO;
import com.yedam.possable.app.community.course.domain.CourseBoardVO;
import com.yedam.possable.app.community.course.domain.CourseVO;
import com.yedam.possable.app.community.course.service.CourseBoardCmtService;
import com.yedam.possable.app.community.course.service.CourseBoardService;
import com.yedam.possable.app.community.course.service.CourseService;
import com.yedam.possable.app.community.report.domain.ReportVO;
import com.yedam.possable.app.community.report.service.ReportService;
import com.yedam.possable.app.community.tour.domain.TestVO;
import com.yedam.possable.app.member.domain.MemberVO;
import com.yedam.possable.app.member.service.MemberService;

@Controller
@RequestMapping("/community/course")
public class CourseBoardController {
	@Autowired
	CourseBoardService courseBoardService;
	@Autowired
	CourseBoardCmtService courseBoardCmtService;
	@Autowired
	CourseService courseService;
	@Autowired
	MemberService memberService;
	@Autowired
	ReportService reportService;

	// 전체조회
	@GetMapping
	public String courseList(Model model, Authentication authentication, @ModelAttribute("cri") Criteria cri) {
		int total = courseBoardService.getTotalCount(cri);
		cri.setAmount(12);
		model.addAttribute("list", courseBoardService.getList(cri));
		model.addAttribute("pagination", new PageVO(cri, total));
		MemberVO loginUser = memberService.getLoginMember(authentication);
		model.addAttribute("user", loginUser);
		return "community/course/list";
	}

	// 단건조회
	@GetMapping("/view")
	public String courseView(Model model, CourseBoardVO board, CourseVO course, CourseBoardLikeVO like,
			Authentication authentication, ReportVO report, @ModelAttribute("cri") Criteria cri, CourseBoardCmtVO cmt) {
		courseBoardService.plusViews(board);
		model.addAttribute("board", courseBoardService.read(board));
		model.addAttribute("cnt", courseBoardService.courseCnt(board));
		model.addAttribute("likes", courseBoardService.countLike(board));
		model.addAttribute("course", courseBoardService.courseSelect(board));
		MemberVO loginUser = memberService.getLoginMember(authentication);
		
		int likeSearchResult = 0;
		int reportSearchResult = 0;
		if(loginUser != null) {
			like.setMemberSeq(loginUser.getSeq());
			likeSearchResult = courseBoardService.checkLike(like);
			report.setReporter(loginUser.getId());
			reportSearchResult = reportService.reportCount(report);
		}
		model.addAttribute("checkLike", likeSearchResult);
		model.addAttribute("reportCheck", reportSearchResult);
		
//		model.addAttribute("user", loginUser.getSeq());
//		model.addAttribute("id", loginUser.getId());
		like.setBoardSeq(board.getSeq());
//		like.setMemberSeq(loginUser.getSeq());
		
//		report.setReporter(loginUser.getId());
		int total = courseBoardService.getTotalCount(cri);
		cmt.setBoard(board);
		System.out.println(cmt.toString());
		model.addAttribute("cmt", courseBoardCmtService.getList(cri, cmt));
		model.addAttribute("pagination", new PageVO(cri, total));
		return "community/course/view";
	}

	// 등록폼
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
	public String courseUpdateForm() {
		return "community/course/write";
	}

	// 수정 처리
	@PostMapping("/view/update")
	public String courseUpdate() {
		return "redirect:/view";
	}

	// 코스 삭제
	@PostMapping("/view/delete")
	public String courseDelete(CourseBoardVO board) {
		System.out.println(board.toString());
		courseBoardService.delete(board);
		return "redirect:/community/course";
	}

	// 코스 댓글 작성
	@GetMapping("/view/writeCmt")
	public String courseCommentWrite() {
		return "community/course/writeCmt";
	}

	// 코스 신고
	@RequestMapping("/view/report")
	public String courseReport() {
		return "community/report";
	}

	@GetMapping("/tourSearch/{type}/{keyword}")
	@ResponseBody
	public List<TestVO> tourSearch(Model model, @PathVariable String type, @PathVariable String keyword, Criteria cri) {
		cri.setKeyword(keyword);
		cri.setType(type);
		System.out.println("cri========" + cri);
		// int total = courseBoardService.getTotalCount(cri);
		model.addAttribute("tourList", courseBoardService.tourList(cri));
		// model.addAttribute("pageMaker", new PageVO(cri, total));
		List<TestVO> list = courseBoardService.tourList(cri);
		return list;
	}

	@RequestMapping(value = "/plusLike")
	@ResponseBody
	public int plusLike(@RequestBody CourseBoardLikeVO vo, Authentication authentication) {
		int i = 1;
		if (authentication == null) {
			return 0;
		} else {
			MemberVO loginMember = memberService.getLoginMember(authentication);
			System.out.println(loginMember.getSeq());
			vo.setMemberSeq(loginMember.getSeq());
			courseBoardService.plusLike(vo);
			return i;
		}
	}

	@RequestMapping(value = "/minusLike")
	@ResponseBody
	public int minusLike(@RequestBody CourseBoardLikeVO vo, Authentication authentication) {
		int i = 1;
		if (authentication == null) {
			return 0;
		} else {
			MemberVO loginMember = memberService.getLoginMember(authentication);
			vo.setMemberSeq(loginMember.getSeq());
			courseBoardService.minusLike(vo);
		}
		return i;
	}

	@PostMapping("/report")
	@ResponseBody
	public int reportInsert(@RequestBody ReportVO report, Authentication authentication) {
		if (authentication == null) {
			return 0;
		} else {
			MemberVO loginMember = memberService.getLoginMember(authentication);
			report.setReporter(loginMember.getId());
			reportService.insert(report);
			return reportService.insert(report);
		}
	}
	
	@RequestMapping(value = "/insertCmt")
	@ResponseBody
	public CourseBoardCmtVO insertCmt(@RequestBody CourseBoardCmtVO vo, Authentication authentication) {
		if (authentication == null) {
			return null;
		} else {
			MemberVO loginMember = memberService.getLoginMember(authentication);
			vo.setWriter(loginMember.getId());
			courseBoardCmtService.insert(vo);
			return courseBoardCmtService.read(vo);
		}
	}
	
	@RequestMapping(value = "/deleteCmt")
	@ResponseBody
	public int deleteCmt(@RequestParam(value = "seq") Long seq, CourseBoardCmtVO vo) {
		return courseBoardCmtService.delete(seq);
	}
}