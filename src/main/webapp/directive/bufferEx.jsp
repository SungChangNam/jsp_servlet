<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page buffer="1kb" autoFlush="true" %>
<%@ page info="Copyright 2024 by KIM" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1><%=getServletInfo() %></h1>
<% for(int i=0; i<1000; i++){ %>
1234
<%} %>
</body>
</html>