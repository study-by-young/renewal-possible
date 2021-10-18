package com.yedam.possable.app.rent.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.yedam.possable.app.car.domain.CarVO;
import com.yedam.possable.app.car.service.CarService;
import com.yedam.possable.app.common.code.domain.CodeMasterVO;
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
    @GetMapping
    public String rentCarList(Model model,
							  @ModelAttribute("startDate")
								  @DateTimeFormat(pattern = "yyyy/MM/dd") Date startDate,
							  @ModelAttribute("endDate")
								  @DateTimeFormat(pattern = "yyyy/MM/dd") Date endDate,
							  @ModelAttribute("cri") Criteria cri) {
    	// 자동차 SEQ -> 업체SEQ -> 업체정보, 리뷰개수
    	// 자동차 SEQ -> 보험
    	List<CarVO> modelList = carService.getDistinctCarList(cri);
		Map<String, List<CarVO>> carListByModel = new HashMap<>();
        int countOfModelList = modelList.size();// carService.getTotalCount(cri);  차량 모델 갯수

    	for(CarVO modelInfo : modelList) {
    		List<CarVO> carListInModel = carService.getCarByModel(modelInfo);
            carListByModel.put(modelInfo.getModel(),carListInModel);
    	}

		if(endDate.compareTo(startDate) == 0){
			endDate.setDate(startDate.getDate() + 1);
		}
		log.info(modelList.toString());
    	// 차 모델별(car.model)로 업체 리스트를 뽑고 여기서 뽑은 차 SEQ랑 업체 SEQ로
    	// 차 SEQ(modelList.seq)를 가지고 차가 가진 보험 목록을 뽑고
    	// 업체 SEQ(modelList.cmpn_seq)를 가지고 업체에 달린 후기 개수를 뽑고


    	// 모델별로 대표 하나만 보여주기
		model.addAttribute("modelList", modelList);
    	model.addAttribute("carList", carListByModel);
    	model.addAttribute("segments",codeService.getCodesByParentCode("SEG"));
    	model.addAttribute("fuels", codeService.getCodesByParentCode("FUL"));
    	model.addAttribute("brands", codeService.getBrandList());
    	model.addAttribute("pagination", new PageVO(cri, countOfModelList));
    	CodeMasterVO codeMasterVO = codeService.getMasterCodeByName("지역");
		model.addAttribute("areaCodes",codeService.getCodesByParentCode(codeMasterVO.getCode()));
        return "rent/comm/carList";
    }

    // 렌트카 상세보기
    @GetMapping("/view")
    public String rentCarView(Model model,
                              CarVO vo,
                              @RequestParam("startDate")
                                  @DateTimeFormat(pattern = "yyyy/MM/dd") Date startDate,
                              @RequestParam("endDate")
                                  @DateTimeFormat(pattern = "yyyy/MM/dd") Date endDate,
                              @ModelAttribute("cri") Criteria cri) {
    	model.addAttribute("car", carService.getCar(vo));
        model.addAttribute("start", startDate);
        model.addAttribute("end", endDate);
        model.addAttribute("reviewList",rentReviewService.getReviewListByCmpnSeq(vo));

    	// 넘어와야 하는 값
    	// startDate, endDate, searchArea, carSeq, cmpnSeq

        return "rent/comm/carView";
    }

    // 렌트카 예약 폼
    @GetMapping("/view/book")
    public String rentCarBook(CarVO carVO,
                              @RequestParam("startDate")
                              @DateTimeFormat(pattern = "yyyy/MM/dd") Date startDate,
                              @RequestParam("endDate")
                                  @DateTimeFormat(pattern = "yyyy/MM/dd") Date endDate,
                              Model model) {
        model.addAttribute("car", carService.getCar(carVO));
        model.addAttribute("start", startDate);
        model.addAttribute("end", endDate);
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
