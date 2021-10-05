package com.yedam.possable.app.community.notice.mapper;

import java.util.List;

import com.yedam.possable.app.community.notice.domain.NoticeFileVO;

public interface NoticeFileMapper {

	public void insert(NoticeFileVO vo);
	
	public void delete(String name);
	
	public List<NoticeFileVO> findBySeq(Long seq);
	
	public void deleteAll(Long seq);
	
	public NoticeFileVO attachRead(String name);
}
