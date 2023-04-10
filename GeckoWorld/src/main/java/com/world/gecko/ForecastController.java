package com.world.gecko;

import java.net.URI;
import java.net.URISyntaxException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.world.gecko.api.ForecastApi;
import com.world.gecko.service.ForecastService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/api/*")
@Log4j
public class ForecastController {

	@Autowired
	ForecastService service;

	private final static String SERVICE_KEY = "JgtXJ1FClRXtO3dB%2Bnug1qseCuMjnKswOsRlFdYliHmcPyKKZYqQNs%2BDb6LpRK9m6Y0sOP6PR53OVGp9d7ZHZA%3D%3D";
	private final static String SERVICE_URL = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst?numOfRows=60&pageNo=1&dataType=JSON";

	@GetMapping("/test")
	public void apiTest(@RequestParam(value = "nx", defaultValue = "55") int nx,
			@RequestParam(value = "ny", defaultValue = "127") int ny) {
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat timeFormat = new SimpleDateFormat("HHmm");
		String baseDate = dateFormat.format(date);
		String baseTime = timeFormat.format(date);
		
		StringBuilder sb = new StringBuilder(SERVICE_URL);
		sb.append("&serviceKey=" + SERVICE_KEY);
		sb.append("&base_date=" + baseDate);
		sb.append("&base_time=" + baseTime);
		sb.append("&nx=" + nx);
		sb.append("&ny=" + ny);

		URI uri = null;
		try {
			uri = new URI(sb.toString());
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}

		RestTemplate rt = new RestTemplate();
		ForecastApi api = rt.getForObject(uri, ForecastApi.class);
		log.info("=====ResponseBody===== : " + api.response.body.items.item.get(0));
		log.info("=====fcstdate===== : " + api.response.body.items.item.get(0).fcstDate);
		log.info("=====fcsttime===== : " + api.response.body.items.item.get(0).fcstTime);
		log.info("=====category===== : " + api.response.body.items.item.get(0).category);
		log.info("=====value===== : " + api.response.body.items.item.get(0).fcstValue);

	}
}
