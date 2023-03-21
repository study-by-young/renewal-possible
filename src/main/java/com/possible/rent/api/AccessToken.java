package com.possible.rent.api;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class AccessToken {

	public String accessToken() {
		HttpURLConnection conn = null; // 발급 받을 토큰
		String access_token ="";
		
		try {
			URL url = new URL("https://api.iamport.kr/users/getToken"); // 토큰을 받아올 주소 입력
			conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Accept", "application/json");
			conn.setDoOutput(true);

			JsonObject obj = new JsonObject();

			String imp_key = "5643461465743291";
			String imp_secret = "f1f4beff20f76010dfe7c6a4a6ac2d966c1b416c995750927a96f195bbfab4748ab148b64c6adb26";

			// imp_key와 imp_secret키를 JSON 형태로 넣은 후 아임포트 서버로 Request
			obj.add("imp_key", new Gson().toJsonTree(imp_key));
			obj.add("imp_secret", new Gson().toJsonTree(imp_secret));

			BufferedWriter bw;
			bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			bw.write(obj.toString()); // 출력
			bw.flush(); // 남아있는 데이터 전부 출력
			bw.close();

			// 서버로부터 응답데이터 받기
			int result = 0;
			int responseCode = conn.getResponseCode(); // 응답코드 받기
			System.out.println("응답코드 : " + responseCode); // 응답코드 확인하기

			if (responseCode == 200) { // 정상호출
				System.out.println("환불성공!");
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				StringBuilder sb = new StringBuilder();
				String line = null;
				while ((line = br.readLine()) != null) {
					sb.append(line + "\n");
				}
				br.close();
				System.out.println("토큰 발급 : " + sb.toString());

				try {
					String tk = sb.toString();
					JsonParser jsonParser = new JsonParser();
					JsonElement element;
					element = (JsonElement) jsonParser.parse(tk);
					String code = element.getAsJsonObject().getAsJsonObject("response").get("access_token").getAsString();
					// System.out.println(code);
					access_token = code;
				} catch (Exception e) {
					e.printStackTrace();
				}
				result = 1;
			} else { // 에러 발생
				System.out.println(conn.getResponseMessage());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_token;
	}
}
