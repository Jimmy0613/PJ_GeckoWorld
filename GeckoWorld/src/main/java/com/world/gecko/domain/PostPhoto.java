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
@Table(name = "post_photo")
public class PostPhoto { // 게시글 테이블
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "num")
	@Expose
	private int num;

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

	@Column(name = "photo1")
	@Expose
	private byte[] photo1;

	@Column(name = "photo2")
	@Expose
	private byte[] photo2;

	@Column(name = "photo3")
	@Expose
	private byte[] photo3;

	@Column(name = "photo4")
	@Expose
	private byte[] photo4;

	@Column(name = "photo5")
	@Expose
	private byte[] photo5;

	@Column(name = "desc1")
	@Expose
	private String desc1;

	@Column(name = "desc2")
	@Expose
	private String desc2;

	@Column(name = "desc3")
	@Expose
	private String desc3;

	@Column(name = "desc4")
	@Expose
	private String desc4;

	@Column(name = "desc5")
	@Expose
	private String desc5;

	@Column(name = "view_count")
	@Expose
	private int view_count;

	@Column(name = "comment_count")
	@Expose
	private int comment_count;

	@Column(name = "pdate", insertable = false, updatable = false, columnDefinition = "DATETIME DEFAULT CURRENT_TIMESTAMP")
	@Expose
	@Temporal(TemporalType.TIMESTAMP)
	@CreationTimestamp
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Date pdate;

}
