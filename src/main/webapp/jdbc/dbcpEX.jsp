<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
       <%@page import="javax.sql.*" %>
          <%@page import="javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h2>DBCP 데이터베이스 연동</h2>
	<% 
	Context initContext =new InitialContext();
	DataSource ds =(DataSource)initContext.lookup(
			"java:/comp/env/jdbc/myoracle");
	Connection con= ds.getConnection();
	out.println("DBCP 연결성공이다!!!!!        ");
	%>
	
</body>
</html>