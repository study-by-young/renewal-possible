package com.possible.rent.service;

import com.possible.common.criteria.domain.Criteria;
import com.possible.rent.domain.RentHistoryVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface RentHistoryService {

	//업체 렌트내역 리스트
    public List<RentHistoryVO> getRentHistoryListByCmpnSeq(@Param("cri") Criteria cri, @Param("cmpnSeq")Long cmpnSeq);

    //업체 렌트내역 한건
    public RentHistoryVO getRentHistory(Long seq);

    //어드민 전용 렌트 내역 리스트
    public List<RentHistoryVO> getRentHistoryList();

    // 2021-10-15일 회원 렌트내역 리스트 조회
    public List<RentHistoryVO> getRentHistoryListForMyPage(@Param("cri") Criteria cri, @Param("seq")Long seq);

 	//전체수 검사
 	public int getTotalCount();

    //전체 데이터 건수
    public int getTotalCount(Criteria cri, Long cmpnSeq);

 	//수익
 	public List<Map<String, Object>> getLatestCompanySales(Long cmpnSeq);

 	//투데이 렌트카 리스트
 	public List<RentHistoryVO> getCompanyTodayCar(Long cmpnSeq);

    // 결제정보 DB 삽입
    public int insertRentHistory(RentHistoryVO vo);

    // 회원 현재 진행중인 렌트 내역 조회
    public RentHistoryVO getRentHistoryForMypage(Long seq);

    // 결제 취소 처리
    public int refundRentHistory(String merchantUid);

    // 주문번호로 내역 조회
    public RentHistoryVO getRentHistoryByMUid(String merchantUid);
}
