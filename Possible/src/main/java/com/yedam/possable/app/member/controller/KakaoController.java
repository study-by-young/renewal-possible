package com.yedam.possable.app.member.controller;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yedam.possable.app.member.domain.OAuthToken;

import lombok.extern.java.Log;

@Log
@Controller
public class KakaoController {

	@GetMapping("/auth/kakao/callback")
	public @ResponseBody String kakaoCallback(String code) { //Data를 리턴해주는 컨트롤러 함수
		
		// POST 방식으로 key = value 데이터를 요청(카카오)
		
		//HttpHeader 오브젝트 생성
		RestTemplate rt = new RestTemplate();
		org.springframework.http.HttpHeaders headers = new org.springframework.http.HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		// HttpBody 오브젝트 생성
		MultiValueMap<String , String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "584286fe9e832f708f4badd91da18b46");
		params.add("redirect_uri", "http://localhost/app/auth/kakao/callback");
		params.add("code", code);
		
		// HttpHeader와 httpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest =
			new HttpEntity<>(params,params);
		
		//Http 요청 -Post방식 - Response 변수의 응답
 		ResponseEntity<String> response = rt.exchange(
				"https://kauth.kakao.com/oauth/token",
				HttpMethod.POST,
				kakaoTokenRequest,
				String.class
				);
		// 
 		ObjectMapper objectMapper = new ObjectMapper();
 		OAuthToken oauthToken = null;
 		try {
			oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
 		
 		System.out.println("카카오 엑세스 토큰" + oauthToken.getAccess_token());
 		
 		//HttpHeader 오브젝트 생성
 				RestTemplate rt2 = new RestTemplate();
 				
 				org.springframework.http.HttpHeaders headers2 = new org.springframework.http.HttpHeaders();
 				
 				headers2.add("Authorization","Bearer "+oauthToken.getAccess_token());
 				headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
 				
 				// HttpHeader와 httpBody를 하나의 오브젝트에 담기
 				HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest2 =
 					new HttpEntity<>(headers2);
 				
 				//Http 요청 -Post방식 - Response 변수의 응답
 		 		ResponseEntity<String> response2 = rt2.exchange(
 						"https://kapi.kakao.com/v2/user/me",
 						HttpMethod.POST,
 						kakaoProfileRequest2,
 						String.class
 						);
 		System.out.println(response2.getBody());
		return response2.getBody();
	}
}
