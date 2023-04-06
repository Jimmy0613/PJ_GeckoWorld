package com.world.gecko.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.world.gecko.domain.RoomBook;
import com.world.gecko.repository.RoomBookRepository;

@Service
public class RoomBookService {
	@Autowired
	private RoomBookRepository repo;
	
	public List<RoomBook> getBookListByDate(String date){
		return repo.findByBookDate(date);
	}
	
}
