package com.yedam.possable.app.rent.mapper;

import java.util.List;

import com.yedam.possable.app.rent.domain.RentHistoryVO;

public interface RentHistoryMapper {
	
	//업체 렌트내역 리스트
    public List<RentHistoryVO> rentHistoryList();
}
