package com.possible.community.notice_finish_delete.service;

import com.possible.common.criteria.domain.Criteria;
import com.possible.community.notice_finish_delete.domain.NoticeFileVO;
import com.possible.community.notice_finish_delete.domain.NoticeVO;

import java.util.List;

public interface NoticeService {

	public NoticeVO read(NoticeVO vo);

	public int insert(NoticeVO vo);

	public int update(NoticeVO vo);

	public int delete(NoticeVO vo);

	public boolean plusViews(NoticeVO vo);

	public List<NoticeVO> getList(Criteria cri);

	public int getTotalCount(Criteria cri);
	
	public NoticeFileVO attachRead(String name);
	
	public Long readSeq();

}
