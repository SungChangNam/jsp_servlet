<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forTokens  var="car" 
items="Sprinter Trueno AE86,Rx-7 Savana FC3S,Lnacer Evoluton II,RX-7 Efini FD3S" delims=",">
자동차 이름 : <c:out value="${car }"/><br>

</c:forTokens>
</body>
</html>