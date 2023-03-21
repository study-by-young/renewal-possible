package com.possible.common.security.api;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class KakaoAPI {
	// 카카오 로그인
	public String getAccessToken(String authorize_code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";  //토큰 주소 불러오는 URL

		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();

			 //    POST 요청을 위해 기본값이 false인 setDoOutput을 true로
			conn.setRequestMethod("POST");
			conn.setDoOutput(true); //OutputStream으로 POST 데이터를 넘겨주겠다는 옵션.

			//POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=584286fe9e832f708f4badd91da18b46");
			sb.append("&redirect_uri=http://localhost/app/oauth");
			sb.append("&code=" + authorize_code );
			bw.write(sb.toString());
			bw.flush();

			// 결과 코드 200이면 성공!
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			// 요청을 통해 얻은 JSON 타입 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("AccessToken 정보 응답 : "+ result);

			// GSON 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result); //JSON 문자열 값 분석

			access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);

            br.close();
            bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return access_Token;
	}

	// 카카오 정보 얻기
	public HashMap<String, Object> getUserInfo(String access_Token){

		// 요청하는 클라이언트 마다 가진 정보가 다를 수 있어서 HashMap 선언
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";

		URL url;
		try {
			url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("POST");
		//요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

		// 출력 값이 200 이면 정상작동
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
	            result += line;
	        }
			System.out.println("사용자 정보 응답 : " + result);

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			String id = element.getAsJsonObject().get("id").toString();
			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

	        String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	        System.out.println("카카오 아이디 : " + id);
	        System.out.println("카카오 properties : " + properties);
	        System.out.println("카카오 account : " + kakao_account);

	        System.out.println("카카오 nickname : " + nickname);

	        if(kakao_account.get("has_email").getAsBoolean() && kakao_account.get("email") != null) {
	        	String email = kakao_account.get("email").getAsString();
	        	userInfo.put("email", email);
	        }
	        userInfo.put("nickname", nickname);
	        userInfo.put("kakaoId", id);
	        //userInfo.put("email", email);
		} catch (IOException e) {
			e.printStackTrace();
		}

		return userInfo;
	}
	//카카오 로그아웃
		public void kakaoLogout(String access_Token) {
		    String reqURL = "https://kapi.kakao.com/v1/user/logout";
		    try {
		        URL url = new URL(reqURL);
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestMethod("POST");
		        conn.setRequestProperty("Authorization", "Bearer " + access_Token);

		        int responseCode = conn.getResponseCode();
		        System.out.println("responseCode : " + responseCode);

		        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

		        String result = "";
		        String line = "";

		        while ((line = br.readLine()) != null) {
		            result += line;
		        }
		        System.out.println(result);
		    } catch (IOException e) {
		        // TODO Auto-generated catch block
		        e.printStackTrace();
		    }
		}

}
