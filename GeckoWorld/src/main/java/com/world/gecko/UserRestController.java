package com.world.gecko;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.world.gecko.domain.UserVo;
import com.world.gecko.service.UserServiceImpl;
import com.world.gecko.util.PwEncoder;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@RestController
@RequestMapping("/user/*")
public class UserRestController {
	private UserServiceImpl service;

	@GetMapping("/id_confirm")
	public boolean email_confirm(@RequestParam("user_id") String user_id) {
		log.info("입력 받은 user_id: " + user_id);
		UserVo savedUser = service.getUserById(user_id);
		// user db에 해당 아이디가 존재하는지 여부를 확인해 존재하면 true, 아니면 false를 리턴
		if (savedUser != null) {
			log.info("이미 존재하는 아이디: " + savedUser.getUser_id());
			return true;
		} else {
			log.info("아이디 사용 가능 / 아이디 없음 ");
			return false;
		}
	}

	@GetMapping("/pw_confirm")
	public boolean pw_confirm(@RequestParam("user_id") String user_id, @RequestParam("user_pw") String pw) {
		UserVo savedUser = service.getUserById(user_id);
		boolean match = false;
		match = PwEncoder.passwordMatches(pw, savedUser.getUser_pw());
		if (match) {
			return true;
		} else {
			return false;
		}
	}
}
