package com.yedam.possable.app.rent.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.possable.app.car.domain.CarVO;
import com.yedam.possable.app.car.service.CarService;
import com.yedam.possable.app.common.code.service.CodeService;
import com.yedam.possable.app.common.criteria.domain.Criteria;
import com.yedam.possable.app.common.criteria.domain.PageVO;
import com.yedam.possable.app.company.domain.CompanyVO;
import com.yedam.possable.app.company.service.CompanyService;
import com.yedam.possable.app.rent.domain.RentHistoryVO;
import com.yedam.possable.app.rent.domain.RentReviewVO;
import com.yedam.possable.app.rent.service.PaymentService;
import com.yedam.possable.app.rent.service.RentReviewService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/commonRent")
public class CommonRentController {
    @Autowired
    private CodeService codeService;;
    @Autowired
    private PaymentService paymentService;
    @Autowired
    private CarService carService;
    @Autowired
    private RentReviewService rentReviewService;
    @Autowired
    private CompanyService companyService;

    // 렌트카 리스트
    @GetMapping("/list")
    public String rentCarList(Model model, Long seq, CarVO vo, RentReviewVO rvo, @ModelAttribute("cri") Criteria cri) {
    	// 자동차 SEQ -> 업체SEQ -> 업체정보, 리뷰개수
    	// 자동차 SEQ -> 보험
    	int total = carService.getTotalCount(cri);
    	List<CarVO> allList = carService.getDistinctCarList(cri);
    	for(int i=0; i<allList.size(); i++) {
    		CarVO selectedCarInfo = allList.get(i);		
    		List<CarVO> modelList = carService.getCarByModel(selectedCarInfo);
        	
    		for(int j=0; j<modelList.size(); j++) {
        		CarVO selectedModelInfo = modelList.get(j);
        		modelList.get(j).setInsuranceList(carService.getCarInsurance(selectedModelInfo));
        		modelList.get(j).setReviewList(rentReviewService.getReviewListByCmpnSeq(selectedModelInfo));
        		
        		// 리뷰리스트가 null일 경우 해당 차량모델을 보유하고 있더라도 업체가 출력되지 않음 -> 수정 필요
        		if(modelList.get(j).getReviewList().isEmpty()) {
        			
        		}
    		}
    		allList.get(i).setModelList(modelList);
    		System.out.println(allList.get(i).getModelList());
    	}
    	
    	// 차 모델별(car.model)로 업체 리스트를 뽑고 여기서 뽑은 차 SEQ랑 업체 SEQ로
    	// 차 SEQ(modelList.seq)를 가지고 차가 가진 보험 목록을 뽑고
    	// 업체 SEQ(modelList.cmpn_seq)를 가지고 업체에 달린 후기 개수를 뽑고
    	
    	
    	// 모델별로 대표 하나만 보여주기
    	model.addAttribute("list", allList);
    	model.addAttribute("pageMaker", new PageVO(cri, total));
        model.addAttribute("areaCodes", codeService.getCodesByParentCode("지역"));
        return "rent/comm/carList";
    }
    
    // 렌트카 상세보기
    @GetMapping("/view")
    public String rentCarView(Model model, CarVO vo, CompanyVO cmpnVo, @ModelAttribute("cri") Criteria cri) {
    	System.out.println("================" + vo);
    	model.addAttribute("car", carService.getCompanyCar(vo));
    	cmpnVo.setSeq(vo.getCmpnSeq());
    	System.out.println("=-----cmpn" + cmpnVo);
    	model.addAttribute("company", companyService.companyOneSelect(cmpnVo));
    	
    	// 넘어와야 하는 값
    	// startDate, endDate, searchArea, carSeq, cmpnSeq

    	List<CarVO> allList = carService.getDistinctCarList(cri);
    	for(int i=0; i<allList.size(); i++) {
    		CarVO selectedCarInfo = allList.get(i);		
    		List<CarVO> modelList = carService.getCarByModel(selectedCarInfo);
        	
    		for(int j=0; j<modelList.size(); j++) {
        		CarVO selectedModelInfo = modelList.get(j);
        		modelList.get(j).setInsuranceList(carService.getCarInsurance(selectedModelInfo));
        		modelList.get(j).setReviewList(rentReviewService.getReviewListByCmpnSeq(selectedModelInfo));
    		}
    		allList.get(i).setModelList(modelList);
    	}    	
    	model.addAttribute("list", allList);
    	
        return "rent/comm/carView";
    }
 
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
