<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import="java.util.*" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="now" value="<%=new Date() %>"></c:set>

Korea KST :
<fmt:formatDate value="${now}"  type="both" dateStyle="full" timeStyle="full"/>
<br>
UK GMT:

<fmt:timeZone value="GMT">
<fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/>
</fmt:timeZone>
<br>

<%
String[] ids =TimeZone.getAvailableIDs();
for(int i =0; i <ids.length;  i++){
	out.println(ids[i]+ "<br>");
}
%>
</body>
</html>