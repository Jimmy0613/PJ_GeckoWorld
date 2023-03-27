package com.world.gecko.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PwEncoder {
	public static String passwordEncode(String password) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncoder.encode(password);
		return hashedPassword;
	}

	public static boolean passwordMatches(String password, String input) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		return passwordEncoder.matches(password, input);
	}
}
