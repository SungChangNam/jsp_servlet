<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%-- 
    	request 속성과 requestDispatcher
   		MVS 웹 어플리케이션에서
   			Model에서 view측으로 데이터를 넘겨 줄때,
   			request 범위에 데이터를 저장해서 view로 전달해줌 	 
     --%>
     
     
     <%
     // pageContext Scope에 속성 저장
     pageContext.setAttribute("pageAttribure", "홍길동");
   //  pageContext.setAttribute("pageAttribure", "홍길동",
    //		 PageContext.PAGE_SCOPE);
     
     
     // requset Scope에 속성 저장
     request.setAttribute("requsetAttribute","010-1234-1234" );
    // pageContext.setAttribute("requsetAttribute","010-1234-1234", 
	//pageContext.REQUEST_SCOPE);
     
     // session Scope에 속성 저장
     session.setAttribute("sessionAttribute", "gaw@gmail.com");
     //pageContext.setAttribute("sessionAttribute", "gaw@gmail.com",pageContext.SESSION_SCOPE);
     
      // application Scope에 속성 저장
      application.setAttribute("applicationAttribute", "Globalin");
    //  pageContext.setAttribute("sessionAttribute", "gaw@gmail.com",A);
      
      
     %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li>이름 : <%= pageContext.getAttribute("pageAttribure") %></li>
		<li>전번 : <%= request.getAttribute("requsetAttribute") %></li>
		<li>메일 : <%= session.getAttribute("sessionAttribute") %></li>
		<li>회사 : <%= application.getAttribute("applicationAttribute") %></li>
	
	
	</ul>
</body>
</html>