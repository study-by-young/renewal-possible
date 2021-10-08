package com.yedam.possable.app.rent.service;

import java.util.List;

import com.yedam.possable.app.rent.domain.RentHistoryVO;

public interface RentHistoryService {
	
	//업체 렌트내역 리스트
    public List<RentHistoryVO> rentHistoryList();
}
