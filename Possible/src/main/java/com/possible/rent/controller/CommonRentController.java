package com.possible.rent.controller;

import com.possible.car.domain.CarVO;
import com.possible.car.domain.InsuranceOptionVO;
import com.possible.car.service.CarService;
import com.possible.common.code.domain.CodeMasterVO;
import com.possible.common.code.service.CodeService;
import com.possible.common.criteria.domain.Criteria;
import com.possible.common.criteria.domain.PageVO;
import com.possible.company.domain.CompanyVO;
import com.possible.company.service.CompanyService;
import com.possible.member.service.MemberService;
import com.possible.rent.domain.RentHistoryVO;
import com.possible.rent.domain.RentReviewVO;
import com.possible.rent.service.RentHistoryService;
import com.possible.rent.service.RentReviewService;
import com.yedam.possable.app.member.domain.MemberVO;
import lombok.extern.java.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Log
@Controller
@RequestMapping("/commonRent")
public class CommonRentController {
    @Autowired
    private CodeService codeService;;
    @Autowired
    private RentHistoryService rentHistoryService;
    @Autowired
    private CarService carService;
    @Autowired
    private RentReviewService rentReviewService;
    @Autowired
    private CompanyService companyService;
    @Autowired
    private MemberService memberService;

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
                              CompanyVO cVo,
                              RentReviewVO rVo,
                              @RequestParam("insCode") String insuranceCode,
                              @ModelAttribute("startDate")
                                  @DateTimeFormat(pattern = "yyyy/MM/dd") Date startDate,
                              @ModelAttribute("endDate")
                                  @DateTimeFormat(pattern = "yyyy/MM/dd") Date endDate,
                              @ModelAttribute("cri") Criteria cri) {
        CarVO carVO = carService.getCar(vo);
        for(InsuranceOptionVO insVO : carVO.getInsuranceList()){
            if(insVO.getOptCode().equals(insuranceCode)){
                model.addAttribute("insurance", insVO);
                break;
            }
        }
        
        
        CompanyVO cmpnVO = companyService.companyOneSelect(carVO.getCompanyVO());
        rVo.setCompanyVO(cmpnVO);
        model.addAttribute("car", carVO);
        model.addAttribute("reviewList", rentReviewService.getRentReviewListByCompany(rVo));
        
        List<RentReviewVO> reviews = rentReviewService.getRentReviewListByCompany(rVo);
        System.out.println("-------------------" + rentReviewService.getRentReviewListByCompany(rVo));
        
        for(int i=0; i<reviews.size(); i++) {
        	model.addAttribute("history", rentHistoryService.getRentHistory(reviews.get(i).getHistorySeq()));
        	rVo.setRentHistoryVO(rentHistoryService.getRentHistory(reviews.get(i).getHistorySeq()));
        	System.out.println("++++++his" + rentHistoryService.getRentHistory(reviews.get(i).getHistorySeq()));
        	System.out.println("제발 마지막" + rVo);
        }
        model.addAttribute("reviews", rVo);
        
        

    	// 넘어와야 하는 값
    	// startDate, endDate, searchArea, carSeq, cmpnSeq

        return "rent/comm/carView";
    }

    // 렌트카 예약 폼
    @GetMapping("/view/book")
    public String rentCarBook(CarVO carVO,
                              Authentication authentication,
                              RedirectAttributes attributes,
                              @RequestParam("ins") String insuranceCode,
                              @ModelAttribute("startDate")
                              @DateTimeFormat(pattern = "yyyy/MM/dd") Date startDate,
                              @ModelAttribute("endDate")
                                  @DateTimeFormat(pattern = "yyyy/MM/dd") Date endDate,
                              Model model) {
        MemberVO loginUser = memberService.getLoginMember(authentication);

        if(loginUser == null){
            attributes.addFlashAttribute("alertMsg", "로그인 후 이용 가능합니다.");
            return "redirect:/login";
        }
        carVO = carService.getCar(carVO);
        for(InsuranceOptionVO insVO : carVO.getInsuranceList()){
            if(insVO.getOptCode().equals(insuranceCode)){
                model.addAttribute("insurance", insVO);
                break;
            }
        }
        model.addAttribute("car", carService.getCar(carVO));
    	model.addAttribute("user", loginUser);

        return "rent/comm/carBook";
    }

    // 결제 데이터 DB 입력
    @PostMapping("/payment")
    @ResponseBody
    public String payment(@RequestBody RentHistoryVO vo) {
        return rentHistoryService.insertRentHistory(vo) != 0 ? "true" : "false";
    }


    // 렌트카 예약 완료
    @GetMapping("/view/bookCmpl")
    public String bookComplete(Model model,
                               @RequestParam("merchantUid") String mUid){
    	RentHistoryVO rentHistoryVO = rentHistoryService.getRentHistoryByMUid(mUid);
    	model.addAttribute("rent", rentHistoryVO);
    	return "rent/comm/bookComplete";
    }
}
