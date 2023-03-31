package com.world.gecko.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

import com.google.gson.annotations.Expose;

import lombok.Data;

@Entity
@Data
@Table(name = "post")
public class Post { // 게시글 테이블
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "num")
	@Expose
	private int num;
	
	@Column(name = "tag", nullable = false)
	@Expose
	private char tag;
	
	@Column(name = "w_id", nullable = false)
	@Expose
	private String w_id;
	
	@Column(name = "w_nickname", nullable = false)
	@Expose
	private String w_nickname;
	
	@Column(name = "title", nullable = false)
	@Expose
	private String title;
	
	@Column(name = "content", nullable = false)
	@Expose
	private String content;
	
	@Column(name = "view_count")
	@Expose
	private int view_count;
	
	@Column(name = "like_count")
	@Expose
	private int like_count;
	
	@Column(name = "comment_count")
	@Expose
	private int comment_count;
	
	@Column(name = "response_count")
	@Expose
	private int response_count;
	
	@Column(name = "pnum")
	@Expose
	private int pnum;
	
	@Column(name = "pdate", insertable=false, updatable=false, columnDefinition="DATETIME DEFAULT CURRENT_TIMESTAMP")
	@Expose
	@Temporal(TemporalType.TIMESTAMP)
	@CreationTimestamp
	private Date pdate;
}
