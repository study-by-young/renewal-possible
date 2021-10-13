package com.yedam.possable.app.company.controller;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.possable.app.car.domain.CarOptionVO;
import com.yedam.possable.app.car.domain.CarVO;
import com.yedam.possable.app.car.service.CarService;
import com.yedam.possable.app.common.code.service.CodeService;
import com.yedam.possable.app.company.domain.CompanyVO;
import com.yedam.possable.app.company.service.CompanyService;
import com.yedam.possable.app.member.domain.MemberVO;
import com.yedam.possable.app.member.service.MemberService;
import com.yedam.possable.app.rent.domain.CompEstiListJoinVO;
import com.yedam.possable.app.rent.domain.EstiSubmitHistoryVO;
import com.yedam.possable.app.rent.domain.RentHistoryVO;
import com.yedam.possable.app.rent.service.PremiumRentService;
import com.yedam.possable.app.rent.service.RentHistoryService;

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

    //업체 대시보드
    @GetMapping("/dashboard")
    public String dashboard(HttpServletRequest request,
                            RedirectAttributes attributes,
                            Authentication authentication) {
        MemberVO loginUser = memberService.getLoginMember(authentication);
        CompanyVO companyVO = companyService.getCompanyByMemSeq(loginUser);
        if (companyVO == null) {
            attributes.addFlashAttribute("denyMsg", "업체회원이 아닙니다.");
            return "redirect:" + request.getHeader("REFERER");
        }

        HttpSession session = request.getSession();
        session.setAttribute("cmpnSeq", companyVO.getSeq());


        return "company/dashboard";
    }

    //업체 정보 수정 페이지
    @GetMapping("/editInfo")
    public String editCompanyInfoForm(CompanyVO vo, Model model, @RequestParam Long cmpnSeq) {

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

        int result = companyService.companyInfoUpdate(vo);
        if (result == 1) {
            attributes.addFlashAttribute("result", "success");
        }
        return "redirect:/company/dashboard";

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
    public String companyCarList(CompanyVO vo,Model model, @RequestParam Long cmpnSeq){
        vo.setSeq(cmpnSeq);

       List<CarVO> carList = carService.getCompanyCarList(vo);
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
       model.addAttribute("car",carService.getCompanyCar(vo));
       model.addAttribute("opt", carService.getCarOptions(vo));
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
    public String registerCar(CarVO vo, HttpServletRequest request, CarOptionVO optVO,  @RequestParam("options") String[] optionsArr, RedirectAttributes rttr) throws IllegalStateException, IOException{

    	HttpSession session = request.getSession();
        String root_path = session.getServletContext().getRealPath("/");
        String attach_path = "resources/images";


    	String fileName=null;
		MultipartFile uploadFile = vo.getUploadFile();

		if (!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);	//확장자 구하기
			UUID uuid = UUID.randomUUID();	//UUID 구하기
			fileName=uuid+"."+ext;
			uploadFile.transferTo(new File(root_path + attach_path + fileName));
		}
		vo.setImg1(fileName);

    	// 코드 -> 네임 변환
        vo.setSegment(codeService.getCodeByValue(vo.getSegment()).getName());
        vo.setBrand(codeService.getBrand(vo.getBrand()).getName());
        vo.setModel(codeService.getModel(vo.getModel()).getName());
        vo.setTrim(codeService.getTrim(vo.getTrim()).getName());
        vo.setFuel(codeService.getCodeByValue(vo.getFuel()).getName());

        int result = carService.insertCompanyCar(vo);
        rttr.addFlashAttribute("result", result);

        optVO.setCarSeq(vo.getSeq());
        optVO.setOptCode(Arrays.toString(optionsArr));

          int result2 = carService.insertCarOptions(optVO);
          rttr.addFlashAttribute("result2", result2);

        return "redirect:/company/car";
    }

    // 업체 렌트카 수정 폼
    @GetMapping("/car/update")
    public String carUpdateForm(){
        return "company/carRegForm";
    }

    // 업체 렌트카 수정 처리
    @PostMapping("/car/update")
    public String updateCar(){
        return "";
    }

    // 업체 렌트카 삭제 처리
    @ResponseBody
    @PostMapping("/car/delete")
    public int deleteCar(CarVO vo, HttpSession session,
                            @RequestParam(value = "chbox[]") List<String> chArr){

    	int result = 0;
        Long seq = 0L;

        for (String i : chArr) {
            seq = Long.parseLong(i);
            vo.setSeq(seq);

            carService.deleteCompanyCar(vo);
        }
        result = 1;

        return result;
    }

    // 견적 제출 리스트
    @GetMapping("/estSubmit")
    public String estSubmitList(CompEstiListJoinVO vo,
					    		Model model,
					    		@RequestParam Long cmpnSeq,
					    		Authentication authentication){

    	System.out.println("넌 뭔데?"+cmpnSeq);
    	
    	vo.setCmpnSeq(cmpnSeq);
    	 System.out.println("이건될까..?"+vo.toString());
    	 System.out.println("이거 뭔데?"+vo.toString());

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
    public String updateEstSubmit(CompEstiListJoinVO vo,
    							  @RequestParam Long cmpnSeq,
			  					  @RequestParam("options") String[] itemsArr,
			  					  RedirectAttributes attributes){
    	vo.setItems(Arrays.toString(itemsArr));
    	System.out.println("넌뭐니?"+cmpnSeq);
    	vo.setCmpnSeq(cmpnSeq);
    	System.out.println("바뀐값이 무엇이드냐!!"+vo.getItems());
    	int result = premiumRentService.CompEstimateUpdate(vo);
    	System.out.println(cmpnSeq + "뭐냐?");
    	String message = "";

    	System.out.println("0?1?"+result);
    	if (result == 1) {
    		message = "견적이 수정 되었습니다.";
    	} else {
    		message = "견적 수정에 실패했습니다. \n잠시후 다시 시도해주세요";
    	}
    	attributes.addFlashAttribute("message" , result);
    	attributes.addAttribute("seq", vo.getSeq());
    	return "redirect:/company/estSubmit?cmpnSeq=" + vo.getSeq();
    	
    }

    // 렌트 내역 리스트
    @GetMapping("/rent")
    public String rentHistoryList(Model model, @RequestParam Long cmpnSeq){
    	model.addAttribute("rentHistoryList", rentHistoryService.getRentHistoryList(cmpnSeq));

        return "company/rentHistoryList";
    }

    // 렌트 내역 상세
    @GetMapping("/rent/view")
    public String rentHistoryView(RentHistoryVO vo, Model model){
    	 model.addAttribute("rentHistory", rentHistoryService.getRentHistory(vo));
    	return "company/rentHistoryView";
    }


    // -----------------------------------------------------------------------------



    //차트 테스트
    @GetMapping("/incomeTest")
    public String incomeTest(Model model) {

        HashMap<String, Object> map = companyService.companyIncome();
        System.out.println(map);

        return "company/incomeTest";
    }
}

