<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pageContext 기본객체</title>
</head>
<body>
<%
	HttpServletRequest httpRequest = (HttpServletRequest)pageContext.getRequest();
 	
%>
request 기본 객체와 pagContext.getRequset() 의 동일 여부:
<%= request == httpRequest %>
<br>

pageContext.getOut()메소드를 사용하여 데이터를 출력:

<% pageContext.getOut().println("hawie!!"); %>
</body>
</html>