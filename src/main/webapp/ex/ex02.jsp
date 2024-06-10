<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <%@ page import="com.actiontag.Customer, java.util.ArrayList" %>
        
        <%
        
        ArrayList<String> singer=new ArrayList<String>();
        singer.add("소녀시대");
        singer.add("원더걸스");
        request.setAttribute("singer", singer);
        
        Customer[] customers = new Customer[2];
        customers[0] =new Customer();
        customers[0].setName("손오공");
        customers[0].setEmail("ssss@fdfdf.cm");
        customers[0].setPhone("010-2220222");
        
      
        customers[1] =new Customer();
        customers[1].setName("홍길동");
        customers[1].setEmail("ss212s@fdfdf.cm");
        customers[1].setPhone("010-2220222");
        request.setAttribute("customers", customers);
        %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul><li>${singer[0]},${singer[1]}.</li></ul>
<ul>
	<li>이름:${customers[0].name}</li>
	<li>이름:${customers[0].email}</li>
	<li>이름:${customers[0].phone}</li>


</ul>

	<ul>
	<li>이름:${customers[1].name}</li>
	<li>이름:${customers[1].email}</li>
	<li>이름:${customers[1].phone}</li>


</ul>
</body>
</html>