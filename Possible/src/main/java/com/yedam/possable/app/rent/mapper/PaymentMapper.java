package com.yedam.possable.app.rent.mapper;

import java.util.List;

import com.yedam.possable.app.rent.domain.RentHistoryVO;

public interface PaymentMapper {

	/* 결제정보 DB 삽입 */
	public int paymentInsert(RentHistoryVO vo);
	
	/* 결제완료 후 내역 조회(rent_history seq를 이용해 단건조회) */
	public RentHistoryVO paymentOneSelect(RentHistoryVO vo);
	
	/* 결제정보 전체 조회 */
	public List<RentHistoryVO> paymentList();
	
	/* 결제정보 seq 조회 */
	public RentHistoryVO paymentSeqSelect(RentHistoryVO vo);
}
