<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더 목록 출력</title>
</head>
<body>
	
<%
  Enumeration<String> headerNames = request.getHeaderNames();
  while (headerNames.hasMoreElements()) {
    String headerName = headerNames.nextElement();
    String headerValue = request.getHeader(headerName);
    out.println(headerName + ": " + headerValue + "<br>");
  }
%>







</body>
</html>