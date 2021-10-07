package com.yedam.possable.app.community.notice.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yedam.possable.app.community.notice.domain.NoticeFileVO;
import com.yedam.possable.app.community.notice.domain.NoticeVO;
import com.yedam.possable.app.community.notice.service.NoticeService;

@Controller
public class UploadController {
	
	@Autowired NoticeService noticeService;
	
	@PostMapping("/uploadAjaxAction")
	@ResponseBody
	public List<NoticeFileVO> uploadAjaxAction(MultipartFile[] uploadFile, NoticeVO vo) throws IllegalStateException, IOException {
		System.out.println(vo);
		List<NoticeFileVO> list = new ArrayList<NoticeFileVO>();
		String path = "c:/upload";
		for (int i = 0; i < uploadFile.length; i++) {
			MultipartFile ufile = uploadFile[i];
			if (!ufile.isEmpty() && ufile.getSize() > 0) {
				String fileName = ufile.getOriginalFilename();
				UUID name = UUID.randomUUID();
				File file = new File(path, name + fileName);
				ufile.transferTo(file);
				//파일정보
				NoticeFileVO attach = new NoticeFileVO();
				attach.setName(name.toString());
				attach.setOrgName(fileName);
				attach.setUploadPath(path);
				list.add(attach);
			}
		}
		return list;
	}

}
