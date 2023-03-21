package com.possible.common.security.controller;

import com.possible.company.domain.CompanyVO;
import com.possible.member.service.MemberService;
import com.yedam.possable.app.member.domain.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

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
                               @RequestParam("birthday")
                               @DateTimeFormat(pattern = "yyyy-MM-dd") Date birth,
                               HttpServletRequest request,
                               RedirectAttributes attributes) {
        System.out.println("===========" + birth);
        vo.setBirth(birth);
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
    @RequestMapping("/idChk")
    @ResponseBody
    public int checkId(MemberVO vo) {
        int r = memberService.idChk(vo);
        System.out.println(r);
        return r;
    }
}
