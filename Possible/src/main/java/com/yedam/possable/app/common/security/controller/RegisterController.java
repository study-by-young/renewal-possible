package com.yedam.possable.app.common.security.controller;

import com.yedam.possable.app.company.domain.CompanyVO;
import com.yedam.possable.app.member.domain.MemberVO;
import com.yedam.possable.app.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/register")
public class RegisterController {
    @Autowired
    MemberService memberService;
    //스프링 시큐리티 암호화
    @Autowired
    BCryptPasswordEncoder bcryptPasswordEncoder;
    //JavaMailSender 객체 타입인 mailSender 변수를 선언
    @Autowired private JavaMailSender mailSender;


    // 사용자 회원가입 폼
    @GetMapping("/user")
    public String userRegForm() {

        return "member/userRegisterForm";
    }

    // 사용자 회원가입 처리
    @PostMapping("/user")
    public String userRegister(MemberVO vo,
                               HttpServletRequest request,
                               RedirectAttributes attributes) {
        vo.setPassword(bcryptPasswordEncoder.encode(vo.getPassword())); // bcrypt 암호화
        int result = memberService.memberInsert(vo);

        attributes.addFlashAttribute("registerResult", result);
        attributes.addFlashAttribute("member", vo);

        return "redirect:/";
    }

    // 업체 회원가입 폼
    @GetMapping("/company")
    public String companyRegForm() {

        return "home";
    }

    // 업체 회원가입 처리
    @PostMapping("/company")
    public String companyRegister(MemberVO memberVO,
                                  CompanyVO companyVO,
                                  HttpServletRequest request,
                                  RedirectAttributes attributes) {
        // 업체 회원가입 시 회원으로 가입시키고 업체는 미승인 상태로
        memberVO.setPassword(bcryptPasswordEncoder.encode(memberVO.getPassword())); // bcrypt 암호화
        int result = memberService.memberInsert(memberVO);

        attributes.addFlashAttribute("registerResult", result);
        attributes.addFlashAttribute("member", memberVO);
        return "home";
    }

    //아이디 중복 체크
    @RequestMapping("/checkId")
    @ResponseBody
    public int checkId(MemberVO vo) {
        int r = memberService.idChk(vo);
        System.out.println(r);
        return r;
    }
}
