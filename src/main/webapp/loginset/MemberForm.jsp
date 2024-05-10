<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="/Member"  method="post">
<fieldset>
			<legend>회원 가입</legend>
			<ul>
			      <li>
			      		<label>이름</label>
			      		<input type="text" name="username">
			      </li> 
						 <li>
			      		<label> 주소</label>
			      		<input type="text" name="address">
			      </li> 
			      		<li>
			      		<label>아이디</label>
			      		<input type="text" name="userid">
			      </li> 
			      	<li>
			      		<label>비밀번 호</label>
			      		<input type="password" name="passwd">
			      </li> 
			      		 <li>
			      		<label>email</label>
			      		<input type="email" name="email">
			      </li> 
			       <li> <input type="submit"  value="전송"></li>
			</ul>
</fieldset>
</form>


</body>
</html>