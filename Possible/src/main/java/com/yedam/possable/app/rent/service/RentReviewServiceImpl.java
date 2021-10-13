package com.yedam.possable.app.rent.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.possable.app.car.domain.CarVO;
import com.yedam.possable.app.rent.domain.RentReviewVO;
import com.yedam.possable.app.rent.mapper.RentReviewMapper;

@Service
public class RentReviewServiceImpl implements RentReviewService {

	@Autowired
	RentReviewMapper rentReviewMapper;
	
	@Override
	public List<RentReviewVO> getReviewListByCmpnSeq(CarVO vo) {
		return rentReviewMapper.getReviewListByCmpnSeq(vo);
	}

}
