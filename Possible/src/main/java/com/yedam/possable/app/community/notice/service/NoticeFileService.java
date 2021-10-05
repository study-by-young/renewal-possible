package com.yedam.possable.app.community.notice.service;

import java.util.List;

import com.yedam.possable.app.community.notice.domain.NoticeFileVO;

public interface NoticeFileService {

	public void insert(NoticeFileVO vo);
	
	public void delete(String name);
	
	public List<NoticeFileVO> findBySeq(Long seq);
	
	public void deleteAll(Long seq);
	
	public NoticeFileVO attachRead(String name);
}
