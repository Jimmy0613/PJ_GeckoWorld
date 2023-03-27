package com.world.gecko.domain;

import lombok.Data;

@Data
public class PostVo {
	private int num;
	private String tag;
	private String w_id;
	private String w_nickname;
	private String title;
	private String content;
	private int view_count;
	private int like_count;
	private int comment_count;
	private int response_count;
	private int pnum;
	private String pdate;
}

//table post_