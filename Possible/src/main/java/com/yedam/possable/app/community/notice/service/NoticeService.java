package com.yedam.possable.app.community.notice.service;

import java.util.List;

import com.yedam.possable.app.common.criteria.domain.Criteria;
import com.yedam.possable.app.community.notice.domain.NoticeFileVO;
import com.yedam.possable.app.community.notice.domain.NoticeVO;

public interface NoticeService {

	public NoticeVO read(NoticeVO vo);

	public int insert(NoticeVO vo);

	public int update(NoticeVO vo);

	public int delete(NoticeVO vo);

	public boolean plusViews(NoticeVO vo);

	public List<NoticeVO> getList(Criteria cri);

	public int getTotalCount(Criteria cri);
	
	public NoticeFileVO attachRead(String name);
	
	// 첨부파일 리스트
	public List<NoticeFileVO> getAttachList(Long noticeSeq);
}
