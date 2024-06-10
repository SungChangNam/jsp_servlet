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
<c:if test="${3 > 4}">
이내용은  화면에 나타나지 않음
</c:if>
<c:if test="${param.type eq 'guest'}">
홈페이지 방문을 환영합니다.<br>
</c:if>

<c:if test="${param.type eq'member'}">
회원님의 방문을 환영합니다.<br>
많은 서비스를 받기를 바라며<br>

</c:if>
</body>
</html>