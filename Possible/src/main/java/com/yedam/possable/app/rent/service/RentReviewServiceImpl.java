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

	@Override
	public List<RentReviewVO> getRentReviewListByCompany(RentReviewVO vo) {
		return rentReviewMapper.getRentReviewListByCompany(vo);
	}
	
	@Override
	public List<RentReviewVO> getRentReviewListByMember(RentReviewVO vo) {
		return rentReviewMapper.getRentReviewListByMember(vo);
	}	

	@Override
	public RentReviewVO getRentReview(RentReviewVO vo) {
		return rentReviewMapper.getRentReview(vo);
	}

	@Override
	public int insertRentReview(RentReviewVO vo) {
		return rentReviewMapper.insertRentReview(vo);
	}

	@Override
	public int updateRentReview(RentReviewVO vo) {
		return rentReviewMapper.updateRentReview(vo);
	}

	@Override
	public int deleteRentReview(Long seq) {
		return rentReviewMapper.deleteRentReview(seq);
	}

}
