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
import com.yedam.possable.app.car.service.CarService;
import com.yedam.possable.app.common.code.mapper.CodeMapper;
import com.yedam.possable.app.rent.domain.RentHistoryVO;
import com.yedam.possable.app.rent.service.PaymentService;

@Controller
@RequestMapping("/commonRent")
public class CommonRentController {
    @Autowired
    private CodeMapper codeMapper;
    @Autowired
    private PaymentService paymentService;
    @Autowired
    private CarService carService;

    // 렌트카 리스트
    @GetMapping("/list")
    public String rentCarList(Model model){
    	model.addAttribute("list", carService.getCarList());
        model.addAttribute("areaCodes",codeMapper.getCodesByParentCode("지역"));
        return "rent/comm/carList";
    }

    // 렌트카 상세보기
    @GetMapping("/view")
    public String rentCarView(){
        return "rent/comm/carView";
    }

    // 렌트카 예약 폼
    @GetMapping("/view/book")
    public String rentCarBook(){
        return "rent/comm/carBook";
    }

    // 결제데이터 DB 입력
    @PostMapping("/view/payment")
    @ResponseBody
    public void payment(@RequestBody RentHistoryVO vo) {
		paymentService.paymentInsert(vo);
    }    
    
    // 렌트카 예약 완료
    @GetMapping("/view/bookCmpl")
    public String bookComplete(Model model, RentHistoryVO vo, CarVO carVo){
    	vo.setSeq(paymentService.readSeq(vo.getMerchantUid()));
    	carVo.setSeq(vo.getCarSeq());
    	model.addAttribute("rent", paymentService.paymentOneSelect(vo.getSeq()));
    	model.addAttribute("car", carService.getCar(carVo));    	
    	return "rent/comm/bookComplete";
    }
}
