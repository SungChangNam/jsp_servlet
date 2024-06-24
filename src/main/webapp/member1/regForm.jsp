<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link href="style.css" rel="stylesheet" type="text/csss">
<script type="text/javascript" src="script.js"></script>
</head>
<body>
	<form class="signup-form" action="regProc.jsp" name="regForm" method="post" onsubmit="return inputCheck();"> 
                <label for="id">아이디</label>
                <input type="text" id="id" name="id" required>&nbsp;
                <input type="button" value="중복확인" onclick="idCheck(this.form.id.value)">
                
                <label for="pass">비밀번호</label>
                <input type="password" id="pass" name="pass" required>
                
                <label for="repass">비밀번호 확인</label>
                <input type="password" id="repass" name="repass" required>
                
                <label for="name">이름</label>
                <input type="text" id="name" name="name" required>

                <label for="phone1">전화번호</label>
                <select id="phone1" name="phone1">
                    <option value="02">02</option>
                    </select> -
                <input type="text" name="phone2" size="5"> -
                <input type="text" name="phone3" size="5">

                <label for="email">이메일</label>
                <input type="email" id="email" name="email" required>

                <label for="zipcode">우편번호</label>
                <input type="text" id="zipcode" name="zipcode">&nbsp;
                <input type="button" value="찾기" onclick="zipCheck()">
                
                <label for="address1">주소</label>
                <input type="text" id="address1" name="address1" size="50">

                <label for="address2">상세 주소</label>
                <input type="text" id="address2" name="address2" size="50">

                <button type="submit">REGISTER</button>
            </form>
</body>
</html>