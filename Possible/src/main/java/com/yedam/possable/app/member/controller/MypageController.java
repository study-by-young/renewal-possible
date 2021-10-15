package com.yedam.possable.app.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.possable.app.car.domain.CarVO;
import com.yedam.possable.app.car.service.CarService;
import com.yedam.possable.app.common.code.service.CodeService;
import com.yedam.possable.app.common.criteria.domain.Criteria;
import com.yedam.possable.app.common.criteria.domain.PageVO;
import com.yedam.possable.app.community.course.service.CourseBoardService;
import com.yedam.possable.app.company.domain.CompanyVO;
import com.yedam.possable.app.company.service.CompanyService;
import com.yedam.possable.app.member.domain.MemberVO;
import com.yedam.possable.app.member.service.MemberService;
import com.yedam.possable.app.rent.domain.EstimateHistoryVO;
import com.yedam.possable.app.rent.domain.RentHistoryVO;
import com.yedam.possable.app.rent.domain.RentReviewVO;
import com.yedam.possable.app.rent.service.PaymentService;
import com.yedam.possable.app.rent.service.PremiumRentService;
import com.yedam.possable.app.rent.service.RentHistoryService;
import com.yedam.possable.app.rent.service.RentReviewService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/mypage")
public class MypageController {
    @Autowired
    MemberService memberService;
    @Autowired
    CompanyService companyService;
    @Autowired
    CodeService codeService;
    @Autowired
    PaymentService paymentService;
    @Autowired
    CarService carService;
    @Autowired
    RentHistoryService rentHistory;
    @Autowired
    PremiumRentService premiumRentService;
    @Autowired
    RentReviewService rentReviewService;
    @Autowired
    CourseBoardService courseBoardService;

    //마이페이지 대쉬보드 페이지
    @GetMapping("/dashboard")
    public String dashboard(HttpSession session) {
        return "mypage/dashboard";
    }

    //회원 정보 수정 전 비밀번호 검증 폼
    @GetMapping("/editProfile/checkPw")
    public String beforeEditProfile(){
        return "home";
    }

    //마이페이지 회원정보수정 폼 페이지
    @GetMapping("/editProfile")
    public String editProfileForm(
                           Authentication authentication,
                           Model model,
                           HttpServletRequest request) {
        MemberVO loginUser = memberService.getLoginMember(authentication);

        model.addAttribute("memberList", memberService.memberOneSelect(loginUser));
        return "mypage/editProfile";
    }

    // 회원 정보 수정 처리
    @PostMapping("/editProfile/complete")
    public String editProfile(){

        return "mypage/dashboard";
    }

    // 회원 탈퇴 처리
    @GetMapping("/delete")
    public String deleteMember(){
        // 로그아웃 후 db 삭제 후 메인으로 리다이렉트
        return "home";
    }

    // 견적 요청 리스트
    @GetMapping("/estimate")
    public String estimateList(Model model,
    						   @ModelAttribute("cri") Criteria cri,
    						   Authentication authentication
    						   ){
    	MemberVO mvo = memberService.getLoginMember(authentication);

    	List<EstimateHistoryVO> estimateList = premiumRentService.getEstimateListByMemSeq(cri, mvo.getSeq());

		for (int i = 0; i < estimateList.size(); i++) {
			Map<String, Object> voMap = new HashMap<String, Object>();
			System.out.println("---------- : " + i + estimateList.size());
//			TrimCodeVO getTrim = codeService.getTrim(estimateList.get(i).getTrim());
//			CodeSubVO subCode = codeService.getCodeByValue(estimateList.get(i).getSegment());
//			System.out.println("니 뭐들어있는데???" + estimateList.get(i).getSegment());
//			System.out.println("값 다들고 오는거 맞지? :" + subCode.toString());
//			System.out.println("subCode" + subCode);
//			model.addAttribute("getTrim",getTrim);
			//model.addAttribute("code", map); // map.add(voMap); //
			//model.addAttribute("getTrim", getTrim); // Trim 들고옴 //
			//model.addAttribute("subCode", subCode);

		}
		model.addAttribute("estList", estimateList);


        return "mypage/estimateList";
    }

    // 견적 요청 상세보기
    @GetMapping("/estimate/view")
    public String estimateView(Model model,
							   Authentication authentication,
							   @RequestParam Long seq){

    	model.addAttribute("estimate", premiumRentService.getEstimate(seq));
        return "mypage/estimateView";
    }

    // 견적 요청 수정
    @GetMapping("/estiamte/update")
    public String estimateUpdateForm(@RequestParam Long seq,
							          HttpServletRequest request,
							          RedirectAttributes attributes,
							          Authentication authentication,
							          Model model){

    	 EstimateHistoryVO vo = premiumRentService.getEstimate(seq);
    	 MemberVO mvo = memberService.getLoginMember(authentication);
    	 //String user = ((MemberVO) principal).getId();

         String writer = vo.getMemberVO().getSeq().toString();
         String user = mvo.getSeq().toString();

         String carOptCode = codeService.getMasterCodeByName("차량 옵션").getCode();
         String itemOptCode = codeService.getMasterCodeByName("여행용품 옵션").getCode();

         if (user == null || !user.equals(writer)) {
             attributes.addFlashAttribute("updateMsg", "작성자만 수정 가능합니다.");
             return "redirect:" + request.getHeader("REFERER");
         }
         model.addAttribute("brands", codeService.getBrandList());
         model.addAttribute("carOpt", codeService.getCodesByParentCode(carOptCode));
         model.addAttribute("itemOpt", codeService.getCodesByParentCode(itemOptCode));

         model.addAttribute("estimate", premiumRentService.getEstimate(seq));

        return "rent/prm/estimateRegForm";
    }

    // 견적 요청 수정 처리
    @PostMapping("/estimate/update")
    public String updateEstimate(){
        return "mypage/estimateView";
    }

    // 견적 요청 삭제
    @GetMapping("/estimate/delete")
    public String deleteEstimate(){
        return "mypage/dashboard";
    }

    // 회원 렌트 내역
    @GetMapping("/rent")
    public String MyPageRentHistoryList(Model model,
    							  Long seq,
						    	  @ModelAttribute("cri") Criteria cri,
						    	  RentHistoryVO vo,
						    	  HttpServletRequest request,
						    	  Authentication authentication){

    	HttpSession session = request.getSession();
    	MemberVO mvo = (MemberVO) session.getAttribute("member");

    	int total = rentHistory.getHistoryCount();

        model.addAttribute("getView", rentHistory.MyPageRentHistoryList(cri, mvo.getSeq()));
        model.addAttribute("page", new PageVO(cri, total));
        List<RentHistoryVO> rhlist = new ArrayList<RentHistoryVO>();
        rhlist = rentHistory.MyPageRentHistoryList(cri, mvo.getSeq());

        for (int i = 0; i < rhlist.size(); i++) {
        	System.out.println(rhlist.get(i).getCarSeq());
        	System.out.println("==================회사코드");

        	System.out.println(rhlist.get(i).getCmpnSeq());
        	CarVO cvo1 = new CarVO();
        	cvo1.setSeq(rhlist.get(i).getCarSeq());
        	carService.getCar(cvo1);
        	System.out.println("======================="+i+"=====================");
        	System.out.println(carService.getCar(cvo1));
        	model.addAttribute("car", carService.getCar(cvo1));

        	CompanyVO cov = new CompanyVO();
        	cov.setSeq(rhlist.get(i).getCmpnSeq());
        	System.out.println("두번째 회사 코드==="+rhlist.get(i).getCmpnSeq());
        	model.addAttribute("company", companyService.companyOneSelect(cov));
        	//model.addAttribute("sysdate", )
        }



    	return "mypage/rentHistoryList";
    }

    // 결제취소 후 DB 수정(status 변경)
    @PutMapping("/paymentCancel/{uid}")
    @ResponseBody
    public String paymentCancel(@PathVariable String uid, RedirectAttributes rttr) {
    	paymentService.paymentCancel(uid);
    	return "redirect:/mypage/rentHistoryList";
    }   
    
    // 회원 렌트 내역 상세
    @GetMapping("/rent/view")
    public String rentHistoryView(){
        return "";
    }

    //-------------------------------------------------------------------------------
    
    // 마이페이지 렌트 후기 조회
    @GetMapping("review/list")
    public void mypageRentReviewList() {
    	
    }
    
    // 렌트 후기 작성/수정 폼
    @GetMapping("/rent/view/writeReview")
    public String rentReviewForm(Model model, Authentication authentication, 
    							Long seq, Long carSeq, Long cmpnSeq,
    							CarVO carVo, CompanyVO cmpnVo, RentHistoryVO rhVo){
    	MemberVO loginUser = memberService.getLoginMember(authentication);
    	
    	rhVo.setSeq(seq);
    	rhVo.setCarSeq(carSeq);
    	rhVo.setCmpnSeq(cmpnSeq);
    	carVo.setSeq(rhVo.getCarSeq());
    	cmpnVo.setSeq(rhVo.getCmpnSeq());
    	
    	// 내가 대여한 차량 seq, 업체 seq가 필요함 <---- 렌트히스토리 조회하면 여기 다 있음
    	model.addAttribute("history", rentHistory.getRentHistory(rhVo));
    	model.addAttribute("car", carService.getCar(carVo));
    	model.addAttribute("company", companyService.companyOneSelect(cmpnVo));
    	model.addAttribute("user", loginUser);
    	model.addAttribute("courseList", courseBoardService.getList());
    	// 차량 seq로 차량 한건 조회해서 model 뿌려주기
    	// 내가 작성한 코스글 seq가 필요함 (mem_seq로 코스글 조회해서 select option으로 뿌려주면 될 듯)
    	
        return "mypage/rentReviewForm";
    }

    // 렌트 후기 등록 처리
    @PostMapping("/rent/view/writeReview")
    public String writeRentReview(RentReviewVO vo){
    	rentReviewService.insertRentReview(vo);
        return "mypage/rentHistoryList";
    }
    
    // 렌트 후기 수정 처리
    @PostMapping("/rent/view/updateReview")
    public void updateRentReview() {
    	
    }
    
    // 렌트 후기 삭제 처리
    @PostMapping("/rent/view/deleteReview")
    public void deleteRentReview(Long seq) {
    	
    }
    
  //-------------------------------------------------------------------------------

    // 커뮤니티 대시보드
    @GetMapping("/community")
    public String community(){
        return "mypage/community";
    }

    // 업체 등록 폼
    @GetMapping("/regCompany")
    public String companyRegForm(){
        return "";
    }

    //업체 등록 처리
    @PostMapping("/regCompany")
    public String regCompany(){
        return "";
    }

    // --------------------------------------------------------

    //마이페이지 견적관리 페이지
    @GetMapping("/eslist")
    public String eslist() {
        return "mypage/estimate/list";
    }

    //마이페이지 견적관리 상세 페이지
    @GetMapping("/esinfo")
    public String esinfo() {
        return "mypage/estimateView";
    }





    //마이페이지 나의 문의 페이지
    @GetMapping("/qna")
    public String qna() {
        return "mypage/qna";
    }

    //업체전환 신청 페이지 페이지
    @GetMapping("/chngRole")
    public String chngRole(Model model, HttpSession session) {

        return "mypage/chngRole";
    }

    //업체전환 신청처리
    @PostMapping("/chngRole")
    public String chngRole(Model model, CompanyVO vo,  @RequestParam("memSeq") Long memSeq, RedirectAttributes rttr) {

    	MemberVO memVo = new MemberVO();
		memVo.setSeq(memSeq);
		vo.setMemberVO(memVo);
        // 외래 객체 담은 후 service 실행
        int result = companyService.companyReg(vo);
        rttr.addFlashAttribute("result", result);

        return "redirect:/mypage/dashboard";
    }
}
