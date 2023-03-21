package com.possible.car.mapper;

import com.possible.car.domain.CarOptionVO;
import com.possible.car.domain.CarVO;
import com.possible.car.domain.InsuranceOptionVO;
import com.possible.common.criteria.domain.Criteria;
import com.possible.company.domain.CompanyVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CarMapper {
    // 차량 목록 조회
    public List<CarVO> getCarList();

    // 차량 단건 조회
    public CarVO getCar(CarVO vo);

    // 차량 옵션 조회
    public List<CarOptionVO> getCarOptions(CarVO vo);

    // 차량 보험 조회
    public List<InsuranceOptionVO> getCarInsurance(CarVO vo);

    // 차량 보험 단건 조회
    public InsuranceOptionVO getCarInsuranceByCode(@Param("seq") String seq, @Param("code") String insCode);

    // 차량 상태 변경
    public int updateStatus(CarVO vo);

    // 업체 차량 리스트 조회
    public List<CarVO> getCompanyCarList(CompanyVO vo);

    // 업체 차량 조회
    public CarVO getCompanyCar(CarVO vo);

    //업체 차량 등록
    public int insertCompanyCar(CarVO vo);

    // 업체 차량 삭제
    public int deleteCompanyCar(CarVO vo);

    // 업체 차량 수정
    public int updateCompanyCar(CarVO vo);

    // 차량 model 중복제거 리스트 조회
    public List<CarVO> getDistinctCarList(Criteria cri);

    // 해당 model을 보유한 업체 리스트 뽑아내기 위한 리스트
    public List<CarVO> getCarByModel(CarVO vo);

    //차량 옵션 추가
    public int insertCarOptions(CarOptionVO vo);

    public int insertCarOptions(List<CarOptionVO> list, Long carSeq);

    public int getTotalCount(Criteria cri);

    //옵션 수정
    public int updateCarOptions(CarOptionVO vo);

    //차량 옵션 삭제
    public int deleteOption(CarOptionVO vo);

    //차량 보험 삭제
    public int deleteIns(InsuranceOptionVO vo);

    //차 가격 수정
    public int updateCarPrice(CarVO vo);

    //전체 데이터 건수
    public int comTotalCount(@Param("cri") Criteria cri, @Param("cmpnSeq") Long cmpnSeq);

    // 업체 차량 리스트 조회
    public List<CarVO> getCompanyCriList(@Param("cri") Criteria cri, @Param("cmpnSeq") Long cmpnSeq);

    // 업체 사용 가능 차량 리스트
    List<CarVO> getCompanyAvailableCarList(Long seq);

    List<CarVO> getCarByModelAndCmpnSeq(CarVO vo);
}

