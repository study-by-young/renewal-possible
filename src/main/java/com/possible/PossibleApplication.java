package com.possible;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class PossibleApplication {

	public static void main(String[] args) {
		SpringApplication.run(PossibleApplication.class, args);
	}


//    private final IamportClient importApi = new IamportClient("5643461465743291","f1f4beff20f76010dfe7c6a4a6ac2d966c1b416c995750927a96f195bbfab4748ab148b64c6adb26");
//	@Autowired
//	CodeService codeService;
//	@Autowired
//	TourService tourService;
//	@Autowired
//	FaqService faqService;
//	@Autowired
//	RentReviewService rentReviewService;
//
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home(Model model) {
//		CodeMasterVO codeMasterVO = codeService.getMasterCodeByName("지역");
//		model.addAttribute("areaCodes",codeService.getCodesByParentCode(codeMasterVO.getCode()));
//		model.addAttribute("tourList", tourService.getLatestList());
//		model.addAttribute("faqList", faqService.getList(new Criteria()));
//		model.addAttribute("reviewList", rentReviewService.getLatestReviewList());
//		return "home";
//	}
//
//	@RequestMapping("/pagination")
//    public String pagination(){
//	    return "tiles/pagination";
//    }
//
//	@RequestMapping("/errorPage")
//    public String errorPage(){
//	    return "errorPage";
//    }
//
//    @ResponseBody
//    @RequestMapping(value="/verifyIamport/{imp_uid}")
//    public IamportResponse<Payment> paymentByImpUid(
//            Model model
//            , Locale locale
//            , HttpSession session
//            , @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException {
//        return importApi.paymentByImpUid(imp_uid);
//    }
//
//    @RequestMapping(value="/orderCompleteMobile", produces = "application/text; charset=utf8", method = RequestMethod.GET)
//    public void orderCompleteMobile(
//            @RequestParam(required = false) String imp_uid
//            , @RequestParam(required = false) String merchant_uid
//            , Model model
//            , Locale locale
//            , HttpSession session) throws IamportResponseException, IOException {
//
//        IamportResponse<Payment> result = importApi.paymentByImpUid(imp_uid);
//
//        // 결제 가격과 검증결과를 비교한다.
//        if(result.getResponse().getAmount().compareTo(BigDecimal.valueOf(100)) == 0) {
//            System.out.println("검증통과");
//        }
//    }
}

