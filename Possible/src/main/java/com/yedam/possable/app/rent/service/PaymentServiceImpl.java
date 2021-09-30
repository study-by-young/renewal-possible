package com.yedam.possable.app.rent.service;

import java.util.List;

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

	@Override
	public RentHistoryVO paymentOneSelect(RentHistoryVO vo) {
		return paymentMapper.paymentOneSelect(vo);
	}

	@Override
	public List<RentHistoryVO> paymentList() {
		return paymentMapper.paymentList();
	}

	@Override
	public RentHistoryVO paymentSeqSelect(RentHistoryVO vo) {
		return paymentMapper.paymentSeqSelect(vo);
	}

}
