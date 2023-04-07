package com.world.gecko.service;

import java.util.Optional;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.world.gecko.domain.User;
import com.world.gecko.repository.UserRepository;
import com.world.gecko.util.PwEncoder;

@Service
public class UserService {
	@Autowired
	private UserRepository repo;

	public User getUserById(String id) {
		Optional<User> user = Optional.ofNullable(repo.findById(id));
		if (user.isPresent()) {
			return user.get();
		} else {
			return null;
		}
	}

	public void userJoin(User user) {
		boolean idcheck = false;
		boolean pwcheck = false;
		boolean nicknamecheck = false;
		if (user.getType().equals("kakao")) {
			repo.save(user);
		} else {
			// id pattern
			Pattern pattern = Pattern.compile("^(?=.*\\d)(?=.*[a-z])[a-z\\d]{5,12}$");
			Matcher matcher = pattern.matcher(user.getId());
			if (matcher.matches())
				idcheck = true;
			// pw pattern
			pattern = Pattern.compile("^(?=.*\\d)(?=.*[a-zA-Z])[a-zA-Z\\d~!@#$%^&*]{8,14}$");
			matcher = pattern.matcher(user.getPw());
			if (matcher.matches())
				pwcheck = true;

			// name check
			if (user.getNickname().length() >= 2 && user.getNickname().length() <= 8)
				nicknamecheck = true;

			if (idcheck && pwcheck && nicknamecheck) {
				// encodePw
				user.setPw(PwEncoder.passwordEncode(user.getPw()));
				// insert user
				repo.save(user);
			}
		}
	}

	public void userOut(String id) {
		Optional<User> user = Optional.ofNullable(repo.findById(id));
		if (user.isPresent()) {
			repo.delete(user.get());
		}
	}
}
