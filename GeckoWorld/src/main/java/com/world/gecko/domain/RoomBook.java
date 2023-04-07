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

@Data
@Entity
@Table(name = "room_book")
public class RoomBook {

	@Id
	@Column(name = "num", nullable = false)
	@Expose
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int num;

	@Column(name = "guest_id", nullable = false)
	@Expose
	private String guestId;
	
	@Column(name = "guest_name", nullable = false)
	@Expose
	private String guestName;

	@Column(name = "guest_phone", nullable = false)
	@Expose
	private String guestPhone;

	@Column(name = "book_date", nullable = false)
	@Expose
	private String bookDate;

	@Column(name = "start_time", nullable = false)
	@Expose
	private int startTime;

	@Column(name = "end_time", nullable = false)
	@Expose
	private int endTime;

	@Column(name = "reserved_at", insertable = false, updatable = false, columnDefinition = "DATETIME DEFAULT CURRENT_TIMESTAMP")
	@Expose
	@Temporal(TemporalType.TIMESTAMP)
	@CreationTimestamp
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Date reservedAt;

	@Column(name = "status", columnDefinition = "VARCHAR(20) DEFAULT '예약'")
	@Expose
	private String status;

}
