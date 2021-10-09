package com.yedam.possable.app.rent.controller;

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
import com.yedam.possable.app.car.service.CarService;
import com.yedam.possable.app.common.code.mapper.CodeMapper;
import com.yedam.possable.app.company.domain.CompanyVO;
import com.yedam.possable.app.company.service.CompanyService;
import com.yedam.possable.app.rent.domain.RentHistoryVO;
import com.yedam.possable.app.rent.service.PaymentService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/commonRent")
public class CommonRentController {
    @Autowired
    private CodeMapper codeMapper;
    @Autowired
    private PaymentService paymentService;
    @Autowired
    private CarService carService;
    @Autowired
    private CompanyService companyService;

    // 렌트카 리스트
    @GetMapping("/list")
    public String rentCarList(Model model, CarVO vo, CompanyVO cmpnVo){
    	model.addAttribute("list", carService.getDistinctCarList());
    	// 중복이 제거된 차량 목록을 list에 넣고 요소의 수만큼 반복문을 돌려서 model을 setting 한다.
    	CarVO carVo;
    	List<CarVO> list = carService.getDistinctCarList();
    	for(int i=0; i < list.size(); i++) {
    		carVo = list.get(i);
    		vo.setModel(carVo.getModel());
    	}
    	// model을 setting한 vo를 파라미터로 넣고 해당 모델의 차량을 전부 조회한다.
    	model.addAttribute("modelList", carService.getCarByModel(vo));
    	// 차량모델을 조회한 vo에서 cmpn_seq를 뽑아내서 업체를 조회한다.
    	List<CarVO> modelList = carService.getCarByModel(vo);
    	for(int j=0; j < modelList.size(); j++) {
    		carVo = modelList.get(j);
    		cmpnVo.setSeq(carVo.getCmpnSeq());
    	}
    	model.addAttribute("company", companyService.companyOneSelect(cmpnVo));
        model.addAttribute("areaCodes",codeMapper.getCodesByParentCode("지역"));
        return "rent/comm/carList";
    }

    // 렌트카 상세보기
    @GetMapping("/view")
    public String rentCarView(){
        return "rent/comm/carView";
    }
    
    // 렌트카 상세보기(test)
    @GetMapping("/test")
    public String test(){
        return "rent/comm/carViewTest";
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
