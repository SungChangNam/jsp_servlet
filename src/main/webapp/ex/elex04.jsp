<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>파라미터 갑 처리</h3> <br>
<form action="elex04.jsp" method="post">
이름 : <input type="text"  name ="name" value="${parma['name'] }">
 <input type="submit"  name ="확인" ">
	
	
</form>
<p>
이름은 ${param.name }입니다
</p>  


</body>
</html>