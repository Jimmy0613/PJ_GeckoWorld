package com.world.gecko.service;

import com.world.gecko.domain.UserVo;

public interface UserService {
	public UserVo getUserById(String id);

	public boolean userJoin(UserVo user);
}
