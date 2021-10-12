package com.yedam.possable.app.rent.service;

import java.util.List;

import com.yedam.possable.app.car.domain.CarVO;
import com.yedam.possable.app.rent.domain.RentReviewVO;

public interface RentReviewService {

	// 업체별 후기 목록
	public List<RentReviewVO> getReviewListByCmpnSeq(CarVO vo);
}
