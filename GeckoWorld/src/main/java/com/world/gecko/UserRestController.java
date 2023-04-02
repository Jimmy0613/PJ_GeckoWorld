package com.world.gecko;

import java.util.Optional;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.world.gecko.domain.User;
import com.world.gecko.service.UserService;
import com.world.gecko.util.PwEncoder;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@RestController
@RequestMapping("/user/*")
public class UserRestController {
	private UserService service;

	@GetMapping("/id_confirm")
	public boolean email_confirm(@RequestParam("id") String id) {
		Optional<User> savedUser = Optional.ofNullable(service.getUserById(id));
		if (savedUser.isPresent()) {
			return true;
		} else {
			return false;
		}
	}

	@GetMapping("/pw_confirm")
	public boolean pw_confirm(@RequestParam("id") String id, @RequestParam("pw") String pw) {
		Optional<User> savedUser = Optional.ofNullable(service.getUserById(id));
		if (savedUser.isPresent()) {
			if (PwEncoder.passwordMatches(pw, savedUser.get().getPw())) {
				return true;
			} else {
				return false;
			}
		}
		return false;
	}
}
