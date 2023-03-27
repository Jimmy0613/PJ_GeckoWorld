package com.world.gecko.api;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class KakaoApi {
	public final static String REST_API_KEY = "20e2c80133ed378957f5189bbfbdb63b";

	public String getAccessToken(String authorize_code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			// POST 요청을 위해서 기본값이 false인 setDoOutput을 true로 변경
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			// POST 요청에 필요한 파라미터 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=" + REST_API_KEY);
			sb.append("&redirect_uri=http://localhost:8080/user/kakaoLogin.do");
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();

			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			// 요청을 통해 얻은 JSON 타입의 Response 메시지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			//jackson 라이브러리 objectMapper 사용
			ObjectMapper objectMapper = new ObjectMapper();
			Map<String, String> jsonResult = objectMapper.readValue(result, Map.class);
			access_Token = jsonResult.get("access_token");
			refresh_Token = jsonResult.get("refresh_token");
			System.out.println("=======access_Token======= : " + access_Token);
			System.out.println("=======refresh_Token======= : " + refresh_Token);
			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return access_Token;
	}

	public HashMap<String, Object> getUserInfo(String access_Token) {
		HashMap<String, Object> userInfo = new HashMap<>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();
			System.out.println("==========responseCode======== :" + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("=============response body======== : " + result);

			ObjectMapper objectMapper = new ObjectMapper();
			Map<String, Object> jsonResult = objectMapper.readValue(result, Map.class);
			String id = (Long) jsonResult.get("id") + "";
			userInfo = (HashMap<String, Object>) jsonResult.get("properties");
			userInfo.put("id", id);
			System.out.println("========id : " + (String) userInfo.get("id"));
			System.out.println("========nickname : " + (String) userInfo.get("nickname"));
			System.out.println("========prof_img : " + (String) userInfo.get("profile_image"));
			br.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return userInfo;
	}
}