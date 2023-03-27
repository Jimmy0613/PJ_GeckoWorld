package com.world.gecko.domain;

import lombok.Data;

@Data
public class UserVo {
	private String user_id;
	private String user_nickname;
	private String user_pw;
	private String user_role;
	private String login_type;
}

//table user_