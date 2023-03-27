package com.world.gecko.mapper;

import org.apache.ibatis.annotations.Param;

import com.world.gecko.domain.UserVo;

public interface UserMapper {

	public UserVo getUserById(@Param("user_id") String id);

	public void addUser(UserVo user);
}
