package com.yedam.possable.app.community.notice.mapper;

import java.util.List;

import com.yedam.possable.app.community.notice.domain.NoticeVO;

public interface NoticeMapper {

	public List<NoticeVO> getList();

	public NoticeVO read(NoticeVO vo);

	public int insert(NoticeVO vo);

	public int update(NoticeVO vo);

	public int delete(NoticeVO vo);
	
	public boolean plusViews(NoticeVO vo);
}
