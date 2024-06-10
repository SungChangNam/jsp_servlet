<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    request.setAttribute("nam","홍길동");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

요청 URI : ${pageContext.request.requestURI}<br>
requset 의 name attui  :${request.Scope.name}
code 의 name attue  :${parma.code}<br>
</body>
</html>