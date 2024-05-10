package com.test;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloServlet
 */
//@WebServlet(name = "glo",urlPatterns = {"/Hello","/x","/y"})
@WebServlet(name = "glo",value = {"/Hello","/x","/y"})
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
	 *  init method
	 *  
	 *  - 서블릿 인스턴스 를 처음 생성 할때 단 하번 호출됨
	 *  서블릿에서 필요한 초기화 작업시 주로 이용함
	 * 
	 * */
	@Override
	public void init() throws ServletException {
		
		System.out.println("init request");
	}
	/*destroy method 
	 * 	서블릿 인스턴스 가 컨테이너(톰켓)에서 제거 될때 호출됨
	 *    따라서 init method 에서 구현했던 초기화 작업을 반납처리 
	 *    할때 주로 사용되는 메소드
	 * */
	

	@Override
	public void destroy() {
		System.out.println("Destroy request");
	}
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("hi nice to meet");
	}

	/**
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
**/
}
