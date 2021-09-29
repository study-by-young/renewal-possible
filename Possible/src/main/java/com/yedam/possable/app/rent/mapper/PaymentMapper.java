package com.yedam.possable.app.rent.mapper;

import com.yedam.possable.app.rent.domain.RentHistoryVO;

public interface PaymentMapper {

	/* 결제정보 DB 삽입 */
	public int paymentInsert(RentHistoryVO vo);
	
	/* 결제완료 후 내역 조회(rent_history seq를 이용해 단건조회) */
	public RentHistoryVO paymentOneSelect(RentHistoryVO vo);
}
