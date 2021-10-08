package com.yedam.possable.app.common.security.controller;

import com.yedam.possable.app.member.domain.MemberVO;
import com.yedam.possable.app.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import lombok.extern.java.Log;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

@Log
@Controller
@RequestMapping("/login")
public class LoginController {
    @Autowired
    private MemberService memberService;
    @Autowired
    private JavaMailSender mailSender;

    //로그인 폼
    @GetMapping
    public String loginForm(String error, String logout, Model model) {
        if (error != null) {
            model.addAttribute("error", "아이디 또는 비밀번호를 확인해주세요.");
        } else if (logout != null) {
            model.addAttribute("logout", "logout!");
        }

        return "login/loginForm";
    }

    // 아이디 찾기 폼
    @GetMapping("/findId")
    public String findIdForm() {
        // 아이디 찾기 폼 출력
        return "home";
    }

    // 아이디 찾기 처리
    @PostMapping("/findId/findResult")
    public String findId(MemberVO vo,
                         Model model) {
        // vo 안의 요소들로 아이디 검색 후 model에 담아서 리턴, 페이지에서 리턴 값 출력
        String r = memberService.idFind(vo);
        model.addAttribute("id", r);
        return "home";
    }

    //이메일 인증번호
    @GetMapping("/mailCheck")
    @ResponseBody
    public String mailCheck(String email, String id) {

        // view로 넘어오는지?
        log.info("이메일 데이터 전송 확인");
        log.info("인증번호" + email);

        // 인증번호(난수) 생성
        String pswd = "";
        StringBuffer sb = new StringBuffer();
        StringBuffer sc = new StringBuffer("!@#$%^&*");      // 특수문자 모음, {}[] 같은 비호감 문자 제거

        // 대문자 4개를 임의 발생
        // 첫 글자 대문자
        sb.append((char)((Math.random() * 26) + 65));

        // 아스키 코드 65(A)부터 26글자 중 택 1
        for(int i = 0; i < 3; i++) {
            sb.append((char)((Math.random() * 26) + 65));
        }

        // 소문자 4개를 임의발생
        // 아스키 코드 97(a)부터 26글자 중 택 1
        for (int i = 0; i < 4; i++) {
            sb.append((char)((Math.random() * 26) + 97));
        }

        // 숫자 2개를 임의 발생
        // 아스키코드 48(1) 부터 10글자 중 택 1
        for (int i = 0; i < 2; i++) {
            sb.append((char)((Math.random() * 10) + 48));
        }

        // 특수 문자를 2개 발생시켜 랜덤하게 중간에 끼워 넣는다.
        // 대문자 3개중 1개
        sb.setCharAt(((int)(Math.random()*3)+1), sc.charAt(((int)(Math.random()*sc.length()-1))));
        // 소문자 4개중 1개
        sb.setCharAt(((int)(Math.random()*4)+4), sc.charAt(((int)(Math.random()*sc.length()-1))));

        pswd = sb.toString();

        /* 이메일 보내기 */
        String setFrom = "geonhard@naver.com";
        String toMail = email;
        String title = "여행갈카 비밀번호 찾기 인증 이메일 입니다.";
        String content =
                "비밀번호 인증번호 메일입니다." +
                        "<br><br>" +
                        "인증 번호는 " + pswd + "입니다." +
                        "<br>" +
                        "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper;
        try {
            helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
        } catch (MessagingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return pswd;
    }

    // 비밀번호 초기화 전 검증 폼
    @GetMapping("/resetPassword")
    public String beforeResetPassword(){
        // 이름, 아이디, 생년월일 등으로 검증 폼 생성
        return "home";
    }

    // 비밀번호 초기화 폼
    @PostMapping("/resetPassword/update")
    public String resetPasswordForm(MemberVO vo,
                                    HttpServletRequest request,
                                    RedirectAttributes attributes){
        // 전 검증 폼에서 vo 정보와 DB 일치 여부 조회
        // 일치 할 시 비밀번호 변경 폼 출력
        MemberVO targetVO = memberService.getUserById(vo.getId());

        if(targetVO.getId() == null || !targetVO.getName().equals(vo.getName())){
            // 회원이 아니거나 이름이 틀림
            return "";
        }
        return "home";
    }

    // 비밀번호 초기화 처리
    @PostMapping("/resetPassword/complete")
    public String resetPasswordCmpl(@RequestParam("newPassword") String password,
                                    MemberVO vo){
        // 비밀번호 변경 처리
        return "home";
    }
}
