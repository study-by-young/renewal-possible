package com.yedam.possable.app.car.service;

import com.yedam.possable.app.car.domain.CarVO;
import com.yedam.possable.app.car.mapper.CarMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CarServiceImpl implements CarService{
    @Autowired
    CarMapper carMapper;

    @Override
    public List<CarVO> getCarList() {
        return carMapper.getCarList();
    }

    @Override
    public CarVO getCar(Long seq) {
        return carMapper.getCar(seq);
    }
}
