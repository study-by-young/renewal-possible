package com.yedam.possable.app.rent.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.possable.app.common.criteria.domain.Criteria;
import com.yedam.possable.app.rent.domain.RentHistoryVO;

public interface RentHistoryMapper {
	
	//업체 렌트내역 리스트
    public List<RentHistoryVO> rentHistoryList();
    
	// 회원 렌트내역 리스트 조회
	public List<RentHistoryVO> MyPageRentHistoryList(@Param("cri") Criteria cri, @Param("seq") Long seq);
	
	//전체수 검사
	public int getHistoryCount();
}
