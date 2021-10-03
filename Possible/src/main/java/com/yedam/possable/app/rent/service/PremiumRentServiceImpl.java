package com.yedam.possable.app.rent.service;

import com.yedam.possable.app.common.domain.Criteria;
import com.yedam.possable.app.rent.domain.EstimateHistoryVO;
import com.yedam.possable.app.rent.mapper.PremiumRentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PremiumRentServiceImpl implements PremiumRentService{
    @Autowired
    PremiumRentMapper premiumRentMapper;

    @Override
    public List<EstimateHistoryVO> getEstimateList(Criteria cri) {
        return premiumRentMapper.getEstimateList(cri);
    }

    @Override
    public EstimateHistoryVO getEstimate(Long seq) {
        return premiumRentMapper.getEstimate(seq);
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

}
