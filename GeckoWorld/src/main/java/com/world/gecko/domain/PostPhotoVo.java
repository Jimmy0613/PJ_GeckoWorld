package com.world.gecko.domain;

import lombok.Data;

@Data
public class PostPhotoVo {
	private int num;
	private String w_id;
	private String w_nickname;
	private String title;
	private String content;
	private int view_count;
	private int like_count;
	private int comment_count;
	private String pdate;
	private byte[] p1;
	private byte[] p2;
	private byte[] p3;
	private byte[] p4;
	private byte[] p5;
	private String p1Url;
	private String p2Url;
	private String p3Url;
	private String p4Url;
	private String p5Url;
}

//table post_