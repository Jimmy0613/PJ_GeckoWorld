package com.world.gecko.api;

public enum PTY {
	NONE("없음"), RAIN("비"), RAIN_OR_SNOW("비/눈"), SNOW("눈"), SHOWER("소나기");

	private final String value;

	PTY(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}
}
