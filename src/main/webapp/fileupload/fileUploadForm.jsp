<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<form action="fileUpload.jsp" method="post" 
enctype="multipart/form-data">

<table border="1">
<tr>
 <td colspan="2"><h3>파일업로드 폼 </h3></td>

</tr>
<tr>
<td>올림사람:  </td> <td><input type="text"name="name"> </td>
</tr> 


<tr>
<td>제목:  </td> <td><input type="text" name="subject"> </td>
</tr> 

<tr>
<td>file1:  </td> <td><input type="file" name="fileName1"> </td>
</tr> 

<tr>
<td>file2:  </td> <td><input type="file" name="fileName2"> </td>
</tr> 


<tr>
 <td colspan="2" align="center">
 <input type="submit" value="전송">
 </td>

</tr>


</table>



</form>
</div>
</body>
</html>