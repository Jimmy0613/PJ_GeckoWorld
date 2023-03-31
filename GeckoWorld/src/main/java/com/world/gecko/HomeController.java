package com.world.gecko;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.world.gecko.domain.Post;
import com.world.gecko.service.PostService;

@Controller
public class HomeController {

	@Autowired
	private PostService pService;
	private boolean initialized = false;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		if (!initialized) {
			pService.getList(1);
			initialized = true;
		}
		return "home";
	}

	@RequestMapping(value = "/error")
	public void error() {

	}
}
