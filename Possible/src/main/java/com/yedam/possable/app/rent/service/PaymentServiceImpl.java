package com.yedam.possable.app.rent.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.possable.app.rent.domain.RentHistoryVO;
import com.yedam.possable.app.rent.mapper.PaymentMapper;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired PaymentMapper paymentMapper;
	
	@Override
	public int paymentInsert(RentHistoryVO vo) {
		return paymentMapper.paymentInsert(vo);
	}

}
