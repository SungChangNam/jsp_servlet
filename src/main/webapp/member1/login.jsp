<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 String loginId =(String)session.getAttribute("loginId");

 %>  
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/csss">
<script type="text/javascript" src="script.js"></script>
</head>
<body>
<%
	if(loginId !=null){//로그인  성공했을 경우
	
%>
<table width="300" border="1">
	<tr>
	<td colspan ="3" align="center">
			<%=loginId %>님 환영합니다.
	</td>
	</tr>
	<tr>
		<td width="100" align="center">
			<a href="modifyForm.jsp">회원정보 수정</a>
		</td>
				<td width="100" align="center">
			<a href="deleteForm.jsp">회원탈퇴</a>
		</td>
		<td width="100" align="center">
			<a href="logoutForm.jsp">로그아웃 </a>
		</td>

	</tr>
	
</table>

<%} else {//로그인 실패시%>

<form action="loginProc.jsp" method="post">
<table width="300" border="1">
	<tr>
		<td colspan="2" align="center">회원가입</td>
	</tr>
		<tr>
		<td align="right" width="100">아이디</td>
		<td width="200">
			<input type="text" name="id" size="20">
		</td>
	</tr>
	
			<tr>
		<td align="right" width="100">비밀번호</td>
		<td width="200">
			<input type="password" name="pass" size="20">
		</td>
	</tr>
	<tr>
	 <td colspan="2" align="center">
	 <input type="submit" value="로그인"> &nbsp;&nbsp;
	 <input type ="button" value="회원가입"
	 onclick="javascript:window.location='regForm.jsp'">
	 </td>
	</tr>
</table>
</form>
<%}  %>
</body>
</html>