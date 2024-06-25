<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% request.setCharacterEncoding("utf-8"); %>
    <jsp:useBean id="dao" class="com.member1.StudentDAO"></jsp:useBean>
    <jsp:useBean id="vo" class="com.member1.StudentVO"></jsp:useBean>
    
    <jsp:setProperty property="*" name="vo"/>
    
    <%
    boolean flag=dao.memberInsert(vo);
    
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="style.css" rel="stylesheet" type="text/csss">
<title>Insert title here</title>
</head>
<body bgcolor="#FFFFCC">
<br>
<div align="center">
<%
	if(flag){
		out.println("<br>축하<b></br>");
		out.println("<a  href=loginTest.jsp> login</a>");
	}else{
		out.println("<b>다시작");
		out.println("<a  href=regFrom.jsp> 다시작성</a>");
	}

%>



</div>
</body>
</html>