package com.yedam.possable.app.payment.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.possable.app.payment.domain.PaymentVO;
import com.yedam.possable.app.payment.mapper.PaymentMapper;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired PaymentMapper paymentMapper;
	
	@Override
	public int paymentInsert(PaymentVO vo) {
		// DB에 결제정보 저장
		return paymentMapper.paymentInsert(vo);
	}

}
