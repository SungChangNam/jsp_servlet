<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <jsp:useBean id="vo" class="com.jstl.MemberVO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
<c:set target="${vo}" property="name" value="honggildong"/> 
<c:set target="${vo}" property="email" value="hong@naver.com"> 

</c:set>
<c:set var="age" value="30"  />
<c:set target="${vo}" property="age" value="${age}"/> 
<h3>회원정보</h3>
<ul>
  <li>name: ${vo.name}</li>
  <li>email: ${vo.email}</li>
  <li>age: ${vo.age}</li>
</ul>


</body>
</html>