package com.possible.member.controller;

import com.possible.common.security.api.KakaoAPI;
import com.possible.member.service.MemberService;
import com.yedam.possable.app.member.domain.MemberVO;
import lombok.extern.java.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Log
@Controller
public class KakaoController {
	@Autowired
	MemberService memberService;
	@Autowired
	private KakaoAPI kakao;
	//카카오 로그인
	@RequestMapping(value = "/oauth")
	public String kakaoLogin(@RequestParam("code") String code, Model model, Authentication authentication, MemberVO vo, HttpServletRequest request) {
		KakaoAPI kakao = new KakaoAPI();
		String access_Token = kakao.getAccessToken(code);
		System.out.println("카카오 로그인 성공 토큰 : "+ access_Token);
		HashMap<String, Object> kakaoUserInfo = kakao.getUserInfo(access_Token);
		String kakaoId = (String) kakaoUserInfo.get("kakaoId");
		String kakaoName = (String) kakaoUserInfo.get("nickname");
		vo.setId(kakaoId);
		System.out.println("카카오 아디 : " + kakaoId);
		int kakaoIdCheck  = memberService.kakaoIdCheck(vo);
		if(kakaoIdCheck != 0) {
			MemberVO principal = new MemberVO();
			HttpSession session = request.getSession();

			vo = memberService.getUserById(kakaoId);

			session.setAttribute("member", vo);

			authentication = new UsernamePasswordAuthenticationToken(vo, null, vo.getAuthorities());
			SecurityContextHolder.getContext().setAuthentication(authentication);
		}else {
			model.addAttribute("kakaoId", kakaoUserInfo);

 			System.out.println("여기는 카카오 회원가입 절차 밟는곳");
 			System.out.println(kakaoIdCheck);
 			return "login/kakaoRegister";
		}
		return "redirect:/";
	}
	@PostMapping("/kakaoInsert")
	public String memberInsert(MemberVO vo, RedirectAttributes rttr) {
		
		//vo.setPassword(bcryptPasswordEncoder.encode(vo.getPassword())); // bcrypt 암호화
		
		memberService.kakaoInsert(vo);
		rttr.addFlashAttribute("result", "가입이 완료되었습니다.");

		return "redirect:/";
	}
}
