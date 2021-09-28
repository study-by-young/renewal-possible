package com.yedam.possable.app.rent.mapper;

import com.yedam.possable.app.rent.domain.EstimateHistoryVO;

import java.util.List;

public interface PremiumRentMapper {
    public List<EstimateHistoryVO> estimateList();
    public int insertEstimate(EstimateHistoryVO vo);
    public int updateEstimate(EstimateHistoryVO vo);
}
