package com.yedam.possable.app.member.controller;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.possable.app.common.domain.Criteria;
import com.yedam.possable.app.member.domain.MemberVO;
import com.yedam.possable.app.member.service.MemberService;

import lombok.extern.java.Log;

@Log
@Controller
public class MemberController {
	
	@Autowired MemberService memberService;
	
	//스프링 시큐리티 암호화
	@Autowired BCryptPasswordEncoder bcryptPasswordEncoder;
	
	//JavaMailSender 객체 타입인 mailSender 변수를 선언
	@Autowired
    	private JavaMailSender mailSender; 
	
	@PostMapping("/memberList")
	public String memberList(Model model, @ModelAttribute("cri") Criteria cri) {
		
		model.addAttribute("memberList",memberService.memberList(cri) );
		
		return "member/memberList";
	}
	//회원 등록
	@PostMapping("/memberInsert")
	public String memberInsert(MemberVO vo, RedirectAttributes rttr) {
		log.info("암호화 되기전" + vo.getPassword());
		//vo.setPassword(bcryptPasswordEncoder.encode(vo.getPassword())); // bcrypt 암호화
		log.info("암호화 된 후" + vo.getPassword());
		memberService.memberInsert(vo);
		rttr.addFlashAttribute("result", vo);
		
		return "redirect:/";
	}
	//회원 아이디 중복 체크
	@PostMapping("/idChk")
	@ResponseBody
	public int idChk(MemberVO vo) {
		int r = memberService.idChk(vo);
		System.out.println(r);
		return r;
	}
	//회원 아이디 찾기
	@PostMapping("/idFind")
	@ResponseBody
	public String idFind(MemberVO vo, Model model) {
		String r = memberService.idFind(vo);
		log.info("아이디 뭐담겨있니?"+r);
		return r;
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
	//회원 비밀번호 찾기 
	@PostMapping("/passFindUpdate")
	@ResponseBody
	public int passFindUpdate(MemberVO vo) {
		int r = memberService.passFindUpdate(vo);
		log.info(r+ "비밀번호 찾기 부분 오긴 오냐?");
		return r;
	}
	
	
		
}
