package com.world.gecko.service;

import java.net.URI;
import java.net.URISyntaxException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.world.gecko.api.ForecastApi;
import com.world.gecko.api.Items;
import com.world.gecko.domain.FcstNxNy;

@Service
public class ForecastService {
	private final static String SERVICE_KEY = "JgtXJ1FClRXtO3dB%2Bnug1qseCuMjnKswOsRlFdYliHmcPyKKZYqQNs%2BDb6LpRK9m6Y0sOP6PR53OVGp9d7ZHZA%3D%3D";
	private final static String SERVICE_URL = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst?numOfRows=60&pageNo=1&dataType=JSON";
	@Autowired
	private EntityManager em;

	public List<String> getFirstDistinct() {
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<String> cq = cb.createQuery(String.class);
		Root<FcstNxNy> root = cq.from(FcstNxNy.class);

		cq.select(root.get("first")).distinct(true).orderBy(cb.asc(root.get("first")));

		return em.createQuery(cq).getResultList();
	}

	public List<String> getSecondByFirst(String first) {
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<String> cq = cb.createQuery(String.class);
		Root<FcstNxNy> root = cq.from(FcstNxNy.class);

		cq.select(root.get("second")).distinct(true).orderBy(cb.asc(root.get("second")));
		cq.where(cb.equal(root.get("first"), first));

		return em.createQuery(cq).getResultList();
	}

	public List<String> getThirdByFirstAndSecond(String first, String second) {
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<String> cq = cb.createQuery(String.class);
		Root<FcstNxNy> root = cq.from(FcstNxNy.class);

		cq.select(root.get("third")).orderBy(cb.asc(root.get("third")));
		cq.where(cb.equal(root.get("first"), first), cb.equal(root.get("second"), second));

		return em.createQuery(cq).getResultList();
	}

	public FcstNxNy getNxNy(String first, String second, String third) {
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<FcstNxNy> cq = cb.createQuery(FcstNxNy.class);
		Root<FcstNxNy> root = cq.from(FcstNxNy.class);

		cq.select(root).where(cb.equal(root.get("first"), first), cb.equal(root.get("second"), second),
				cb.equal(root.get("third"), third));

		return em.createQuery(cq).getSingleResult();
	}

	public Map<String, String> getForecast(FcstNxNy input) {
		Date date = new Date();
		LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		LocalTime localTime = date.toInstant().atZone(ZoneId.systemDefault()).toLocalTime();

		if (localTime.getMinute() < 30) {
			localTime = localTime.minusMinutes(30);
		}

		if (localTime.getHour() == 0 && localTime.getMinute() < 30) {
			localDate = localDate.minusDays(1);
		}

		String baseDate = localDate.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
		String baseTime = localTime.format(DateTimeFormatter.ofPattern("HHmm"));

		StringBuilder sb = new StringBuilder(SERVICE_URL);
		sb.append("&serviceKey=" + SERVICE_KEY);
		sb.append("&base_date=" + baseDate);
		sb.append("&base_time=" + baseTime);
		sb.append("&nx=" + input.getNx());
		sb.append("&ny=" + input.getNy());
		URI uri = null;
		try {
			uri = new URI(sb.toString());
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
		RestTemplate rt = new RestTemplate();
		ForecastApi api = rt.getForObject(uri, ForecastApi.class);
		Items items = api.response.body.items;
		String fcstTime = items.item.get(0).fcstTime;
		Map<String, String> weather = new HashMap<>();

		for (int i = 0; i < items.item.size(); i++) {
			if (items.item.get(i).fcstTime.equals(fcstTime)) {
				switch (items.item.get(i).category) {
				case "PTY":
					switch (items.item.get(i).fcstValue) {
					case "0":
						weather.put("rain", "없음");
						System.out.println(weather.get("강수"));
						break;
					case "1":
						weather.put("rain", "비");
						break;
					case "2":
						weather.put("rain", "비/눈");
						break;
					case "3":
						weather.put("rain", "눈");
						break;
					case "4":
						weather.put("rain", "소나기");
						break;
					}
					break;
				case "T1H":
					weather.put("temp", items.item.get(i).fcstValue + "℃");
					break;
				case "REH":
					weather.put("humidity", items.item.get(i).fcstValue + "%");
					break;
				case "SKY":
					switch (items.item.get(i).fcstValue) {
					case "1":
						weather.put("sky", "맑음");
						break;
					case "3":
						weather.put("sky", "구름 많음");
						break;
					case "4":
						weather.put("sky", "흐림");
						break;
					}
					break;
				}
			}
		}
		return weather;
	}

}
