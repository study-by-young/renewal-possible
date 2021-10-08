package com.yedam.possable.app.rent.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.possable.app.common.criteria.domain.Criteria;
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
	public RentHistoryVO paymentOneSelect(Long seq) {
		return paymentMapper.paymentOneSelect(seq);
	}

	@Override
	public List<RentHistoryVO> paymentList() {
		return paymentMapper.paymentList();
	}

	@Override
	public RentHistoryVO paymentSeqSelect(RentHistoryVO vo) {
		return paymentMapper.paymentSeqSelect(vo);
	}

	@Override
	public int paymentCancel(String merchantUid) {
		return paymentMapper.paymentCancel(merchantUid);
	}

	@Override
	public Long readSeq(String merchantUid) {
		return paymentMapper.readSeq(merchantUid);
	}

	@Override
	public List<RentHistoryVO> rentHistoryList(@Param("cri") Criteria cri, @Param("seq") Long seq) {
		// TODO // 회원 렌트내역 리스트 조회
		return paymentMapper.rentHistoryList(cri,seq);
	}

}
