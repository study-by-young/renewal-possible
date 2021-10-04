package com.yedam.possable.app.car.service;

import com.yedam.possable.app.car.mapper.CarMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CarServiceImpl implements CarService{
    @Autowired
    CarMapper carMapper;
}
