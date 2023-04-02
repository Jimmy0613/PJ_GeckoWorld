package com.world.gecko.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.google.gson.annotations.Expose;

import lombok.Data;

@Entity
@Data
@Table(name="user_")
public class User {
	
	public User(String id, String nickname, String pw, String type, String role) {
		this.id = id;
		this.nickname = nickname;
		this.pw = pw;
		this.type = type;
		this.role = role;
	}

	public User() {
	}

	@Id
	@Column(name="id")
	@Expose
	private String id;
	
	@Column(name="nickname", nullable=false)
	@Expose
	private String nickname;
	
	@Column(name="pw", nullable=false)
	@Expose
	private String pw;
	
	@Column(name="role", nullable=false)
	@Expose
	private String role;
	
	@Column(name="type", nullable=false)
	@Expose
	private String type;
	
}
