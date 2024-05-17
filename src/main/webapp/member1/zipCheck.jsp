<%@page import="com.member1.ZipcodeVO"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <jsp:useBean id="dao" class="com.member1.StudentDAO"></jsp:useBean>
    
    <%
    request.setCharacterEncoding("utf-8");
    String check= request.getParameter("check");
    String dong =request.getParameter("dong");
    
    Vector<ZipcodeVO> zipcodeList =dao.zipcodeRead(dong);
    
    int totalList =zipcodeList.size();
    
    
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편 번호 검색</title>
<script type="text/javascript" src="script.js"></script>
</head>
<body bgcolor="#FFFFCC">
<div align="center">
<b>우편번호 찾기</b>
<form action="zipCheck.jsp" name="zipForm" method="post">
<table>
	<tr>
	<td>동이름: 
		<input type="text" name="dong">
		<input type="button" value="검색" onclick="dongCheck()"> 
		</td>
	</tr>
</table>
<input type="hidden" name="check" value="n">

</form >





<table>
<%
	if(check.equals("n")){
		if(zipcodeList.isEmpty()){


%>
	<tr> <td align="center"> <br>검색된 결과가 없습니다.</td></tr>
	<%
		}else{
	
	%>
		<tr> <td align="center"> <br>
		검검색 후, 아래 우편번호를 클릭하여 자동으로 주소가 입력됩니다.
		
		</td></tr>
		
	<%
		for(int i =0; i <totalList; i++){
			ZipcodeVO vo=zipcodeList.elementAt(i);
			String tempZipcode =vo.getZipcode();
			String tempSido=vo.getSido();
			String tempGugun =vo.getGugun();
			String tempDong =vo.getDong();
			String tempRi =vo.getRi();
			String tempBunji =vo.getBunji();
			
			if(tempRi==  null)tempRi ="";
			if(tempBunji == null)tempBunji="";
			
		%>
		<tr>
			<td>
			
			<a href="javascript:sendAddress('<%= tempZipcode%>','<%= tempSido%>','<%= tempGugun%>','<%= tempDong%>','<%= tempRi%>','<%= tempBunji%>')" >
			<%=tempZipcode%>&nbsp;<%=tempSido%>&nbsp;<%=tempGugun%>&nbsp;<%=tempDong%>&nbsp;<%=tempRi%>&nbsp;<%=tempBunji%>
			 </a><br>
		
			<%
		}
		}
	}
		%>
			</td>
		
		</tr>
		
	




<tr>
<td align="center">
<a href="javascript:this.close()">닫기</a></td>
</tr>
</table>

</div>
</body>
</html>