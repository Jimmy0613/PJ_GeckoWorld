package com.world.gecko;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.world.gecko.domain.RoomBook;
import com.world.gecko.service.RoomBookService;

@Controller
@RequestMapping("/book")
public class BookController {

	@Autowired
	private RoomBookService rbService;

	@RequestMapping(value = "/bookSearch", method = RequestMethod.GET)
	@ResponseBody
	public List<RoomBook> bookList(@RequestParam("date") String date) {
		return rbService.getBookListByDate(date);
	}
}
