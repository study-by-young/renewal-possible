package com.possible.rent.controller;

import com.possible.car.domain.CarVO;
import com.possible.car.service.CarService;
import com.possible.rent.domain.RentHistoryVO;
import com.possible.rent.service.RentHistoryService;
import lombok.extern.java.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log
@Controller
@RequestMapping("/payment")
@Deprecated
public class PaymentController {
    @Autowired
	RentHistoryService rentHistoryService;
	@Autowired
	CarService carService;

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
