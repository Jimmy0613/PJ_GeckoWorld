package com.world.gecko.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.google.gson.annotations.Expose;

import lombok.Data;

@Entity
@Data
@Table(name="room")
public class Room {
	
	@Column(name="num")
	@Expose
	@Id
	private int num;
	
	@Column(name="type")
	@Expose
	private String type;
	
	@Column(name="capacity")
	@Expose
	private int capacity;
	
	@Column(name="price_per_hour")
	@Expose
	private int pricePerHour;
	
	@Column(name="usable")
	@Expose
	private boolean usable;
}
