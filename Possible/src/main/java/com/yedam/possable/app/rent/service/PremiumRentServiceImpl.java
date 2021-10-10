package com.yedam.possable.app.rent.service;

import com.yedam.possable.app.common.criteria.domain.Criteria;
import com.yedam.possable.app.rent.domain.EstimateHistoryVO;
import com.yedam.possable.app.rent.mapper.PremiumRentMapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class PremiumRentServiceImpl implements PremiumRentService{
    @Autowired
    PremiumRentMapper premiumRentMapper;

    @Override
    public List<Map<String, Object>> getEstimateList(Criteria cri) {
        // 견적 리스트 조회 시 차, 여행 옵션 바인딩
        List<Map<String, Object>> estimateList = new ArrayList<>();

        for(EstimateHistoryVO vo : premiumRentMapper.getEstimateList(cri)){
            Map<String, Object> estimate = new HashMap<>();

            estimate.put("estimate", vo);
            estimate.put("options", strToArr(vo.getOptions()));
            estimate.put("items", strToArr(vo.getItems()));

            estimateList.add(estimate);
        }

        return estimateList;
    }

    @Override
    public Map<String, Object> getEstimate(Long seq) {
        // 견적 리스트 조회 시 차, 여행 옵션 바인딩
        Map<String, Object> estimate = new HashMap<>();
        EstimateHistoryVO vo = premiumRentMapper.getEstimate(seq);

        estimate.put("estimate", vo);
        estimate.put("options", strToArr(vo.getOptions()));
        estimate.put("items", strToArr(vo.getItems()));

        return estimate;
    }

    @Override
    public int insertEstimate(EstimateHistoryVO vo) {
        return premiumRentMapper.insertEstimate(vo);
    }

    @Override
    public int deleteEstimate(Long seq) {
        return premiumRentMapper.deleteEstimate(seq);
    }

    @Override
    public int updateEstimate(EstimateHistoryVO vo) {
        return premiumRentMapper.updateEstimate(vo);
    }

    @Override
    public int getEstimateCount() {
        return premiumRentMapper.getEstimateCount();
    }

    private String[] strToArr(String str) {
        return str.substring(1,str.length()-1).trim().split(",");
    }

	@Override
	public List<EstimateHistoryVO> getUserEstimateList(Criteria cri, @Param("seq") Long seq) {
		
		return premiumRentMapper.getUserEstimateList(cri, seq);
	}
}
