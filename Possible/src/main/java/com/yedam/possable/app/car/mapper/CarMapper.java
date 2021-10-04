package com.yedam.possable.app.car.mapper;

import com.yedam.possable.app.car.domain.CarOptionVO;
import com.yedam.possable.app.car.domain.CarVO;
import com.yedam.possable.app.car.domain.InsuranceOptionVO;

import java.util.List;

public interface CarMapper {
    // 차량 목록 조회
    public List<CarVO> getCarList();

    // 차량 단건 조회
    public CarVO getCar(Long seq);

    // 차량 옵션 조회
    public List<CarOptionVO> getCarOptions(Long seq);

    // 차량 보험 조회
    public List<InsuranceOptionVO> getCarInsurance(Long seq);
}
