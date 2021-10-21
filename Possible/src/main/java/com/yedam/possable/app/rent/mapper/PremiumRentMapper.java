package com.yedam.possable.app.rent.mapper;

import com.yedam.possable.app.common.criteria.domain.Criteria;
import com.yedam.possable.app.rent.domain.CompEstiListJoinVO;
import com.yedam.possable.app.rent.domain.EstiSubmitHistoryVO;
import com.yedam.possable.app.rent.domain.EstimateHistoryVO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface PremiumRentMapper {
    // 견적 요청서 리스트
    public List<EstimateHistoryVO> getEstimateList(Criteria cri);

    // 견적 요청서  단건 조회
    public EstimateHistoryVO getEstimate(Long seq);

    // 견적 작성 확인
    public boolean isRegistered(Long seq);

    // 견적 요청서  작성
    public int insertEstimate(EstimateHistoryVO vo);

    // 견적 요청서  수정
    public int updateEstimate(EstimateHistoryVO vo);

    // 견적 요청서  삭제
    public int deleteEstimate(Long seq);

    // 견적 요청서  총 갯수 조회
    public int getEstimateCount();

    // 견적서 리스트
    public List<EstiSubmitHistoryVO> getEstSubmitListByEstiSeq(@Param("cri") Criteria cri, @Param("seq") Long seq);

    // 견적서 단건 조회
    public EstiSubmitHistoryVO getEstSubmit(Long seq);

    // 견적서  작성
    public int insertEstSubmit(EstiSubmitHistoryVO vo);

    // 견적서  수정
    public int updateEstSubmit(EstiSubmitHistoryVO vo);

    // 견적서  삭제
    public int deleteEstSubmit(Long seq);

    // 견적서  총 갯수 조회
    public int getEstSubmitCount(Long seq);

    // 회원 마이페이지 견적서 리스트
    public List<EstimateHistoryVO> getEstimateListByMemSeq(@Param("cri") Criteria cri, @Param("seq") Long seq);

    // 업체 확인용 견적서 상세 리스트
    public List<CompEstiListJoinVO> compEstiSubmitList(Long seq);

    // 회원 마이페이지 최근 한건 데이터 조회
    public EstimateHistoryVO getEstimateListInMyPage(Long seq);

    // 업체 확인용 견적서 단건 조회
    public CompEstiListJoinVO compEstiSubmitOneSelect(Long seq);

    // 업체 견적서 수정
    public int CompEstimateUpdate(CompEstiListJoinVO vo);
}
