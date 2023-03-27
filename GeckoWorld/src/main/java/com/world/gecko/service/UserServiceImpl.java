package com.world.gecko.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.world.gecko.domain.UserVo;
import com.world.gecko.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {
	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;

	public UserVo getUserById(String user_id) {
		return mapper.getUserById(user_id);
	}

	public void addUser(UserVo user) {
		mapper.addUser(user);
	}
}
