package com.yedam.possable.app.rent.mapper;

import com.yedam.possable.app.common.domain.Criteria;
import com.yedam.possable.app.rent.domain.EstimateHistoryVO;

import java.util.List;

public interface PremiumRentMapper {
    // 견적서 리스트
    public List<EstimateHistoryVO> getEstimateList(Criteria cri);

    // 견적서 단건 조회
    public EstimateHistoryVO getEstimate(Long seq);

    // 견적서 작성
    public int insertEstimate(EstimateHistoryVO vo);

    // 견적서 수정
    public int updateEstimate(EstimateHistoryVO vo);

    // 견적서 삭제
    public int deleteEstimate(Long seq);

    // 견적서 총 갯수 조회
    public int getEstimateCount();
}
