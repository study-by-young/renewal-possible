package com.yedam.possable.app.rent.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.possable.app.car.domain.CarVO;
import com.yedam.possable.app.car.mapper.CarMapper;
import com.yedam.possable.app.car.service.CarService;
import com.yedam.possable.app.common.code.mapper.CodeMapper;
import com.yedam.possable.app.rent.domain.RentHistoryVO;
import com.yedam.possable.app.rent.service.PaymentService;

@Controller
@RequestMapping("/commonRent/*")
public class CommonRentController {
    @Autowired
    private CodeMapper codeMapper;
    @Autowired
    private CarMapper carMapper;
    @Autowired
    private PaymentService paymentService;
    @Autowired
    private CarService carService;

    @GetMapping("/list")
    public String carList(Model model){
    	model.addAttribute("list", carMapper.getCarList());
        model.addAttribute("areaCodes", codeMapper.getCodesByParentCode("지역"));
        return "commonRent/carList";
    }
    
    @GetMapping("/view")
    public String carView(Model model) {
    	return "commonRent/carView";
    }
    
    // 예약페이지로 이동
    @GetMapping("/book")
    public String carBook(CarVO carVo) {
    	return "commonRent/carBook";
    }
    
    // 결제데이터 DB 입력
    @PostMapping("/payment")
    @ResponseBody
    public void payment(@RequestBody RentHistoryVO vo) {
		paymentService.paymentInsert(vo);
    }
    
    // 결제완료페이지로 이동(결제내역 단건조회)
    @GetMapping("/bookComplete")
    public String paymentFin(Model model, RentHistoryVO vo, CarVO carVo) {
    	vo.setSeq(paymentService.readSeq(vo.getMerchantUid()));
    	carVo.setSeq(vo.getCarSeq());
    	model.addAttribute("rent", paymentService.paymentOneSelect(vo.getSeq()));
    	model.addAttribute("car", carService.getCar(carVo));
    	return "commonRent/bookComplete";
    }
    
    // 화면테스트
    @GetMapping("/test")
    public String test() {
    	return "commonRent/rent";
    }
}
