package com.test;

import java.io.IOException;

import javax.print.attribute.standard.MediaSize.ISO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.html.HTML;
import java.io.PrintWriter;

//@WebServlet("/Response")
public class ResponseServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out= response.getWriter();
				
				out.print("<html>");
				out.print("<header><title>응답</title><header>");
				out.print("<body>");
				out.print("ResposeServlet 응답 처리.......");
				out.print("</body>");
				out.print("<html>");
	}
		
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//doGet(request, response);
	}

}
