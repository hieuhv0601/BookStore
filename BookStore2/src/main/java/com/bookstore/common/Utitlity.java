package com.bookstore.common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Utitlity {
	public static void forwardToPage(String page, String message, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("message", message);
		request.getRequestDispatcher(page).forward(request, response);
	}

	public static void showMessageFrontend(String message, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		forwardToPage("client/message.jsp", message, request, response);
	}

	public static void showMessageBackend(String message, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		forwardToPage("message.jsp", message, request, response);
	}

	public static void forwardToPage(String page, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher(page).forward(request, response);
	}
}
