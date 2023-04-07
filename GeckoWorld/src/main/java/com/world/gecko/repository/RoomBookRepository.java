package com.world.gecko.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.world.gecko.domain.RoomBook;

@Repository
public interface RoomBookRepository extends JpaRepository<RoomBook, Integer> {

	public RoomBook findByNum(int num);
	public List<RoomBook> findByBookDate(String bookDate);
	public List<RoomBook> findByGuestId(String id);
}
