package com.world.gecko.domain;

import lombok.Data;

@Data
public class UserVo {
	private String user_id;
	private String user_nickname;
	private String user_pw;
	private String user_role;
	private String login_type;

	public UserVo() {
		
	}
	public UserVo(String user_id, String user_nickname, String user_pw, String user_role, String login_type) {
		this.user_id = user_id;
		this.user_nickname = user_nickname;
		this.user_pw = user_pw;
		this.user_role = user_role;
		this.login_type = login_type;
	}
}

//table user_