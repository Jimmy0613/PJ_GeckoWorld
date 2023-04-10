package com.world.gecko;

import java.io.IOException;
import java.util.HashMap;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.world.gecko.api.KakaoApi;
import com.world.gecko.domain.User;
import com.world.gecko.service.RoomBookService;
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

	private KakaoApi kakao;
	private UserService service;
	private RoomBookService rbService;

	@GetMapping("/mypage")
	public String mypage(HttpServletRequest request) {
		if (SessionUtils.getObject(request, "LOGIN_USER") == null) {
			return "redirect:/user/login";
		} else {
			return "/user/mypage";
		}
	}

	@GetMapping({ "/login", "/join", "kakaoJoin", "/out", "/changePassword" })
	public void getView() {

	}

	@GetMapping("/reservation")
	public void reservation(Model model, HttpServletRequest request) {
		User loginUser = (User) SessionUtils.getObject(request, "LOGIN_USER");
		model.addAttribute("book", rbService.findByUserId(loginUser.getId()));
	}

	@PostMapping("/join.do")
	public String join_do(HttpServletRequest request, User input, Model model) {
		service.userJoin(input);
		SessionUtils.setObject(request, "LOGIN_USER", input);
		return "redirect:/";
	}

	@GetMapping("/login.do")
	public String loginNormal(HttpServletRequest request, User input) {
		User savedUser = service.getUserById(input.getId());
		SessionUtils.setObject(request, "LOGIN_USER", savedUser);
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
		Optional<User> user = Optional.ofNullable(service.getUserById((String) userInfo.get("id")));
		if (user.isPresent()) {
			SessionUtils.setObject(request, "LOGIN_USER", user.get());
			return "redirect:/";
		} else {
			User kakaoUser = new User();
			kakaoUser.setId((String) userInfo.get("id"));
			kakaoUser.setNickname((String) userInfo.get("nickname"));
			// 카카오 유저의 경우 access_Token을 암호화해서 비밀번호로 db에 삽입하여 id만으로 로그인이 되는 것을 방지
			kakaoUser.setPw(PwEncoder.passwordEncode(access_Token));
			SessionUtils.setObject(request, "KAKAO_LOGIN", kakaoUser);
			return "redirect:/user/kakaoJoin";
		}
	}

	@PostMapping("/kakaoJoin.do")
	public String kakaoJoin_do(HttpServletRequest request, User input) {
		service.userJoin(input);
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

	@GetMapping("/out.do")
	@ResponseBody
	public void out(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		if (((User) SessionUtils.getObject(request, "LOGIN_USER")).getType().equals("kakao")) {
			SessionUtils.removeObject(request, "access_Token");
		}
		SessionUtils.removeObject(request, "LOGIN_USER");
		service.userOut(id);
	}

}
