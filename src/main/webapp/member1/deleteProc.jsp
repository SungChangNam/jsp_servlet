<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="com.member1.*" %>  
 <jsp:useBean id="dao" class="com.member1.StudentDAO" />  
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"  http-equiv="refresh" content="3;url=loginTest.jsp">
<title>회원탈퇴</title>
</head>
<%
  String id=(String)session.getAttribute("loginId");
  String pass = request.getParameter("pass");
 
  int check = dao.deleteMember(id, pass);
 
  if(check == 1){
		  session.invalidate();
%>
<body>
<div align="center">
<font size="5" face="궁서체">
<b>회원정보가 삭제되었습니다. 안녕히 가십시요 !!</b><br>
3초 후에 Login Page로 이동합니다.
</font>
</div>
<%} else { %>
<script type="text/javascript">
 alert("비밀번호가 틀렸습니다.");
 history.go(-1);
</script>
<%}%>
</body>
</html>