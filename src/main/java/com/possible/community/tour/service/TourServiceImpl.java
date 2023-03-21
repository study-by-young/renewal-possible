package com.possible.community.tour.service;

import com.possible.common.criteria.domain.Criteria;
import com.possible.community.tour.domain.TestVO;
import com.possible.community.tour.mapper.TourMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TourServiceImpl implements TourService {

	@Autowired
	TourMapper tourMapper;

	@Override
	public int insert(TestVO vo) {
		return tourMapper.insert(vo);
	}

	@Override
	public long maxDate() {
		return tourMapper.maxDate();
	}

	@Override
	public List<TestVO> contentId() {
		return tourMapper.contentId();
	}

	@Override
	public int update(TestVO vo) {
		return tourMapper.update(vo);
	}

	@Override
	public int delete(TestVO vo) {
		return tourMapper.delete(vo);
	}

	@Override
	public List<TestVO> getList(Criteria cri) {
		return tourMapper.getList(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return tourMapper.getTotalCount(cri);
	}
	
	@Override
	public List<TestVO> getLatestList() {
		return tourMapper.getLatestList();
	}

}
