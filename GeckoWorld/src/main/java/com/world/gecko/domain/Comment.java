package com.world.gecko.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.google.gson.annotations.Expose;

import lombok.Data;

@Data
@Entity
@Table(name="comment_")
public class Comment { // 댓글 테이블 
	@Id
	@Column(name="cnum")
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Expose
	private int cnum;
	
	@Column(name="pnum", nullable=false)
	@Expose
	private int pnum;
	
	
	@Column(name="w_id", nullable=false)
	@Expose
	private String w_id;
	
	@Column(name="w_nickname", nullable=false)
	@Expose
	private String w_nickname;
	
	@Column(name="content", nullable=false)
	@Expose
	private String content;
}

