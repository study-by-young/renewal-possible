package com.possible.community.notice_finish_delete.controller;

import com.possible.community.notice_finish_delete.domain.NoticeFileVO;
import com.possible.community.notice_finish_delete.domain.NoticeVO;
import com.possible.community.notice_finish_delete.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
public class UploadController {
	
	@Autowired
	NoticeService noticeService;
	@Value("#{global['path']}")
	String path;
	
	@PostMapping("/uploadAjaxAction")
	@ResponseBody
	public List<NoticeFileVO> uploadAjaxAction(MultipartFile[] uploadFile, NoticeVO vo) throws IllegalStateException, IOException {
		System.out.println(vo);
		List<NoticeFileVO> list = new ArrayList<NoticeFileVO>();
		
		path = "c:/upload";
		for (int i = 0; i < uploadFile.length; i++) {
			System.out.println("=======================================" + uploadFile.length);
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
