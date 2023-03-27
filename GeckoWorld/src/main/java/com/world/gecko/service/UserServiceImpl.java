package com.world.gecko.service;

import java.util.Optional;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.world.gecko.domain.UserVo;
import com.world.gecko.mapper.UserMapper;
import com.world.gecko.util.PwEncoder;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {
	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;

	public UserVo getUserById(String user_id) {
		Optional<UserVo> savedUser = Optional.ofNullable(mapper.getUserById(user_id));
		if(savedUser.isPresent()) {
			return savedUser.get();
		} else {
			return null;
		}
	}

	public boolean userJoin(UserVo user) {
		if (user.getLogin_type().equals("kakao")) {
			mapper.addUser(user);
			return true;
		} else {
			Pattern pattern = Pattern.compile("^(?=.*\\d)(?=.*[a-z])[a-z\\d]{5,12}$");
			Matcher matcher = pattern.matcher(user.getUser_id());
			if (!matcher.matches()) {
				return false;
			}
			pattern = Pattern.compile("^(?=.*\\d)(?=.*[a-zA-Z])[a-zA-Z\\d~!@#$%^&*]{8,14}$");
			matcher = pattern.matcher(user.getUser_pw());
			if (!matcher.matches()) {
				return false;
			}
			// 패스워드를 암호화하여 db에 넣음
			user.setUser_pw(PwEncoder.passwordEncode(user.getUser_pw()));
			if (user.getUser_nickname().length() >= 2 && user.getUser_nickname().length() <= 8) {
				mapper.addUser(user);
				return true;
			} else {
				return false;
			}
		}
	}
}
