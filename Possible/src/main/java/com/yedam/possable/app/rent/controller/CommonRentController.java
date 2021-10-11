package com.yedam.possable.app.rent.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.possable.app.car.domain.CarVO;
import com.yedam.possable.app.car.domain.InsuranceOptionVO;
import com.yedam.possable.app.car.service.CarService;
import com.yedam.possable.app.common.code.service.CodeService;
import com.yedam.possable.app.company.domain.CompanyVO;
import com.yedam.possable.app.rent.domain.RentHistoryVO;
import com.yedam.possable.app.rent.service.PaymentService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/commonRent")
public class CommonRentController {
    @Autowired
    private CodeService codeService;
    @Autowired
    private PaymentService paymentService;
    @Autowired
    private CarService carService;

    // 렌트카 리스트
    @GetMapping("/list")
    public String rentCarList(Model model, CarVO vo, CompanyVO cmpnVo) {
    	// model.addAttribute("list", carService.getDistinctCarList());
    	
    	List<CarVO> list = carService.getDistinctCarList();
    	List<InsuranceOptionVO> insuranceList;
    	for(int i=0; i<list.size(); i++) {
    		list.get(i).setModelList(carService.getCarByModel(list.get(i).getModel()));
    		
    		for(int j=0; j<list.get(i).getModelList().size(); j++) {
    			list.get(i).setInsuranceList(carService.getCarInsurance(list.get(i).getSeq()));
    			list.get(i).getInsuranceList().get(i).setCarSeq(list.get(i).getSeq());
    			System.out.println("==============" + carService.getCarInsurance(list.get(i).getSeq()));
    			System.out.println("제발---------" + list.get(i).getInsuranceList());
    		}
    	}
    	model.addAttribute("list", list);
        model.addAttribute("areaCodes", codeService.getCodesByParentCode("지역"));
        return "rent/comm/carList";
    }
    
    
    // 렌트카 상세보기
/*    @GetMapping("/view/{seq}/{cmpnSeq}")
    @ResponseBody
    public String rentCarView(Model model
    					, @PathVariable String seq
    					, @PathVariable String cmpnSeq) {
    	model.addAttribute("list", carService.getCarList());
        return "rent/comm/carView";
    }
 */   
    // 렌트카 상세보기(test)
    @GetMapping("/test")
    public String test() {
        return "rent/comm/carTest";
    }

    // 렌트카 예약 폼
    @GetMapping("/view/book")
    public String rentCarBook() {
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
