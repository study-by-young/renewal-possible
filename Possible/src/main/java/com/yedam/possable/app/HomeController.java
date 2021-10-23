package com.yedam.possable.app;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import com.yedam.possable.app.common.code.domain.CodeMasterVO;
import com.yedam.possable.app.common.code.service.CodeService;
import com.yedam.possable.app.common.criteria.domain.Criteria;
import com.yedam.possable.app.common.criteria.domain.PageVO;
import com.yedam.possable.app.community.faq.service.FaqService;
import com.yedam.possable.app.community.tour.service.TourService;
import com.yedam.possable.app.rent.service.RentReviewService;
import lombok.extern.java.Log;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Locale;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log
public class HomeController {
    private final IamportClient importApi = new IamportClient("5643461465743291","f1f4beff20f76010dfe7c6a4a6ac2d966c1b416c995750927a96f195bbfab4748ab148b64c6adb26");
	@Autowired
	CodeService codeService;
	@Autowired
	TourService tourService;
	@Autowired
	FaqService faqService;
	@Autowired
    RentReviewService rentReviewService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		CodeMasterVO codeMasterVO = codeService.getMasterCodeByName("지역");
		model.addAttribute("areaCodes",codeService.getCodesByParentCode(codeMasterVO.getCode()));
		model.addAttribute("tourList", tourService.getLatestList());
		model.addAttribute("faqList", faqService.getList(new Criteria()));
		model.addAttribute("reviewList", rentReviewService.getLatestReviewList());
		return "home";
	}

	@RequestMapping("/pagination")
    public String pagination(){
	    return "tiles/pagination";
    }

	@RequestMapping("/errorPage")
    public String errorPage(){
	    return "errorPage";
    }

    @ResponseBody
    @RequestMapping(value="/verifyIamport/{imp_uid}")
    public IamportResponse<Payment> paymentByImpUid(
            Model model
            , Locale locale
            , HttpSession session
            , @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException {
        return importApi.paymentByImpUid(imp_uid);
    }

    @RequestMapping(value="/orderCompleteMobile", produces = "application/text; charset=utf8", method = RequestMethod.GET)
    public void orderCompleteMobile(
            @RequestParam(required = false) String imp_uid
            , @RequestParam(required = false) String merchant_uid
            , Model model
            , Locale locale
            , HttpSession session) throws IamportResponseException, IOException {

        IamportResponse<Payment> result = importApi.paymentByImpUid(imp_uid);

        // 결제 가격과 검증결과를 비교한다.
        if(result.getResponse().getAmount().compareTo(BigDecimal.valueOf(100)) == 0) {
            System.out.println("검증통과");
        }
    }
}

