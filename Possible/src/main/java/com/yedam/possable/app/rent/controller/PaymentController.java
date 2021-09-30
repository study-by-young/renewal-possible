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
	
	
	/* 결제 페이지로 이동 */
    @GetMapping("/payment")
    public String payment() {
        return "payment/payment";
    }
    
	/* 결제 데이터 DB 입력 */
    @PostMapping("/paymentInsert")
    public void paymentInsert(Model model, RentHistoryVO vo, @RequestParam("memSeq") Long memSeq, @RequestParam("carSeq") Long carSeq, RedirectAttributes rttr) {
		/* 외래 객체 생성 후 seq 입력 */
		MemberVO memVo = new MemberVO();
		memVo.setSeq(memSeq);
		vo.setMemberVO(memVo);
		
		CarVO carVo = new CarVO();
		carVo.setSeq(carSeq);
		vo.setCarVO(carVo);
		
		/* 외래 객체 담은 후 service 실행 */
		paymentService.paymentInsert(vo);
    }

		// JSP에서 form을 보내줄 때 form 안에 hidden 타입으로 외래키가 될 객체의 seq를 심어서 보내줌
		// -> @RequestParam("memSeq") Long memSeq로 컨트롤러에서 seq를 변수로 따로 받음
		// -> 데이터 필요시 seq로 service 호출해서 데이터 뽑아오기
		//        or 외래 객체 생성 후 vo에 삽입(vo.setMemberVO())
		// -> mapper.xml에서 #{memberVo.seq}로 사용     
    
    /* 결제완료 페이지로 이동(rent_history seq를 이용해 단건조회) */
	@GetMapping("/paymentOneSelect")
	public String paymentOneSelect(Model model, RentHistoryVO vo) {
		model.addAttribute("rent", paymentService.paymentOneSelect(vo));
		return "payment/paymentFin";
	}
	
	/* 결제정보 전체 조회 */
	@GetMapping("/paymentList")
	public String paymentList(Model model) {
		paymentService.paymentList();
		return "payment/payment";
	}
	
	/* 결제정보 seq(nextval) 조회 */
	@GetMapping("/paymentSeqSelect")
	public void paymentSeqSelect(Model model, RentHistoryVO vo) {
		model.addAttribute("seq", paymentService.paymentSeqSelect(vo));
	}
    
}
