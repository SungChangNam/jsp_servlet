<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="com.actiontag.Customer, java.util.HashMap" %>
    
    
    <%
    
      Customer customer =new Customer();
    customer.setName("손오공");
    customer.setEmail("son@naver.com");
    customer.setPhone("010-111-111");
     
    	request.setAttribute("customer", customer);
    	
    	HashMap<String, String> map =new
    			HashMap<String, String>();
    	
    	map.put("name","소나타");
    	map.put("maker", "현대자동차");
    	request.setAttribute("car", map);
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL</title>
</head>
<body>
<ul>
		<li>이름: <%=customer.getName()%></li>
		<li>메일:  <%=customer.getEmail()%></li>
		<li>전번:  <%=customer.getPhone()%></li>
</ul>
<br>
<ul>
		<li>이름: ${customer.name }</li>
		<li>메일: ${customer.email }</li>
		<li>전번: ${customer.phone }</li>
</ul>

<br>
<ul>

 	<li>자동차 :${car.name}</li>
 	<li>제조사 :${car.name}</li>
 	<li>자동차 :${car.name}</li>

</ul>
</body>
</html>