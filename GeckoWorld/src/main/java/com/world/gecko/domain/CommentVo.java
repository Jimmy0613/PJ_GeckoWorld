package com.world.gecko.domain;

import lombok.Data;

@Data
public class CommentVo {
	private int num;
	private int pnum;
	private String w_id;
	private String w_nickname;
	private String content;
}

//table comment_