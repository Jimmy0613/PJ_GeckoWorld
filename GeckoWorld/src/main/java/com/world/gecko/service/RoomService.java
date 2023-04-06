package com.world.gecko.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.world.gecko.domain.Room;
import com.world.gecko.repository.RoomRepository;

@Service
public class RoomService {

	@Autowired
	private RoomRepository repo;
	
	public Room findRoom(int num) {
		return repo.findByNum(num);
	}
}
