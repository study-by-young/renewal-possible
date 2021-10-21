package com.yedam.possable.app.company.controller;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.yedam.possable.app.car.domain.CarOptionVO;
import com.yedam.possable.app.car.domain.CarVO;
import com.yedam.possable.app.car.domain.InsuranceOptionVO;
import com.yedam.possable.app.car.service.CarService;
import com.yedam.possable.app.common.code.service.CodeService;
import com.yedam.possable.app.common.criteria.domain.Criteria;
import com.yedam.possable.app.common.criteria.domain.PageVO;
import com.yedam.possable.app.company.domain.CompanyVO;
import com.yedam.possable.app.company.service.CompanyService;
import com.yedam.possable.app.member.domain.MemberVO;
import com.yedam.possable.app.member.service.MemberService;
import com.yedam.possable.app.rent.domain.CompEstiListJoinVO;
import com.yedam.possable.app.rent.domain.RentHistoryVO;
import com.yedam.possable.app.rent.service.PremiumRentService;
import com.yedam.possable.app.rent.service.RentHistoryService;
import com.yedam.possable.app.rent.service.RentReviewService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/company/*")
public class CompanyController {
    @Autowired
    CompanyService companyService;
    @Autowired
    CarService carService;
    @Autowired
    MemberService memberService;
    @Autowired
    RentHistoryService rentHistoryService;
    @Autowired
    CodeService codeService;
    @Autowired
    PremiumRentService premiumRentService;
    @Autowired
    RentReviewService rentReviewService;

    //업체 대시보드
    @GetMapping("/dashboard")
    public String dashboard(HttpServletRequest request,
                            RedirectAttributes attributes,
                            Authentication authentication, Model model) {
        MemberVO loginUser = memberService.getLoginMember(authentication);
        CompanyVO companyVO = companyService.getCompanyByMemSeq(loginUser);
        if (companyVO == null) {
            attributes.addFlashAttribute("denyMsg", "업체회원이 아닙니다.");
            return "redirect:" + request.getHeader("REFERER");
        }

        HttpSession session = request.getSession();
        session.setAttribute("cmpnSeq", companyVO.getSeq());

        model.addAttribute("salesList", rentHistoryService.getLatestCompanySales(companyVO.getSeq()));
        model.addAttribute("todayList",rentHistoryService.getCompanyTodayCar(companyVO.getSeq()));
        model.addAttribute("reviewList",rentReviewService.getCompanyReivewList(companyVO.getSeq()));
        return "company/dashboard";
    }

    @ResponseBody
    @GetMapping("salesList")
    public  String salesList( Authentication authentication, Locale locale, Model model,  CompanyVO vo) {

    	MemberVO loginUser = memberService.getLoginMember(authentication);
    	vo = companyService.getCompanyByMemSeq(loginUser);
    	Gson gson = new Gson();
        List<Map<String, Object>> list = rentHistoryService.getLatestCompanySales(vo.getSeq());
		return gson.toJson(list);
	}

    //업체 정보 수정 페이지
    @GetMapping("/editInfo")
    public String editCompanyInfoForm(CompanyVO vo, Model model, @RequestParam("cmpnSeq") Long cmpnSeq) {

        vo.setSeq(cmpnSeq);
        model.addAttribute("company", companyService.companyOneSelect(vo));

        return "company/editInfo";
    }

    // 업체 정보 수정 전 검증 폼
    @GetMapping("/editInfo/checkPw")
    public String beforeEditCompanyInfo(){
        return "company/editInfoBefore";
    }

    // 업체 정보 수정 처리
    @PostMapping("/editInfo/complete")
    public String editCompanyInfo(CompanyVO vo,
                                  Model model,
                                  RedirectAttributes attributes){
    	String r = "";
        int result = companyService.companyInfoUpdate(vo);
        if (result == 1) {
            attributes.addFlashAttribute("result", "success");
            r = "redirect:/company/editInfo?cmpnSeq="+vo.getSeq();
        }
        return r;
    }

    // 업체 삭제 처리
    @PostMapping("/editInfo/delete")
    public String deleteCompany(CompanyVO vo,  @RequestParam("memSeq") Long memSeq, RedirectAttributes rttr){
    	  MemberVO memVo = new MemberVO();
          memVo.setSeq(memSeq);
          memVo.setAuthor("ROLE_USER");
          vo.setMemberVO(memVo);
          memberService.authorUpdate(memVo);
    		int result = companyService.deleteCompany(vo);
    		if(result == 1) {
    			rttr.addFlashAttribute("result", "success");
    		}

    		return "redirect:/";		//파라미터 전달 X
    }

    //업체 보유 렌트카 리스트
    @GetMapping("/car")
    public String companyCarList(CompanyVO vo,Model model, @ModelAttribute("cri") Criteria cri, @RequestParam Long cmpnSeq){
        vo.setSeq(cmpnSeq);

        List<Map<String, Object>> carList = new LinkedList<>();
        List<CarVO> voList = carService.getCompanyCriList(cri, cmpnSeq);

        for(CarVO carVO : voList) {
            Map<String, Object> voMap = new HashMap<>();
            String status = codeService.getCodeByValue(carVO.getStatus()).getName();
            String brand = codeService.getBrand(carVO.getBrand()).getName();
            String model2 = codeService.getModel(carVO.getModel()).getName();

            voMap.put("carVO", carVO);
            voMap.put("status", status);
            voMap.put("brand", brand);
            voMap.put("model", model2);

            carList.add(voMap);
        }

        int total = carService.comTotalCount(cri, cmpnSeq);
        model.addAttribute("pageMaker", new PageVO(cri, total));
        model.addAttribute("companyCarList", carList);
        return "company/carList";
    }

    // 업체 보유 렌트카 상세
    @GetMapping("/car/view")
    public String companyCarOneSelect(CarVO vo, Model model, CarOptionVO optVO, @RequestParam Long seq, @RequestParam Long cmpn) {
        CompanyVO companyVO = new CompanyVO();
        companyVO.setSeq(cmpn);
       vo.setSeq(seq);
       vo.setCompanyVO(companyVO);

       vo = carService.getCompanyCar(vo);

       String brand = codeService.getBrand(vo.getBrand()).getName();
       String model2 = codeService.getModel(vo.getModel()).getName();
       String segment = codeService.getCodeByValue(vo.getSegment()).getName();
       String trim = codeService.getTrim(vo.getTrim()).getName();
       String fuel = codeService.getCodeByValue(vo.getFuel()).getName();
       String color = codeService.getCodeByValue(vo.getColor()).getName();
       String mission = codeService.getCodeByValue(vo.getMission()).getName();

       String carOptCode = codeService.getMasterCodeByName("차량 옵션").getCode();

       model.addAttribute("car", vo);
       model.addAttribute("brand", brand);
       model.addAttribute("model2", model2);
       model.addAttribute("segment", segment);
       model.addAttribute("trim", trim);
       model.addAttribute("fuel", fuel);
       model.addAttribute("color", color);
       model.addAttribute("mission", mission);

       model.addAttribute("carOpt", carService.getCarOptions(vo));

       model.addAttribute("opt", codeService.getCodesByParentCode(carOptCode));
       return "company/carView"; // JSP에서 company 시퀀스 넘겨줘야함
    }

    // 업체 렌트카 등록 폼
    @GetMapping("/car/register")
    public String carRegisterForm(Model model){
    	 String carOptCode = codeService.getMasterCodeByName("차량 옵션").getCode();
         String fuelCode = codeService.getMasterCodeByName("연료").getCode();
         String statusCode = codeService.getMasterCodeByName("차 상태").getCode();
         String segmentCode = codeService.getMasterCodeByName("세그먼트").getCode();
         model.addAttribute("brands", codeService.getBrandList());
         model.addAttribute("segment", codeService.getCodesByParentCode(segmentCode));
         model.addAttribute("carOpt", codeService.getCodesByParentCode(carOptCode));
         model.addAttribute("fuels", codeService.getCodesByParentCode(fuelCode));
         model.addAttribute("status", codeService.getCodesByParentCode(statusCode));
    	return "company/carRegForm";
    }

    // 업체 렌트카 등록 처리
    @PostMapping("/car/register")
    public String registerCar(CarVO vo, @RequestParam Long cmpnSeq, HttpServletRequest request, CarOptionVO optVO,  @RequestParam("options") String[] optionsArr, RedirectAttributes rttr) throws IllegalStateException, IOException{
    	String r = "";
    	
       HttpSession session = request.getSession();
        String root_path = session.getServletContext().getRealPath("/");
        String attach_path = "resources/images/";
        String fileName=null;
      MultipartFile uploadFile = vo.getUploadFile();

      if (!uploadFile.isEmpty()) {
         String originalFileName = uploadFile.getOriginalFilename();
         String ext = FilenameUtils.getExtension(originalFileName);   //확장자 구하기
         UUID uuid = UUID.randomUUID();   //UUID 구하기
         fileName=uuid+"."+ext;
         uploadFile.transferTo(new File(root_path + attach_path + fileName));
      }
      vo.setImg1(fileName);

        int result = carService.insertCompanyCar(vo);
        rttr.addFlashAttribute("result", result);

        int result2 = 0;
        for(String options : optionsArr) {
        	 optVO.setCarSeq(vo.getSeq());
        	 optVO.setOptCode(options);
        	 System.out.println(optVO);
        	 result2 = carService.insertCarOptions(optVO);
        	}

        rttr.addFlashAttribute("result2", result2);
        r = "redirect:/company/car?cmpnSeq="+cmpnSeq;

        return r;
    }

    // 업체 렌트카 수정 폼
    @GetMapping("/car/update")
    public String carUpdateForm(){
        return "company/carRegForm";
    }

//    // 업체 렌트카 수정 처리
//    @PostMapping("/car/update")
//    public String updateCar(){
//        return "";
//    }



    // 수정, 삭제처리 어떤 게 사용하는 건지 모르겠어서 일단 하나는 주석처리해두었습니다.


    // 업체 렌트카 수정 처리
    @PostMapping("/car/update")
    public String updateCar(CarVO vo, CarOptionVO optVO, CompanyVO comVO, Model model, RedirectAttributes rttr, @RequestParam Long cmpnSeq, @RequestParam("options") String[] optionsArr){

    	String r = "";

    	comVO.setSeq(cmpnSeq);
    	optVO.setCarSeq(vo.getSeq());

    	System.out.println("======="+vo);

    	int result = carService.updateCarPrice(vo);
    	rttr.addFlashAttribute("result", result);

    	int result1 = carService.deleteOption(optVO);
    	rttr.addFlashAttribute("result1", result1);

    	 int result2 = 0;

         for(String options : optionsArr) {
         	 optVO.setCarSeq(vo.getSeq());
         	 optVO.setOptCode(options);
         	 System.out.println(optVO);
         	 result2 = carService.insertCarOptions(optVO);
         	}

         rttr.addFlashAttribute("result2", result2);
         r = "redirect:/company/car?cmpnSeq="+cmpnSeq;

    return r;
    }

    // 업체 렌트카 삭제 처리
    @ResponseBody
    @PostMapping("/car/delete")
    public String deleteCar(CarVO vo, CarOptionVO optVO, InsuranceOptionVO insVO, @RequestParam Long seq, @RequestParam Long cmpnSeq, RedirectAttributes rttr){
    	String r = "";
    	
    	vo.setSeq(seq);
    	optVO.setCarSeq(seq);
    	insVO.setCarSeq(seq);
    	carService.deleteOption(optVO);
    	carService.deleteIns(insVO);

    	int result = carService.deleteCompanyCar(vo);
		if(result == 1) {
			rttr.addFlashAttribute("result", "success");
		}
		
		r = "redirect:/company/car?cmpnSeq="+cmpnSeq;
				
		return r;
    }

    // 견적 제출 리스트
    @GetMapping("/estSubmit")
    public String estSubmitList(CompEstiListJoinVO vo,
					    		Model model,
					    		@RequestParam Long cmpnSeq,
					    		Authentication authentication){
    	 vo.setCmpnSeq(cmpnSeq);

    	 List<CompEstiListJoinVO> estimate = premiumRentService.compEstiSubmitList(vo.getCmpnSeq());
    	 System.out.println("제발....."+estimate);
    	 model.addAttribute("estimate", estimate);
    	 //Map<String, Object> attr = new LinkedHashMap<>();

         // List<Map<String, Object>> estimateList = premiumRentService.compEstiSubmitList();

         //attr.put("estList", estimateList);
         //System.out.println("너 뭐니?"+estimateList);
         //model.addAllAttributes(attr);
         return "company/estSubmitList";
    }

    // 견적 제출 상세
    @GetMapping("/estSubmit/view")
    public String estSubmitView(Model model,@RequestParam Long seq ){

    	String carOptCode = codeService.getMasterCodeByName("차량 옵션").getCode();
    	System.out.println("========="+carOptCode);

        System.out.println("seq 값 들고오지 그치? ㅎ"+ seq);
        model.addAttribute("estimate",premiumRentService.compEstiSubmitOneSelect(seq));
        System.out.println(premiumRentService.compEstiSubmitOneSelect(seq));
        model.addAttribute("carOpt", codeService.getCodesByParentCode(carOptCode));

    	return "company/estSubmitView";
    }

    // 견적 제출 수정 폼
    @GetMapping("/estSubmit/update")
    public String estSubmitUpdateForm() {
    	return "";
    }

    // 견적 제출 수정 처리
    @PostMapping("/estSubmit/update")
    public String updateEstSubmit(CompEstiListJoinVO vo, @RequestParam Long seq, @RequestParam String status,
			  					  @RequestParam("options") String[] itemsArr,
			  					  RedirectAttributes attributes){
    	System.out.println(status);
    	vo.setItems(Arrays.toString(itemsArr));
    	String message = "";
    	String r = "";
    	if (status.equals("대기중")) {
    		message = "견적이 수정 되었습니다.";
    		System.out.println(message);
    		r = "redirect:/company/estSubmit?cmpnSeq=" + vo.getSeq();
    		 premiumRentService.CompEstimateUpdate(vo);
    	} else {
    		message = "결제가 완료된 견적입니다.";
    		System.out.println(message);
    		r = "redirect:/company/estSubmit/view?seq="+vo.getSeq();
    	}
    	attributes.addFlashAttribute("message" , message);
    	attributes.addAttribute("seq", vo.getSeq());

    	return r;
    }

    // 렌트 내역 리스트
    @GetMapping("/rent")
    public String rentHistoryList(Model model, @RequestParam Long cmpnSeq, @ModelAttribute("cri") Criteria cri){

    	List<Map<String, Object>> rentList = new LinkedList<>();
        List<RentHistoryVO> voList = rentHistoryService.getRentHistoryListByCmpnSeq(cri, cmpnSeq);
        
        for(RentHistoryVO vo : voList) {
            Map<String, Object> voMap = new HashMap<>();
            String status = codeService.getCodeByValue(vo.getStatus()).getName();
            voMap.put("rentHistoryVO", vo);
            voMap.put("status", status);
            rentList.add(voMap);
        }
    	
    	int total = rentHistoryService.getTotalCount(cri,cmpnSeq);
    	System.out.println("total=============="+total);
    	model.addAttribute("pageMaker", new PageVO(cri, total));
    	model.addAttribute("rentHistoryList", rentList);
        System.out.println("rentCri========" + cri);

        return "company/rentHistoryList";
    }

    // 렌트 내역 상세
    @GetMapping("/rent/view")
    public String rentHistoryView(RentHistoryVO vo, Model model){
    	
    	vo = rentHistoryService.getRentHistory(vo.getSeq());
    	String status = codeService.getCodeByValue(vo.getStatus()).getName();
    	
    	model.addAttribute("rentHistory", vo);
    	model.addAttribute("status", status);
    	return "company/rentHistoryView";
    }


    // -----------------------------------------------------------------------------

}
