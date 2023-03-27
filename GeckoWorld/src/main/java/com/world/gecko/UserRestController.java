package com.world.gecko;

import java.util.Optional;

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
		Optional<UserVo> savedUser = Optional.ofNullable(service.getUserById(user_id));
		if (savedUser.isPresent()) {
			return true;
		} else {
			return false;
		}
	}

	@GetMapping("/pw_confirm")
	public boolean pw_confirm(@RequestParam("user_id") String user_id, @RequestParam("user_pw") String pw) {
		Optional<UserVo> savedUser = Optional.ofNullable(service.getUserById(user_id));
		if (savedUser.isPresent()) {
			if (PwEncoder.passwordMatches(pw, savedUser.get().getUser_pw())) {
				return true;
			} else {
				return false;
			}
		}
		return false;
	}
}
