package com.yedam.possable.app.community.notice.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.possable.app.common.criteria.domain.Criteria;
import com.yedam.possable.app.common.criteria.domain.PageVO;
import com.yedam.possable.app.community.notice.domain.NoticeFileVO;
import com.yedam.possable.app.community.notice.domain.NoticeVO;
import com.yedam.possable.app.community.notice.service.NoticeService;
import com.yedam.possable.app.member.domain.MemberVO;
import com.yedam.possable.app.member.service.MemberService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/notice/*")
public class NoticeController {

	@Autowired
	NoticeService noticeService;
	@Autowired
	MemberService memberService;

	// 공지사항 전체 리스트 조회
	@GetMapping("/list")
	public void list(Model model, @ModelAttribute("cri") Criteria cri
					, Authentication authentication) {
		// System.out.println("cri=====" + cri);
		int total = noticeService.getTotalCount(cri);
		model.addAttribute("list", noticeService.getList(cri));
		model.addAttribute("pagination", new PageVO(cri, total));
		
		MemberVO loginUser = memberService.getLoginMember(authentication);
        model.addAttribute("user", memberService.memberOneSelect(loginUser));
	}

	// 공지사항 상세 조회
	@GetMapping("/get")
	public void get(Model model, NoticeVO vo, @ModelAttribute("cri") Criteria cri
					,Authentication authentication) {
		noticeService.plusViews(vo);
		model.addAttribute("notice", noticeService.read(vo));
		int total = noticeService.getTotalCount(cri);
		// 페이징 값이 함께 넘어가도록 모델에 담아주기
		model.addAttribute("pagination", new PageVO(cri, total));
		
		MemberVO loginUser = memberService.getLoginMember(authentication);
        model.addAttribute("user", memberService.memberOneSelect(loginUser));
	}

	// 공지사항 등록 폼
	@GetMapping("/insert")
	public void insertForm(Model model, @ModelAttribute("cri") Criteria cri) {
		int total = noticeService.getTotalCount(cri);
		model.addAttribute("pagination", new PageVO(cri, total));
	}

	// 공지사항 등록
	@PostMapping("/insert")
	public String insert(Model model, RedirectAttributes rttr, NoticeVO vo, NoticeFileVO filevo,
			MultipartFile[] uploadFile, @ModelAttribute("cri") Criteria cri) {
		noticeService.insert(vo);
		vo.setSeq(noticeService.readSeq());
		filevo.setNoticeSeq(vo.getSeq());
		log.info(filevo.toString());
		model.addAttribute("file", filevo);
		rttr.addFlashAttribute("insertResult", vo.getSeq());
		int total = noticeService.getTotalCount(cri);
		model.addAttribute("pagination", new PageVO(cri, total));

		return "redirect:/notice/list";
	}

	// 공지사항 수정 폼
	@GetMapping("/update")
	public void updateForm(Model model, NoticeVO vo, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("notice", noticeService.read(vo));
		int total = noticeService.getTotalCount(cri);
		model.addAttribute("pagination", new PageVO(cri, total));
	}

	// 공지사항 수정
	@PostMapping("/update")
	public String update(Model model, RedirectAttributes rttr, NoticeVO vo, @ModelAttribute("cri") Criteria cri) {
		int result = noticeService.update(vo);
		if (result == 1) {
			rttr.addFlashAttribute("updateResult", vo.getSeq());
		}

		rttr.addAttribute("seq", vo.getSeq());
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());

		int total = noticeService.getTotalCount(cri);
		model.addAttribute("pagination", new PageVO(cri, total));

		return "redirect:/notice/get";
	}

	// 공지사항 삭제
	@GetMapping("/delete")
	public String delete(Model model, RedirectAttributes rttr, NoticeVO vo, @ModelAttribute("cri") Criteria cri) {
		int result = noticeService.delete(vo);
		if (result == 1) {
			rttr.addFlashAttribute("deleteResult", vo.getSeq());
		}

		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());

		int total = noticeService.getTotalCount(cri);
		model.addAttribute("pagination", new PageVO(cri, total));

		return "redirect:/notice/list";
	}

	// 첨부파일 다중 업로드
	@RequestMapping(value = "/download")
	public void cvplFileDownload(@RequestParam Map<String, Object> commandMap, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String name = (String) commandMap.get("name");
		// name으로 첨부파일 검색
		NoticeFileVO attachVO = noticeService.attachRead(name);
		String fileName = "";
		if (attachVO != null) {
			fileName = attachVO.getOrgName();
		}
		File uFile = new File("c:/upload", name + fileName);
		long fSize = uFile.length();
		if (fSize > 0) {
			String mimetype = "application/x-msdownload";
			response.setContentType(mimetype);
			response.setHeader("Content-Disposition",
					"attachment;filename=\"" + URLEncoder.encode(fileName, "utf-8") + "\""); // 한글깨짐방지
			BufferedInputStream in = null;
			BufferedOutputStream out = null;
			try {
				in = new BufferedInputStream(new FileInputStream(uFile));
				out = new BufferedOutputStream(response.getOutputStream());
				FileCopyUtils.copy(in, out);
				out.flush();
			} catch (IOException ex) {
			} finally {
				in.close();
				response.getOutputStream().flush();
				response.getOutputStream().close();
			}
		} else {
			response.setContentType("application/x-msdownload");
			PrintWriter printwriter = response.getWriter();
			printwriter.println("<html>");
			printwriter.println("<h2>Could not get file name:<br>" + fileName + "</h2>");
			printwriter.println("<center><h3><a href='javascript: history.go(-1)'>Back</a></h3></center>");
			printwriter.println("&copy; webAccess");
			printwriter.println("</html>");
			printwriter.flush();
			printwriter.close();
		}
	}
}