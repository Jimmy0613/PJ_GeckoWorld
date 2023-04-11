package com.world.gecko;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.world.gecko.domain.FcstNxNy;
import com.world.gecko.service.ForecastService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/api/*")
@Log4j
public class ForecastController {

	@Autowired
	ForecastService service;

	@GetMapping("/getSecond")
	@ResponseBody
	public List<String> getSecond(@RequestParam("first") String first) {
		return service.getSecondByFirst(first);
	}

	@GetMapping("/getThird")
	@ResponseBody
	public List<String> getThird(@RequestParam("first") String first, @RequestParam("second") String second) {
		return service.getThirdByFirstAndSecond(first, second);
	}

	@GetMapping("/getNxny")
	@ResponseBody
	public FcstNxNy getNxny(@RequestParam("first") String first, @RequestParam("second") String second,
			@RequestParam("third") String third) {
		FcstNxNy nxny = service.getNxNy(first, second, third);
		return nxny;
	}

	@GetMapping("/getForecast")
	@ResponseBody
	public Map<String, String> apiTest(FcstNxNy input) {
		if (input.getNx() == 0) {
			input.setNx(60);
		}
		if (input.getNy() == 0) {
			input.setNy(127);
		}
		return service.getForecast(input);

	}
}
