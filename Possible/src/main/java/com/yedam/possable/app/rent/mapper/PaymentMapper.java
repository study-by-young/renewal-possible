package com.yedam.possable.app.rent.mapper;

import com.yedam.possable.app.rent.domain.RentHistoryVO;

public interface PaymentMapper {

	/* 결제정보 DB 삽입 */
	public int paymentInsert(RentHistoryVO vo);
}
