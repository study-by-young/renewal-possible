package com.yedam.possable.app.rent.mapper;

import java.util.List;

import com.yedam.possable.app.car.domain.CarVO;
import com.yedam.possable.app.rent.domain.RentReviewVO;

public interface RentReviewMapper {

	// 업체별 후기 목록 (commonRent/list)
	public List<RentReviewVO> getReviewListByCmpnSeq(CarVO vo);
	
	// 업체별 리뷰 조회
	public List<RentReviewVO> getRentReviewListByCompany(RentReviewVO vo);
	
	// 마이페이지 내가 쓴 리뷰 조회
	public List<RentReviewVO> getRentReviewListByMember(RentReviewVO vo);
	
	// 단건 조회
	public RentReviewVO getRentReview(RentReviewVO vo);
	
	// 등록
	public int insertRentReview(RentReviewVO vo);
	
	// 수정
	public int updateRentReview(RentReviewVO vo);
	
	// 삭제
	public int deleteRentReview(Long seq);
	
	//업체관리자 리뷰 조회
	public List<RentReviewVO> getCompanyReivewList(Long cmpnSeq);
}
