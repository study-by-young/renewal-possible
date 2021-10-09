package com.yedam.possable.app.rent.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.possable.app.rent.domain.RentHistoryVO;
import com.yedam.possable.app.rent.mapper.RentHistoryMapper;

@Service
public class RentHistoryServiceImpl implements RentHistoryService {
	
	@Autowired RentHistoryMapper rentHistoryMapper;
	
	@Override
	public List<RentHistoryVO> getRentHistoryList(Long cmpnSeq) {
		return rentHistoryMapper.getRentHistoryList(cmpnSeq);
	}

	@Override
	public RentHistoryVO getRentHistory(RentHistoryVO vo) {
		// TODO Auto-generated method stub
		return rentHistoryMapper.getRentHistory(vo);
	}

}
