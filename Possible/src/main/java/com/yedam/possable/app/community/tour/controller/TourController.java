package com.yedam.possable.app.community.tour.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.possable.app.community.tour.domain.TestVO;
import com.yedam.possable.app.community.tour.service.TourService;

@Controller
@RequestMapping("/tour/*")
public class TourController {
	
	@Autowired TourService tourService;
	
	@GetMapping("/list")
	public void list(Model model) {
		model.addAttribute("list", tourService.getList());
	}

	@GetMapping("/test")
	public void test(Model model) throws IOException {

		StringBuilder urlBuilder = new StringBuilder(
				"http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8")
				+ "=%2Bxd0HNP4Gd4KAuGtJitYZzafrxzKZ40VMcf3uX%2BQ7AfWFbNEvS2jj43sWtAeAlQPnB65kOz6PjhVjsUPnvkKtw%3D%3D"); /*
																														 * Service
																														 * Key
																														 */
		urlBuilder.append("&" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + URLEncoder.encode(
				"%2Bxd0HNP4Gd4KAuGtJitYZzafrxzKZ40VMcf3uX%2BQ7AfWFbNEvS2jj43sWtAeAlQPnB65kOz6PjhVjsUPnvkKtw%3D%3D",
				"UTF-8")); /* 공공데이터포털에서 발급받은 인증키 */
		urlBuilder.append(
				"&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("1942", "UTF-8")); /* 한 페이지 결과수 */
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
				+ URLEncoder.encode("14", "UTF-8")); /* 관광타입 12=관광지 */
		urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
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
		String result = sb.toString();
		//System.out.println(result);
		// String -> JSON 변환
		JSONArray jArry = new JSONObject(result).getJSONObject("response").getJSONObject("body").getJSONObject("items").getJSONArray("item");
		//String addr = jArry.getJSONObject(0).getString("addr1");
		
//				new JSONObject(new JSONObject(sb.toString()).get("body").toString()).getJSONArray("items").toString()).getJSONArray("item");
		
		List<TestVO> list = new ArrayList<TestVO>();
		TestVO test;
		for (int i = 0; i < jArry.length(); i++) {
			test = new TestVO(); // 객체에 담음
			JSONObject JO = jArry.getJSONObject(i);
			if (!JO.isNull("addr1")) { test.setAddr1(JO.getString("addr1")); }
			if (!JO.isNull("areacode")) { test.setAreaCode(JO.getLong("areacode")); }
			if (!JO.isNull("cat1")) { test.setCat1(JO.getString("cat1")); }
			if (!JO.isNull("cat2")) { test.setCat2(JO.getString("cat2")); }
			if (!JO.isNull("cat3")) { test.setCat3(JO.getString("cat3")); }
			if (!JO.isNull("contentid")) { test.setContentId(JO.getLong("contentid")); }
			if (!JO.isNull("contenttypeid")) { test.setContentTypeId(JO.getLong("contenttypeid")); }
			if (!JO.isNull("createdtime")) { test.setCreatedTime(JO.getLong("createdtime")); }
			if (!JO.isNull("firstimage")) { test.setFirstImage(JO.getString("firstimage")); }
			if (!JO.isNull("firstimage2")) { test.setFirstImage2(JO.getString("firstimage2")); }
			if (!JO.isNull("mapx")) { test.setMapX(JO.getDouble("mapx")); }
			if (!JO.isNull("mapy")) { test.setMapY(JO.getDouble("mapy")); }
			if (!JO.isNull("mlevel")) { test.setMLevel(JO.getLong("mlevel")); }
			if (!JO.isNull("modifiedtime")) { test.setModifiedTime(JO.getLong("modifiedtime")); }
			if (!JO.isNull("readcount")) { test.setReadCount(JO.getLong("readcount")); }
			if (!JO.isNull("sigungucode")) { test.setSigunguCode(JO.getLong("sigungucode")); }
			if (!JO.isNull("title")) { test.setTitle(JO.getString("title")); }
			if (!JO.isNull("zipcode")) { 
				if (JO.get("zipcode").getClass().getName().equals("java.lang.Integer")) {
					test.setZipCode(String.valueOf(JO.getInt("zipcode")));
				} else {
					test.setZipCode(JO.getString("zipcode"));
				}
				 
			}

			/*
			 * JSONObject JO = jArry.getJSONObject(i);
			 * 
			 * if (!JO.isNull("title")) { test.setTitle(String.valueOf(JO.get("title"))); }
			 * list.add(test);
			 */
			list.add(test);
			//tourService.insert(test);
		}
		System.out.println(list);
	}
}
