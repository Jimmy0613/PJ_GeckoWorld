package com.world.gecko.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class SessionUtils {
	public static void setObject(HttpServletRequest request, String key, Object value) {
		HttpSession session = request.getSession();
		session.setAttribute(key, value);
	}

	public static void removeObject(HttpServletRequest request, String key) {
		HttpSession session = request.getSession();
		session.removeAttribute(key);
	}

	public static boolean contains(HttpServletRequest request, String key) {
		HttpSession session = request.getSession();
		return session.getAttribute(key) != null;
	}

	public static Object getObject(HttpServletRequest request, String key) {
		HttpSession session = request.getSession();
		return session.getAttribute(key);
	}
}
