package com.possible.community.notice_finish_delete.service;

import com.possible.community.notice_finish_delete.domain.NoticeFileVO;

import java.util.List;

public interface NoticeFileService {

	public void insert(NoticeFileVO vo);
	
	public void delete(String name);
	
	public List<NoticeFileVO> findBySeq(Long noticeSeq);
	
	public void deleteAll(Long noticeSeq);
	
	public NoticeFileVO attachRead(String name);
}
