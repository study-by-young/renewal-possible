package com.yedam.possable.app.rent.service;

import com.yedam.possable.app.rent.domain.RentHistoryVO;

public interface PaymentService {

	/* 결제정보 DB 삽입 */
	public int paymentInsert(RentHistoryVO vo);
}
