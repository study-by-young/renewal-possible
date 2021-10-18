package com.yedam.possable.app.rent.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.possable.app.common.criteria.domain.Criteria;
import com.yedam.possable.app.rent.domain.CompEstiListJoinVO;
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

	@Override
	public int getHistoryCount() {
		// TODO Auto-generated method stub
		return rentHistoryMapper.getHistoryCount();
	}

	@Override
	public List<RentHistoryVO> rentHistoryList() {
		return rentHistoryMapper.rentHistoryList();
	}

	@Override
	public List<RentHistoryVO> MyPageRentHistoryList(@Param("cri") Criteria cri, @Param("seq")Long seq) {
		// TODO Auto-generated method stub
		return rentHistoryMapper.MyPageRentHistoryList(cri, seq);
	}

	@Override
	public RentHistoryVO getRentHistoryInMypage(Long seq) {
		// TODO Auto-generated method stub
		return rentHistoryMapper.getRentHistoryInMypage(seq);
	}

	@Override
	public List<RentHistoryVO> getCompanySales(Long cmpnSeq) {
		// TODO Auto-generated method stub
		return rentHistoryMapper.getCompanySales(cmpnSeq);
	}

	@Override
	public List<RentHistoryVO> getCompanytodayCar(Long cmpnSeq) {
		// TODO Auto-generated method stub
		return rentHistoryMapper.getCompanytodayCar(cmpnSeq);
	}

}
