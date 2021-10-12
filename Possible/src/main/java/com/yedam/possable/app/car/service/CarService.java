package com.yedam.possable.app.car.service;

import com.yedam.possable.app.car.domain.CarOptionVO;
import com.yedam.possable.app.car.domain.CarVO;
import com.yedam.possable.app.car.domain.InsuranceOptionVO;
import com.yedam.possable.app.company.domain.CompanyVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface CarService {
    // 차량 목록 조회
    public List<CarVO> getCarList();

    // 차량 목록 조회
    public List<Map<String, Object>> carList();
    
    // 차량 단건 조회
    public CarVO getCar(CarVO vo);

    // 차량 옵션 조회
    public List<CarOptionVO> getCarOptions(CarVO vo);

    // 차량 보험 조회
    public List<InsuranceOptionVO> getCarInsurance(CarVO vo);

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
    public int updateCompanyCar(@Param("car") CarVO carVO, @Param("cmpn") CompanyVO cmpnVO);

    // 차량 model 중복제거 리스트 조회
    public List<CarVO> getDistinctCarList();
    
    // 해당 model을 보유한 업체 리스트 뽑아내기 위한 리스트
    public List<CarVO> getCarByModel(CarVO vo);
}
