package com.yedam.possable.app.rent.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import com.yedam.possable.app.rent.service.RentHistoryService;
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

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/payment")
@Deprecated
public class PaymentController {
    @Autowired RentHistoryService rentHistoryService;
	@Autowired CarService carService;

    // 결제완료페이지로 이동(결제내역 조회)
    @GetMapping("/paymentFin")
    public String paymentFin(Model model, RentHistoryVO vo, CarVO carVo) {
    	carVo.setSeq(vo.getCarSeq());
    	model.addAttribute("rent", rentHistoryService.getRentHistory(vo.getSeq()));
    	model.addAttribute("car", carService.getCar(carVo));
    	return "payment/paymentFin";
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

}
