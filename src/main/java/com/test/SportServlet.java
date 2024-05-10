package com.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//@WebServlet("/Sport")
public class SportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		String[] sports= request.getParameterValues("sports");
		String gender = request.getParameter("gender");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out= response.getWriter();
		out.print("<html>");
		out.print("<body>");
		
		for(String sport :sports) {
			out.print("좋아하는 운동: "+sport+"<br>");
		}
		out.print("성별:" +gender+"<br>");
		out.print("</html>");
		out.print("</body>");
		
	}

}