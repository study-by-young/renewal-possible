package com.yedam.possable.app.community.notice.mapper;

import java.util.List;

import com.yedam.possable.app.common.domain.Criteria;
import com.yedam.possable.app.community.notice.domain.NoticeFileVO;
import com.yedam.possable.app.community.notice.domain.NoticeVO;

public interface NoticeMapper {

	public NoticeVO read(NoticeVO vo);

	public int insert(NoticeVO vo);

	public int update(NoticeVO vo);

	public int delete(NoticeVO vo);
	
	public boolean plusViews(NoticeVO vo);
	
	public List<NoticeVO> getList(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public NoticeFileVO attachRead(String name);
}
