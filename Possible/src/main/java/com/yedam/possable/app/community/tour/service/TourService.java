package com.yedam.possable.app.community.tour.service;

import java.util.List;

import com.yedam.possable.app.community.tour.domain.TestVO;

public interface TourService {
	
	public int insert(TestVO vo);
	
	public long maxDate();
	
	public List<TestVO> contentId();
	
	public int dataUpdate(TestVO vo);
	
	public int dataInsert(TestVO vo);

}
