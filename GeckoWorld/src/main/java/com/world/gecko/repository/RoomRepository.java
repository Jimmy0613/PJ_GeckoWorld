package com.world.gecko.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.world.gecko.domain.Room;

@Repository
public interface RoomRepository extends JpaRepository<Room, Integer>{
	public Room findByType(String type);

	public Room findByNum(int num);
}
