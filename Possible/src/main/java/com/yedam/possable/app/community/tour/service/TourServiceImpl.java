package com.yedam.possable.app.community.tour.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.possable.app.community.tour.domain.TestVO;
import com.yedam.possable.app.community.tour.mapper.TourMapper;

@Service
public class TourServiceImpl implements TourService {
	
	@Autowired TourMapper tourMapper;

	@Override
	public int insert(TestVO vo) {
		return tourMapper.insert(vo);
	}

}
