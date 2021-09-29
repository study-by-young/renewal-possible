package com.yedam.possable.app.payment.service;

import com.yedam.possable.app.payment.domain.PaymentVO;

public interface PaymentService {

	/* DB에 결제정보 입력 */
	public int paymentInsert(PaymentVO vo);
}
