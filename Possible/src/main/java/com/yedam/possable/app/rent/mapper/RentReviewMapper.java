package com.yedam.possable.app.rent.mapper;

import java.util.List;

import com.yedam.possable.app.car.domain.CarVO;
import com.yedam.possable.app.rent.domain.RentReviewVO;

public interface RentReviewMapper {

	// 업체별 후기 목록
	public List<RentReviewVO> getReviewListByCmpnSeq(CarVO vo);
}
