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

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
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

@Controller
@RequestMapping("/notice/*")
public class NoticeController {

	@Autowired
	NoticeService noticeService;

	@GetMapping("/list")
	public void list(Model model, @ModelAttribute("cri") Criteria cri) {
		// System.out.println("cri=====" + cri);
		int total = noticeService.getTotalCount(cri);
		model.addAttribute("list", noticeService.getList(cri));
		model.addAttribute("pageMaker", new PageVO(cri, total));
	}

	@GetMapping("/get")
	public void get(Model model, NoticeVO vo, @ModelAttribute("cri") Criteria cri) {
		noticeService.plusViews(vo);
		model.addAttribute("notice", noticeService.read(vo));
		model.addAttribute("title", "�ܰ� ��ȸ");
	}

	@GetMapping("/insert")
	public void insertForm(Model model) {
		model.addAttribute("title", "�����");
	}

	@PostMapping("/insert")
	public String insert(Model model, RedirectAttributes rttr, NoticeVO vo, MultipartFile[] uploadFile) {
		model.addAttribute("title", "���");
		noticeService.insert(vo);
		rttr.addAttribute("insertResult", vo.getSeq());

		return "redirect:/notice/list";
	}

	@GetMapping("/update")
	public void updateForm(Model model, NoticeVO vo, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("title", "������");
		model.addAttribute("notice", noticeService.read(vo));
	}

	@PostMapping("/update")
	public String update(RedirectAttributes rttr, NoticeVO vo, @ModelAttribute("cri") Criteria cri) {
		int result = noticeService.update(vo);
		if (result == 1) { /*+ INDEX_DESC(IDX_NOTICE) */
			rttr.addFlashAttribute("updateResult", vo.getSeq());
		}

		rttr.addAttribute("seq", vo.getSeq());
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());

		return "redirect:/notice/get";
	}

	@GetMapping("/delete")
	public String delete(RedirectAttributes rttr, NoticeVO vo, @ModelAttribute("cri") Criteria cri) {
		int result = noticeService.delete(vo);

		if (result == 1) {
			rttr.addFlashAttribute("deleteResult", vo.getSeq());
		}

		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());

		return "redirect:/notice/list";
	}

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
			// setDisposition(atchFileId, request, response);
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
