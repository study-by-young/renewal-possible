package com.yedam.possable.app.member.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yedam.possable.app.common.security.api.KakaoAPI;
import com.yedam.possable.app.member.domain.MemberVO;
import com.yedam.possable.app.member.service.MemberService;

import lombok.extern.java.Log;

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


			vo = memberService.getUserById(kakaoId);

			System.out.println("자 정보 뭐 들어가있어?"+vo);
			//session.setAttribute("member", principal);

			authentication = new UsernamePasswordAuthenticationToken(vo, null, vo.getAuthorities());
			SecurityContextHolder.getContext().setAuthentication(authentication);
			System.out.println("너 이씨 너 뭐야? 누구야?"+SecurityContextHolder.getContext().getAuthentication());
		}else {
			model.addAttribute("kakaoId", kakaoUserInfo);

 			System.out.println("여기는 카카오 회원가입 절차 밟는곳");
 			System.out.println(kakaoIdCheck);
 			return "login/kakaoRegister";
		}

		return "redirect:/";
	}



}
