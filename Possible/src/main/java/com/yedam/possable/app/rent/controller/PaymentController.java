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
import com.yedam.possable.app.member.domain.MemberVO;
import com.yedam.possable.app.rent.domain.RentHistoryVO;
import com.yedam.possable.app.rent.service.PaymentService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/payment/*")
public class PaymentController {

	@Autowired PaymentService paymentService;


	// 결제페이지로 이동
    @GetMapping("/test")
    public String test() {
        return "payment/test";
    }	
	
	// 결제페이지로 이동
    @GetMapping("/rent")
    public String payment() {
        return "payment/payment";
    }
    
	// 결제 데이터 DB 입력
    @PostMapping("/payment")
    @ResponseBody
    public String payment(Model model, RentHistoryVO vo, RedirectAttributes rttr) {

    	/* @RequestParam("memSeq") Long memSeq, @RequestParam("carSeq") Long carSeq, */
    	
    	/* 외래 객체 생성 후 seq 입력
		MemberVO memVo = new MemberVO();
		memVo.setSeq(memSeq);
		vo.setMemberVO(memVo);
		
		CarVO carVo = new CarVO();
		carVo.setSeq(carSeq);
		vo.setCarVO(carVo); */
		
		// 외래 객체 담은 후 service 실행
		paymentService.paymentInsert(vo);
		
		// rent_history seq 단건조회를 통해 결제내역 출력)
		model.addAttribute("rent", paymentService.paymentOneSelect(vo));
		
		// 결제완료 페이지로 이동
		return "payment/paymentFin";
    }

    
    


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
