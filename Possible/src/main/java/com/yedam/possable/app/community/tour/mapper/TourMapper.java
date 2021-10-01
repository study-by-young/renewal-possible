package com.yedam.possable.app.community.tour.mapper;

import java.util.List;

import com.yedam.possable.app.community.tour.domain.TestVO;

public interface TourMapper {

	public int insert(TestVO vo);
	
	public long maxDate();
	
	public List<TestVO> contentId();
	
	public int update(TestVO vo);
	
	public int delete(TestVO vo);
	
}
