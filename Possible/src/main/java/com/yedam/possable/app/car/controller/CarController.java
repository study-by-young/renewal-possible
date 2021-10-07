package com.yedam.possable.app.car.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yedam.possable.app.car.domain.CarOptionVO;
import com.yedam.possable.app.car.domain.CarVO;
import com.yedam.possable.app.car.service.CarService;

@RestController
@RequestMapping("/car/*")
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

//    @GetMapping("/list")
//    public void getCarList(Model model) {
//        model.addAttribute("carList", carService.getCarList());
//    }
//
//    @GetMapping("/rentFin")
//    public String rentFin() {
//        return "car/rentFin";
//    }
//
//    @GetMapping("/info")
//    public String info() {
//        return "car/info";
//    }
//
//    @GetMapping("/rent")
//    public String rent() {
//        return "car/rent";
//    }
}
