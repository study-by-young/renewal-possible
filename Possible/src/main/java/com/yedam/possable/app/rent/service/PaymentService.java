package com.yedam.possable.app.rent.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.possable.app.common.criteria.domain.Criteria;
import com.yedam.possable.app.rent.domain.RentHistoryVO;

public interface PaymentService {

	// 결제정보 DB 삽입
	public int paymentInsert(RentHistoryVO vo);
	
	// 결제완료 후 내역 조회(rent_history seq를 이용해 단건조회)
	public RentHistoryVO paymentOneSelect(Long seq);
	
	// 결제내역 조회(마이페이지)
	public List<RentHistoryVO> paymentList();
	
	// 결제정보 seq 조회
	public RentHistoryVO paymentSeqSelect(RentHistoryVO vo);
	
	// 결제취소 후 DB처리(status 변경)
	public int paymentCancel(String merchantUid);
	
	// 렌트 내역 seq 조회
	public Long readSeq(String merchantUid);
	
	// 회원 렌트내역 리스트 조회
	public List<RentHistoryVO> rentHistoryList(@Param("cri") Criteria cri, @Param("seq") Long Seq);
}
