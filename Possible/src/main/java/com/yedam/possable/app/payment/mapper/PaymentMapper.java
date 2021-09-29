package com.yedam.possable.app.payment.mapper;

import com.yedam.possable.app.payment.domain.PaymentVO;

public interface PaymentMapper {

	/* DB에 결제정보 입력 */
	public int paymentInsert(PaymentVO vo);
}
