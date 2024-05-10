<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="false"%>
<% response.setStatus(HttpServletResponse.SC_OK); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예외 발생</title>
</head>
<body>
요청 처리 과정에서 예외가 발생 하였사옵니다. <br><br>
부디 고객님의 너그러운 마음으로 헤아려 주시면 <br><br>
빠른 시간내에 문제를 초전박살 내겠습니다. <br><br>

에러타입 <%=exception.getClass().getName() %><br><br>
에러메시지 : <b><%=exception.getMessage() %></b>
</body>
</html>