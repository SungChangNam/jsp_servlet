<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getParameter</title>
</head>
<body>
<h1>getParameterValues</h1>
<form action="/Sport" method="post" >
<fieldset>
 	<legend>좋아하는 운동 및 취미</legend>
 	<ul>
 		<li> 
 			<label>야구</label>
			<input type="checkbox" name="sports" value="야구"> 			
 			<label>축구</label>
			<input type="checkbox" name="sports" value="축구"> 			
 			<label>농구</label>
			<input type="checkbox" name="sports" value="농구"> 			
 		</li>
 	  <li>
 	 <label>남</label>
	<input type="radio" name="gender" value="남" checked> 	  
	<label>여</label>
	<input type="radio" name="gender" value="여" > 	  
 	 
 	  </li>
 	  <li>
 	  <input type="submit" value="전송">
 	  </li>
 	</ul>

</fieldset>
</form>

</body>
</html>