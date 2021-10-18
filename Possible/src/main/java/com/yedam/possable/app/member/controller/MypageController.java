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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.possable.app.car.service.CarService;
import com.yedam.possable.app.common.code.service.CodeService;
import com.yedam.possable.app.common.criteria.domain.Criteria;
import com.yedam.possable.app.common.criteria.domain.PageVO;
import com.yedam.possable.app.community.course.domain.CourseBoardVO;
import com.yedam.possable.app.community.course.service.CourseBoardService;
import com.yedam.possable.app.community.qna.service.QnaService;
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
    @Autowired
    QnaService qnaService;

    //마이페이지 대쉬보드 페이지
    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model,
    					Authentication authentication,
    					CourseBoardVO courseVO, RentHistoryVO rentVO,
    					@ModelAttribute("cri") Criteria cri) {
    	MemberVO memVO = memberService.getLoginMember(authentication);
    	System.out.println(memVO.getId());
    	courseVO.setWriter(memVO.getId());
    	rentVO.setSeq(memVO.getSeq());
    	// model.addAttribute("myCourse", courseBoardService.getMyCourse(courseVO));
    	model.addAttribute("myCourse", courseBoardService.getList(cri));
    	model.addAttribute("historyList", rentHistory.MyPageRentHistoryList(cri, rentVO.getMemSeq()));
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


    	//List<EstimateHistoryVO> estimateList = premiumRentService.getEstimateListByUserSeq(cri, mvo.getSeq());
    	//System.out.println("뭐야? 이거?"+ premiumRentService.getEstimateListByUserSeq(cri, mvo.getSeq()));
		//model.addAttribute("estList", premiumRentService.getEstimateListByUserSeq(cri, mvo.getSeq()));

    	List<EstimateHistoryVO> estimateList = premiumRentService.getEstimateListByMemSeq(cri, mvo.getSeq());
		for (int i = 0; i < estimateList.size(); i++) {
			estimateList.get(i).getMemberVO().getSeq();
			System.out.println("뭐임?"+estimateList.get(i).getMemberVO().getSeq());
			model.addAttribute("estimate", premiumRentService.getEstimateListInMyPage(estimateList.get(i).getMemberVO().getSeq()));
			System.out.println("이거되나?"+premiumRentService.getEstimateListInMyPage(estimateList.get(i).getMemberVO().getSeq()));
		}
		model.addAttribute("estList", estimateList);
		//model.addAttribute("estimate", premiumRentService.getEstimate(mvo.getSeq()));


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
    							  		RentReviewVO rVo,
    							  		Authentication authentication,
    							  		HttpServletRequest request){

    	MemberVO mvo = memberService.getLoginMember(authentication);
    	
    	vo.setMemSeq(mvo.getSeq());
    	rVo.setMemSeq(mvo.getSeq());
    	System.out.println("되니?"+rVo);
    	System.out.println("======="+rentReviewService.getRentReviewListByMember(rVo.getMemSeq()));
    	
    	//rentReviewService.get
    	int total = rentHistory.getHistoryCount();
    	model.addAttribute("reviewList", rentReviewService.getRentReviewListByMember(rVo.getMemSeq()));
    	model.addAttribute("pagination", new PageVO(cri, total));
    	model.addAttribute("historyList", rentHistory.MyPageRentHistoryList(cri, vo.getMemSeq()));


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

    // 렌트 후기 작성 폼
    @GetMapping("/rent/view/writeReview")
    public String rentReviewForm(@RequestParam Long seq,
					            Authentication authentication,
					            RedirectAttributes attributes,
					            Model model,
					            CourseBoardVO cvo,
					            RentHistoryVO vo){

    	MemberVO mvo = memberService.getLoginMember(authentication);
    	
    	System.out.println("왜니는 null인데"+rentHistory.getRentHistoryInMypage(seq));
    	model.addAttribute("historyList", rentHistory.getRentHistoryInMypage(seq));
    	List<CourseBoardVO> courseList = courseBoardService.getWriter(mvo.getId());
    	System.out.println(courseList+ "맞겠지?");

    	model.addAttribute("courseList", courseList);

        return "mypage/rentReviewForm";
    }

    // 렌트 후기 등록 처리
    @PostMapping("/rent/view/writeReview")
    public String writeRentReview(Model model,
            				      Authentication authentication,
            				      RedirectAttributes attributes,
            				      RentReviewVO vo){
    	rentReviewService.insertRentReview(vo);
        return "redirect:/mypage/rent";
    }
    //updateRentReview
    // 렌트 수정 폼
    @GetMapping("/rent/view/updateReview")
    public String UpdaterentReviewForm(@RequestParam Long seq,
							            Authentication authentication,
							            RedirectAttributes attributes,
							            Model model,
							           
							            CourseBoardVO cvo,
							            RentHistoryVO vo) {

    	MemberVO mvo = memberService.getLoginMember(authentication);
    	
    	
    	System.out.println("렌트안에 뭐가?"+seq);
    	System.out.println("넌 뭐니?"+rentReviewService.getRentReview(seq));
    	model.addAttribute("getRentReview", rentReviewService.getRentReview(seq));
    	model.addAttribute("historyList", rentHistory.getRentHistoryInMypage(seq));
    	List<CourseBoardVO> courseList = courseBoardService.getWriter(mvo.getId());
    	System.out.println(courseList+ "맞겠지?");

    	model.addAttribute("courseList", courseList);


    	return "mypage/updateRentReviewForm";
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
    public String community(Model model, Authentication authentication, CourseBoardVO vo, Criteria cri){
    	MemberVO memVO = memberService.getLoginMember(authentication);
    	System.out.println(memVO.getId());
    	vo.setWriter(memVO.getId());
    	//model.addAttribute("myCourse", courseBoardService.getMyCourse(vo));
    	model.addAttribute("myCourse", courseBoardService.getList(cri));
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
    public String qna(Model model, Authentication authentication) {
    	MemberVO memVO = memberService.getLoginMember(authentication);

    	System.out.println(memVO.getSeq());
    	model.addAttribute("myQna",qnaService.getMyQna(memVO.getSeq()));
        return "mypage/qna";
    }

    //업체전환 신청 페이지 페이지
    @GetMapping("/chngRole")
    public String chngRole(Model model) {

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
