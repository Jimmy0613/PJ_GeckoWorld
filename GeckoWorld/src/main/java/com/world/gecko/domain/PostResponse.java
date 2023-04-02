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

import com.fasterxml.jackson.annotation.JsonFormat;
import com.google.gson.annotations.Expose;

import lombok.Data;

@Entity
@Data
@Table(name = "post_response")
public class PostResponse { // 게시글 테이블
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "rnum")
	@Expose
	private int rnum;

	@Column(name = "pnum", nullable = false)
	@Expose
	private int pnum;

	@Column(name = "w_id", nullable = false)
	@Expose
	private String w_id;

	@Column(name = "w_nickname", nullable = false)
	@Expose
	private String w_nickname;

	@Column(name = "content", nullable = false)
	@Expose
	private String content;

	@Column(name = "like_count")
	@Expose
	private int like_count;

	@Column(name = "rdate", insertable = false, updatable = false, columnDefinition = "DATETIME DEFAULT CURRENT_TIMESTAMP")
	@Expose
	@Temporal(TemporalType.TIMESTAMP)
	@CreationTimestamp
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Date rdate;
}
