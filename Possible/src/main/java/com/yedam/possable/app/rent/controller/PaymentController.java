package com.yedam.possable.app.rent.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import com.yedam.possable.app.car.domain.CarVO;
import com.yedam.possable.app.car.service.CarService;
import com.yedam.possable.app.rent.domain.RentHistoryVO;
import com.yedam.possable.app.rent.service.PaymentService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/payment/*")
public class PaymentController {

	@Autowired PaymentService paymentService;
	@Autowired CarService carService;

	// 결제페이지로 이동
    @GetMapping("/rent")
    public String payment(CarVO carVo) {
    	// 결제페이지로 이동할 때 차 정보, 멤버 정보 가지고 와야 한다.
        return "payment/payment";
    }
    
	// 결제 데이터 DB 입력
    @PostMapping("/payment")
    @ResponseBody
    public String payment(Model model, @RequestBody RentHistoryVO vo, RedirectAttributes rttr) {
		paymentService.paymentInsert(vo);
		return "payment/paymentFin";
    }
    
    // 결제완료페이지로 이동(결제내역 조회)
    @GetMapping("/paymentFin")
    public String paymentFin(Model model, RentHistoryVO vo, CarVO carVo) {
    	vo.setSeq(paymentService.readSeq(vo.getMerchantUid()));
    	carVo.setSeq(vo.getCarSeq());
    	model.addAttribute("rent", paymentService.paymentOneSelect(vo.getSeq()));
    	model.addAttribute("car", carService.getCar(carVo));
    	return "payment/paymentFin";
    }
    
    // 결제내역 조회(마이페이지)
    @GetMapping("/rentHistory")
    public void rentHistory(Model model) {
    	model.addAttribute("list", paymentService.paymentList());
    }

    // 결제취소 후 DB 수정(status 변경) 
  /*    @GetMapping("/paymentCancel")
        public String paymentCancel(String uid, RedirectAttributes rttr) {
    	paymentService.paymentCancel(uid);
    	return "payment/rentHistory";
    } */
    
    
	/*
	 * // 결제취소 후 DB 수정(status 변경)
	 * 
	 * @PutMapping("/paymentCancel/{uid}")
	 * 
	 * @ResponseBody public String paymentCancel(@PathVariable String uid,
	 * RedirectAttributes rttr) { paymentService.paymentCancel(uid); return
	 * "redirect:/payment/rentHistory"; }
	 */

    
	// 결제 검증을 위한 코드 (미구현, 테스트 중)
	private IamportClient api;
	
	public PaymentController() {
    	// REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다.
		this.api = new IamportClient("5643461465743291","f1f4beff20f76010dfe7c6a4a6ac2d966c1b416c995750927a96f195bbfab4748ab148b64c6adb26");
	}
		
	@ResponseBody
	@RequestMapping(value="/verifyIamport/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid(
			Model model
			, Locale locale
			, HttpSession session
			, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException {	
			return api.paymentByImpUid(imp_uid);
	}	


	@RequestMapping(value="/orderCompleteMobile", produces = "application/text; charset=utf8", method = RequestMethod.GET)
	public void orderCompleteMobile(
			@RequestParam(required = false) String imp_uid
			, @RequestParam(required = false) String merchant_uid
			, Model model
			, Locale locale
			, HttpSession session) throws IamportResponseException, IOException {
		
		IamportResponse<Payment> result = api.paymentByImpUid(imp_uid);
		
		// 결제 가격과 검증결과를 비교한다.
		if(result.getResponse().getAmount().compareTo(BigDecimal.valueOf(100)) == 0) {
			System.out.println("검증통과");
		}
	}	
	    
}
