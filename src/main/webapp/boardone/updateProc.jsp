<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.boardone.BoardDAO" %>
<%@ page import="java.sql.Timestamp" %>    
 
<% request.setCharacterEncoding("utf-8"); %>    
    
<jsp:useBean id="article" class="com.boardone.BoardVO" scope="page">
    <jsp:setProperty name="article" property="*" />
</jsp:useBean>    

<%
String pageNum= request.getParameter("pageNum");
BoardDAO dbpro =BoardDAO.getInstance();

int check =dbpro.updateArticle(article);

  if(check == 1){
	  
  
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" http-equiv="refresh" content="0;url=list.jsp?pageNum=<%=pageNum%>">
<title>Insert title here</title>
</head>
<body>
<%}else { %>
<script type="text/javascript">
alert("비밀번호가 틀렸습니다.");
history.go(-1);
</script>

<%} %>

</body>
</html>