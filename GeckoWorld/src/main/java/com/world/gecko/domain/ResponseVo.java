package com.world.gecko.domain;

import lombok.Data;

@Data
public class ResponseVo {
	private int num;
	private int pnum;
	private String user_id;
	private String user_name;
	private String title;
	private String content;
	private int view_count;
	private int like_count;
	private int comment_count;
}
