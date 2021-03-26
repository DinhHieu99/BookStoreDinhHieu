package com.bookstore;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class CheckLogIn {

	public static boolean Check(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("email") != null) {
			return true;
		}
		return false;
	}

}
