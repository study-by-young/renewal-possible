package com.yedam.possable.app.rent.service;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.possable.app.common.criteria.domain.Criteria;
import com.yedam.possable.app.rent.domain.CompEstiListJoinVO;
import com.yedam.possable.app.rent.domain.EstiSubmitHistoryVO;
import com.yedam.possable.app.rent.domain.EstimateHistoryVO;
import com.yedam.possable.app.rent.mapper.PremiumRentMapper;

import lombok.extern.java.Log;

@Log
@Service
public class PremiumRentServiceImpl implements PremiumRentService{
    @Autowired
    PremiumRentMapper premiumRentMapper;

    @Override
    public List<EstimateHistoryVO> getEstimateList(Criteria cri) {
        // 조회 시 차, 여행 옵션 바인딩
        List<EstimateHistoryVO> estimateList = new LinkedList<>();

        for(EstimateHistoryVO vo : premiumRentMapper.getEstimateList(cri)){
            if(vo.getOptions() != null){
                vo.setItemList(List.of(strToArr(vo.getOptions())));
            }
            if(vo.getItems() != null){
                vo.setOptionList(List.of(strToArr(vo.getItems())));
            }
            estimateList.add(vo);
        }

        return estimateList;
    }

    @Override
    public EstimateHistoryVO getEstimate(Long seq) {
        // 조회 시 차, 여행 옵션 바인딩
        EstimateHistoryVO vo = premiumRentMapper.getEstimate(seq);
        if(vo.getOptions() != null){
            vo.setItemList(List.of(strToArr(vo.getOptions())));
        }
        if(vo.getItems() != null){
            vo.setOptionList(List.of(strToArr(vo.getItems())));
        }
        return vo;
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

    @Override
    public List<EstiSubmitHistoryVO> getEstSubmitListByEstiSeq(Criteria cri, Long seq) {
        List<EstiSubmitHistoryVO> estSubmitList = premiumRentMapper.getEstSubmitListByEstiSeq(cri, seq);
        for(EstiSubmitHistoryVO vo : estSubmitList){
            vo.setItemsList(List.of(strToArr(vo.getItems())));
        }
        return estSubmitList;
    }

    @Override
    public EstiSubmitHistoryVO getEstSubmit(Long seq) {
        return premiumRentMapper.getEstSubmit(seq);
    }

    @Override
    public int insertEstSubmit(EstiSubmitHistoryVO vo) {
        return premiumRentMapper.insertEstSubmit(vo);
    }

    @Override
    public int updateEstSubmit(EstiSubmitHistoryVO vo) {
        return premiumRentMapper.updateEstSubmit(vo);
    }

    @Override
    public int deleteEstSubmit(Long seq) {
        return premiumRentMapper.deleteEstSubmit(seq);
    }

    @Override
    public int getEstSubmitCount(Long seq) {
        return premiumRentMapper.getEstSubmitCount(seq);
    }

    private String[] strToArr(String str) {
        String[] strArr = str.substring(1,str.length()-1).trim().split(",");
        for(int i=0; i< strArr.length; i++){
            strArr[i] = strArr[i].trim();
        }
        return strArr;
    }

	@Override
	public List<EstimateHistoryVO> getEstimateListByMemSeq(Criteria cri, @Param("seq") Long seq) {

		return premiumRentMapper.getEstimateListByMemSeq(cri, seq);
	}

	@Override
	public List<CompEstiListJoinVO> compEstiSubmitList(Long seq) {
		// TODO  업체 확인용 견적서 상세 리스트
		return premiumRentMapper.compEstiSubmitList(seq);
	}

	@Override
	public Map<String, Object> compEstiSubmitOneSelect(Long seq) {
		// TODO  업체 확인용 견적서 단건 조회
		Map<String, Object> estimate = new HashMap<>();
		CompEstiListJoinVO vo = premiumRentMapper.compEstiSubmitOneSelect(seq);
        List<String> options = List.of(strToArr(vo.getItems()));
        estimate.put("estimate", vo);
        estimate.put("options", options);
        estimate.put("items", strToArr(vo.getItems()));
        return estimate;


		//return premiumRentMapper.compEstiSubmitOneSelect(seq);
	}

	@Override
	public int CompEstimateUpdate(CompEstiListJoinVO vo) {
		// TODO Auto-generated method stub
		return premiumRentMapper.CompEstimateUpdate(vo);
	}
}
