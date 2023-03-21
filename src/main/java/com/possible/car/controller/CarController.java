package com.possible.car.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.possible.car.domain.CarOptionVO;
import com.possible.car.domain.CarVO;
import com.possible.car.service.CarService;
import lombok.extern.java.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Log
@RestController
@RequestMapping("/car")
public class CarController {
    @Autowired
    CarService carService;

    @GetMapping("/{seq}/options")
    public String getCarOptions(@PathVariable("seq") Long carSeq) throws JsonProcessingException {
        CarVO vo = new CarVO();
        vo.setSeq(carSeq);
        List<CarOptionVO> carOptions = carService.getCarOptions(vo);

        return new ObjectMapper().writerWithDefaultPrettyPrinter().writeValueAsString(carOptions);
    }

    @GetMapping("/{seq}")
    public CarVO getCar(@PathVariable("seq") Long carSeq){
        CarVO vo = new CarVO();
        vo.setSeq(carSeq);

        return carService.getCar(vo);
    }
}
