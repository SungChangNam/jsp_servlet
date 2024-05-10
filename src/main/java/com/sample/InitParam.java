package com.sample;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




/*
 *  초기 파라미타
 *  1. ServletConfig
 *  	- ServeltConfig 객체는 Container가 Servlet을 생성할때 생성되는 객체임
 *  	- web.xml 파일에서 읽어서 이름/값의 쌍으로 된 초기화 파라미터를 
 *  		읽어서 저장함
 *  	- ServletConig 객체는 Servlet 객체당 한개씩 생성함
 *  	- Servlet 에서는 getServletConfig() 메소드를 이용해서
 *  	  Servlet 과 관련된 ServletConfig 객체를 획득 할 수 있음
 *  	  
 *  
 *  2.ServletContext
 * 	-ServletContext 객체는 web Application 당 하나씩 생성됨
 * 	-Web Application 전체에서 참조할 수 있는 초기화 파라미터를
 * 	저장할 수 있음
 * 	-Servlet에서는 getServletContext() method 를 이용해서 
 * 	 ServletContext 객체를 획득 할 수 있음
 * 	
 * */

//@WebServlet("/InitParam")
public class InitParam extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private String company;
	private String manager;
	private String tel;
	private String email;

	
	
	public void init() throws ServletException {
		
		// 초기파라미터 context
		company= getServletContext().getInitParameter("company");
		manager =getServletContext().getInitParameter("manager");
		// 초기파라마티터 읽어옴 config

		tel =getServletConfig().getInitParameter("tel");
		email =getServletConfig().getInitParameter("email");
	
	}


	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
			PrintWriter out =response.getWriter();
			
			
		
					try {
						response.setContentType("text/html; charset=UTF-8");
						out.println("<html>");
						out.println("<head><title>글로벌 정보</title></head>");
						
						out.println("<body>");
						out.println("<ul>");
						out.println("<li>compny:"+ company+"</li>");
						out.println("<li>관 리 자:"+ manager+"</li>");
						out.println("<li>전 화 번 호:"+ tel+"</li>");
						out.println("<li>이 메 일:"+ email+"</li>");
						out.println("</ul>");
						out.println("</body>");
						out.println("</html>");
					} finally {
						out.close();
					}
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		processRequest(request, response);
	}

}
