package com.possible.community.course.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/courseBoard/*")
public class ApiTest {

	@GetMapping("/apiTest")
	public String apiTest() throws IOException {

		StringBuilder urlBuilder = new StringBuilder(
				"http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList"); /* URL */

		urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8")
				+ "=%2Bxd0HNP4Gd4KAuGtJitYZzafrxzKZ40VMcf3uX%2BQ7AfWFbNEvS2jj43sWtAeAlQPnB65kOz6PjhVjsUPnvkKtw%3D%3D");
		urlBuilder.append("&" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + URLEncoder.encode(
				"%2Bxd0HNP4Gd4KAuGtJitYZzafrxzKZ40VMcf3uX%2BQ7AfWFbNEvS2jj43sWtAeAlQPnB65kOz6PjhVjsUPnvkKtw%3D%3D",
				"UTF-8")); /* 공공데이터포털에서 발급받은 인증키 */
		urlBuilder.append(
				"&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /* 한 페이지 결과수 */
		urlBuilder.append(
				"&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 현재 페이지 번호 */
		urlBuilder.append("&" + URLEncoder.encode("MobileOS", "UTF-8") + "="
				+ URLEncoder.encode("ETC", "UTF-8")); /* IOS (아이폰), AND (안드로이드), WIN (원도우폰), ETC */
		urlBuilder.append("&" + URLEncoder.encode("MobileApp", "UTF-8") + "="
				+ URLEncoder.encode("AppTest", "UTF-8")); /* 서비스명=어플명 */
		urlBuilder.append(
				"&" + URLEncoder.encode("listYN", "UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /* Y=목록 N=갯수 */
		urlBuilder.append("&" + URLEncoder.encode("arrange", "UTF-8") + "="
				+ URLEncoder.encode("1", "UTF-8")); /*
													 * (A=제목순, B=조회순, C=수정일순, D=생성일순) 대표이미지가 반드시 있는 정렬 (O=제목순, P=조회순,
													 * Q=수정일순, R=생성일순)
													 */
		urlBuilder.append("&" + URLEncoder.encode("contentTypeId", "UTF-8") + "="
				+ URLEncoder.encode("12", "UTF-8")); /* 관광타입 12=관광지 */
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		return sb.toString();
	}

}
