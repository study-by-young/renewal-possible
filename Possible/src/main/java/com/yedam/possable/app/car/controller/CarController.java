package com.yedam.possable.app.car.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yedam.possable.app.car.domain.CarOptionVO;
import com.yedam.possable.app.car.domain.CarVO;
import com.yedam.possable.app.car.service.CarService;

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
        return carService.getCar_map(vo);
    }
}
