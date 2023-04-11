package com.world.gecko;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.world.gecko.service.ForecastService;

@Controller
public class HomeController {

	@Autowired
	private ForecastService fcstService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		model.addAttribute("first", fcstService.getFirstDistinct());
		return "home";
	}

	@RequestMapping(value = "/error", method = RequestMethod.GET)
	public void error() {

	}

}
