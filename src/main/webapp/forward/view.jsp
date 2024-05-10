<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    String code=request.getParameter("code");
	
	String viewpageURI =null;
	
	if(code.equals("A")){
		viewpageURI= "viewModule/a.jsp";
		
	}else if(code.equals("B")){
		viewpageURI= "viewModule/b.jsp";
		
	}else if(code.equals("C")){
		viewpageURI= "viewModule/c.jsp";
		
	}
%>
<jsp:forward page="<%=viewpageURI %>" />
