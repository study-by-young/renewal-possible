package com.yedam.possable.app.community.notice.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.possable.app.community.notice.domain.NoticeFileVO;

public interface NoticeFileMapper {

	public void insert(NoticeFileVO vo);
	
	public void delete(String name);
	
	public List<NoticeFileVO> findBySeq(Long noticeSeq);
	
	public void deleteAll(Long noticeSeq);
	
	public NoticeFileVO attachRead(String name);
}
