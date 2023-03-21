package com.possible.community.course.controller;

import com.possible.common.criteria.domain.Criteria;
import com.possible.common.criteria.domain.PageVO;
import com.possible.community.course.domain.CourseBoardCmtVO;
import com.possible.community.course.domain.CourseBoardLikeVO;
import com.possible.community.course.domain.CourseBoardVO;
import com.possible.community.course.domain.CourseVO;
import com.possible.community.course.service.CourseBoardCmtService;
import com.possible.community.course.service.CourseBoardService;
import com.possible.community.course.service.CourseService;
import com.possible.community.report.service.ReportService;
import com.possible.community.tour.domain.TestVO;
import com.possible.member.service.MemberService;
import com.yedam.possable.app.community.report.domain.ReportVO;
import com.yedam.possable.app.member.domain.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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

	//전체조회
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

	//단건조회
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
		like.setBoardSeq(board.getSeq());
		int total = courseBoardService.getTotalCount(cri);
		cmt.setBoard(board);
		System.out.println(cmt.toString());
		model.addAttribute("cmt", courseBoardCmtService.getList(cri, cmt));
		model.addAttribute("pagination", new PageVO(cri, total));
		return "community/course/view";
	}

	//등록폼
	@GetMapping("/write")
	public String courseWriteForm(Model model, Authentication authentication) {
		MemberVO loginUser = memberService.getLoginMember(authentication);
		model.addAttribute("user", loginUser.getId());
		return "community/course/write";
	}

	//등록 처리
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

	//삭제
	@PostMapping("/view/delete")
	public String courseDelete(CourseBoardVO board) {
		System.out.println(board.toString());
		courseBoardService.delete(board);
		return "redirect:/community/course";
	}

	//코스 등록
	@GetMapping("/tourSearch/{type}/{keyword}")
	@ResponseBody
	public List<TestVO> tourSearch(Model model, @PathVariable String type, @PathVariable String keyword, Criteria cri) {
		cri.setKeyword(keyword);
		cri.setType(type);
		System.out.println("cri========" + cri);
		model.addAttribute("tourList", courseBoardService.tourList(cri));
		List<TestVO> list = courseBoardService.tourList(cri);
		return list;
	}
	
	//좋아요 등록
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
	
	//좋아요 취소
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

	//신고 등록
	@PostMapping("/report")
	@ResponseBody
	public int reportInsert(@RequestBody ReportVO report, Authentication authentication) {
		if (authentication == null) {
			return 0;
		} else {
			MemberVO loginMember = memberService.getLoginMember(authentication);
			report.setReporter(loginMember.getId());
			return reportService.insert(report);
		}
	}
	
	//댓글 등록
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
	
	//댓글 삭제
	@RequestMapping(value = "/deleteCmt")
	@ResponseBody
	public int deleteCmt(@RequestParam(value = "seq") Long seq, CourseBoardCmtVO vo) {
		return courseBoardCmtService.delete(seq);
	}
}