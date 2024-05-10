	package com.bbs;
	
	import java.io.IOException;
	import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	import java.sql.*;
	
	//@WebServlet("/VisitInsert")
	public class VisitInsert extends HttpServlet {
		private static final long serialVersionUID = 1L;
	
		protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			//한글 처리
			request.setCharacterEncoding("UTF-8");
			//사용자가 writer.html 파일로 요청한 값을 읽어오기
		String writer  = 	request.getParameter("writer");
		String memo  =	request.getParameter("memo");
			
		System.out.println("작성자 : " +writer);	
		System.out.println("내    용 : " +memo);	
			
		String sql = "insert  into visit(no,writer,memo,regdate) values(visit_seq.nextval,?,?,sysdate)";
		
		Connection con =null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:orcl",
					"scott", "tiger");
			
			pstmt =con.prepareStatement(sql);
			pstmt.setString(1, writer);
			pstmt.setString(2, memo);
			
			pstmt.executeUpdate();
		} catch ( ClassNotFoundException ce) {
			ce.printStackTrace();
		}catch (SQLException se) {
			se.printStackTrace();
			
		}finally {
			try {
				if(pstmt !=null)pstmt.close();
			}catch ( SQLException ss) {
				ss.printStackTrace();
			}
			try {
				if(con !=null)con.close();
			}catch ( SQLException ss) {
				ss.printStackTrace();
			}
		}
		
		response.sendRedirect("VisitList");
		}
	
		
		
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			processRequest(request, response);
		}
	
	
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			processRequest(request, response);
		}
	
	}
