package com.world.gecko.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.google.gson.annotations.Expose;

import lombok.Data;

@Table(name = "fcst_nx_ny")
@Entity
@Data
public class FcstNxNy {

	@Column(name="id")
	@Id
	@Expose
	private int id;
	
	@Column(name = "first_")
	@Expose
	private String first;

	@Column(name = "second_")
	@Expose
	private String second;

	@Column(name = "third_")
	@Expose
	private String third;

	@Column(name = "nx")
	@Expose
	private int nx;

	@Column(name = "ny")
	@Expose
	private int ny;

}
