<%@page import="com.sample.SimpleData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    request.setCharacterEncoding("UTF-8");
    String message = request.getParameter("message");
    
    %>
  <jsp:useBean id="msg" class="com.sample.SimpleData" /> 
<%--     <%
    	SimpleData msg = new SimpleData();
     	msg.setMessage(message);
    	%> --%>
 <jsp:setProperty property="message" name="msg"/> --
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1>Java Beens 프로그램 결과</h1>
    <hr color="red"> <br>
    <font size="5">
     메세지 : <jsp:getProperty property="message" name="msg"/> 
<%--     <%= message %> --%>
    </font>
</body>
</html>