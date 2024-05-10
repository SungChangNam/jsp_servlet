<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jsp</title>
</head>
<body>
	<h2>JSP Script</h2>
	<%!String declation = "선언문 입니다";%>
	<%!public String declationMethod() {
		return declation;
	}%>
	<%String scriptlet = "스크립트릿 입니다";
	String comment = "주석문 입니다";
	out.println("내장 객체를 이용한 출력 : " + declation +"<br></br>");
	%>
	선언문 출력(변수) : <%=declation %><br><br>
	선언문 출력(메소드) : <%=declationMethod() %><br><br>
	스트립트릿 출력 : <%=scriptlet %><br><br>
	
	
</body>
</html>