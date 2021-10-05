package com.yedam.possable.app.car.service;

import com.yedam.possable.app.car.domain.CarVO;

import java.util.List;

public interface CarService {
    // 차량 목록 조회
    public List<CarVO> getCarList();

    // 차량 단건 조회
    public CarVO getCar(Long seq);
}
