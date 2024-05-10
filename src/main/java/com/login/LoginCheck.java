package com.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//@WebServlet("/LoginCheck")
public class LoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");

		// 데이터베이스에서 정보를 가져와서 폼에서 가져온 정보와 비교
		String dbID = "admin"; // DB 에 저장된 아이디와 비번을 다음과 같이 가정함
		String dbPWD = "1234";

		if (dbID.equals(id) && dbPWD.equals(pwd)) {
			HttpSession session = request.getSession();
			session.setAttribute("user", id);
		}
		response.sendRedirect("Login");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		processRequest(request, response);
	}

}
