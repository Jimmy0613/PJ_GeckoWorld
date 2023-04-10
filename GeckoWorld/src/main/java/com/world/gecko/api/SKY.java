package com.world.gecko.api;

public enum SKY {
	SUNNY("맑음"), PARTLY_CLOUDY("구름많음"), CLOUDY("흐림");

	private final String value;

	SKY(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}
}
