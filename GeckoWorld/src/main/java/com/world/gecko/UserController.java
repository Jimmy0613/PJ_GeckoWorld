package com.world.gecko;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.world.gecko.api.KakaoApi;
import com.world.gecko.domain.UserVo;
import com.world.gecko.service.UserService;
import com.world.gecko.util.PwEncoder;
import com.world.gecko.util.SessionUtils;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/user/*")
@AllArgsConstructor
public class UserController {

	private UserService service;
	private KakaoApi kakao;

	@GetMapping("/mypage")
	public String mypage(HttpServletRequest request) {
		if(SessionUtils.getObject(request, "LOGIN_USER")==null) {
			return "redirect:/user/login";
		} else {
			return "/user/mypage";
		}
	}
	
	@GetMapping({"/login", "/join", "kakaoJoin"})
	public void getView() {
		
	}

	@PostMapping("/join.do")
	public String join_do(HttpServletRequest request, UserVo input) {
		// 패스워드를 암호화하여 db에 넣음
		input.setUser_pw(PwEncoder.passwordEncode(input.getUser_pw()));
		service.addUser(input);
		log.info("가입 성공");
		SessionUtils.setObject(request, "LOGIN_USER", input);
		return "redirect:/";
	}

	@GetMapping("/login.do")
	public String loginNormal(HttpServletRequest request, UserVo input) {
		UserVo savedUser = service.getUserById(input.getUser_id());
		SessionUtils.setObject(request, "LOGIN_USER", savedUser);
		log.info("로그인 성공: " + savedUser.getUser_id());
		return "redirect:/";
	}

	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		SessionUtils.removeObject(request, "LOGIN_USER");
		return "redirect:/";
	}

	@GetMapping("/kakaoLogin")
	public String kakaoLogin() {
		StringBuilder sb = new StringBuilder();
		sb.append("https://kauth.kakao.com/oauth/authorize");
		sb.append("?client_id=" + KakaoApi.REST_API_KEY);
		sb.append("&redirect_uri=http://localhost:8080/user/kakaoLogin.do");
		sb.append("&response_type=code");
		String url = sb.toString();
		return "redirect:" + url;
	}

	@GetMapping("/kakaoLogin.do")
	public String kakaoLogin_do(HttpServletRequest request, @RequestParam("code") String code) {
		String access_Token = kakao.getAccessToken(code);
		SessionUtils.setObject(request, "access_Token", access_Token);
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
		UserVo user = new UserVo();
		user.setUser_id((String) userInfo.get("id"));
		UserVo savedUser = service.getUserById(user.getUser_id());
		if (savedUser != null) {
			SessionUtils.setObject(request, "LOGIN_USER", savedUser);
			return "redirect:/";
		} else {
			user.setUser_nickname((String) userInfo.get("nickname"));
			// 카카오 유저의 경우 access_Token을 암호화해서 비밀번호로 db에 삽입하여 id만으로 로그인이 되는 것을 방지
			user.setUser_pw(PwEncoder.passwordEncode(access_Token));
			SessionUtils.setObject(request, "KAKAO_LOGIN", user);
			return "redirect:/user/kakaoJoin";
		}
	}

	@PostMapping("/kakaoJoin.do")
	public String kakaoJoin_do(HttpServletRequest request, UserVo input) {
		service.addUser(input);
		log.info("카카오 가입 성공");
		SessionUtils.setObject(request, "LOGIN_USER", input);
		return "redirect:/";
	}

	@GetMapping("/kakaoLogout")
	public String kakaoLogout() {
		StringBuilder sb = new StringBuilder();
		sb.append("https://kauth.kakao.com/oauth/logout");
		sb.append("?client_id=" + KakaoApi.REST_API_KEY);
		sb.append("&logout_redirect_uri=http://localhost:8080/user/kakaoLogout.do");
		String url = sb.toString();
		return "redirect:" + url;
	}

	@GetMapping("/kakaoLogout.do")
	public String kakaoLogout(HttpServletRequest request) {
		SessionUtils.removeObject(request, "access_Token");
		SessionUtils.removeObject(request, "LOGIN_USER");
		return "redirect:/";
	}

}
