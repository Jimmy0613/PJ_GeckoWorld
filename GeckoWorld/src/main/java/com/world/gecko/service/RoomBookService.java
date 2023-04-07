package com.world.gecko.service;

import java.util.List;
import java.util.Optional;

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
	
	public void newBook(RoomBook rb) {
		rb.setStatus("예약");
		repo.save(rb);
	}
	
	public List<RoomBook> findByUserId(String id){
		return repo.findByGuestId(id);
	}
	
	public void cancel(int num) {
		Optional<RoomBook> rb = Optional.ofNullable(repo.findByNum(num));
		if(rb.isPresent()) {
			RoomBook book = rb.get();
			book.setStatus("취소");
			repo.save(book);
		}
	}
}
