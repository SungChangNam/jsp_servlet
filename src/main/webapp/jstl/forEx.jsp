<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
 <%
 		String[] moveList ={"프리즌프레이크","스파르타쿠스","히어로즈"};
 		request.setAttribute("moveList", moveList);
 %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>
인기 미드
<ul>
			<c:forEach var="move" items="${moveList}">
			<li>${move }</li>
			</c:forEach>
</ul>
</body>
</html>