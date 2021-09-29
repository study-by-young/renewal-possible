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
import com.yedam.possable.app.rent.domain.RentHistoryVO;
import com.yedam.possable.app.rent.service.PaymentService;

@Controller
@RequestMapping("/payment/*")
public class PaymentController {

	@Autowired PaymentService paymentService;
	
	/* 결제 페이지로 이동 */
    @GetMapping("/payment")
    public String payment() {
        return "payment/payment";
    }
    
	/* 결제 데이터 DB 입력 */
    @PostMapping("/paymentInsert")
    public String paymentInsert(Model model, RedirectAttributes rttr, RentHistoryVO vo) {
    	paymentService.paymentInsert(vo);
    	return "redirect:/payment/payment";
    }
   
    
/*    
    @PostMapping("/paymentInsert")
    @ResponseBody
    public String paymentInsert(Model model, RedirectAttributes rttr, RentHistoryVO vo) {
    	paymentService.paymentInsert(vo);
    	return "redirect:/payment/payment";
    }    
*/    
	
}
