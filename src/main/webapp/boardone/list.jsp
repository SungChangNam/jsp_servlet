<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*"   %>    
<%@ page import="com.boardone.BoardDAO"   %>
<%@ page import="com.boardone.BoardVO"   %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="view/color.jsp" %>

<%!
// 한페이지에 보여줄 글수
int pageSize = 3;

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<%
      String pageNum= request.getParameter("pageNum");
     
   // 무엇을 검색할지 파라미터를 가져와야함(작성자, 제목, 내용)
    String searchWhat = request.getParameter("searchWhat");
   //검색 내용
    String searchText = request.getParameter("searchText");

    // 파라미터를 가져와서 한글로 변환처리함
    if(searchText != null){
    	searchText = new String(searchText.getBytes("utf-8"), "utf-8");
    }


      if(pageNum == null) {
    	  pageNum="1";
      }
      
      int currentPage = Integer.parseInt(pageNum);
      
      int startRow = (currentPage -1 ) * pageSize + 1;
      int endRow  = currentPage * pageSize;
      
      
   int count = 0;
   int number = 0;
   
   List<BoardVO> articleList = null;
   BoardDAO dbPro = BoardDAO.getInstance();
   
   
   if(searchText == null){// 검색이 아닐때
             count = dbPro.getArticleCount();// 전체글 목록수
   
            if(count > 0){
	        //articleList = dbPro.getArticles();
	          articleList= dbPro.getArticles(startRow, endRow);
           }
   
   }else {// 검색일 경우
	   
	   count = dbPro.getArticleCount(searchWhat, searchText);
	   
       if(count > 0){
       //articleList = dbPro.getArticles();
       // 검색목록이 하나라도 존재한다면 검색 리스트출력
         articleList= dbPro.getArticles(searchWhat, searchText, startRow, endRow);
      }
	}
   
   //number = count;
   number = count- (currentPage -1 ) * pageSize ;
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link href="style.css" type="text/css" rel="stylesheet">
</head>
<body bgcolor="<%=boadyback_c%>">
<div align="center"><b>글목록(전체글:<%=count%>)</b>
<table width="700">
<tr>
     <td align="right" bgcolor="<%=value_c%>">
     <a href="writeForm.jsp">글쓰기</a></td>
</tr>
</table>
<%
  if(count == 0){// 글이 없을 경우
%>
<table width="700" border="1" cellpadding="0" cellspacing="0">
<tr>
   <td align="center">
       게시판에 저장된 글이 없습니다.
   </td>
</tr>
</table>
<%}  else {// 글이 있을 경우%>
<table width="700" border="1" cellpadding="0" 
cellspacing="0" align="center">

<tr height="30" bgcolor="<%=value_c%>">
    <td align="center" width="50">번호</td>
    <td align="center" width="250">제목</td>
    <td align="center" width="100">작성자</td>
    <td align="center" width="150">작성일</td>
    <td align="center" width="50">조회</td>
    <td align="center" width="100">IP</td>
</tr>
<%
     for(int i = 0; i < articleList.size(); i++){
         BoardVO article =( BoardVO)articleList.get(i);
%>
<tr height="30">
      <td align="center" width="50"><%=number-- %></td>
      
      <td width="250">
      <%
      int wid=0;
      if(article.getDepth() > 0){
            wid=5 * (article.getDepth());      
      %>
      <img src="img/level.gif" width="<%=wid%>" height="16">
      <img src="img/re.gif">
      <%} else { %>
      <img src="img/level.gif" width="<%=wid%>" height="16">
      <%} %>
      <a href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>">
      
      <%=article.getSubject() %></a>
     <% if(article.getReadcount() >= 5) { %>
     <img src="img/hot.gif" height="16" border="0">
     <%} %>
      </td>
      
      <td align="center" width="100">
            <a href="mailto:<%=article.getEmail()%>">
            <%=article.getWriter() %></a>
      </td>
      
     <td align="center" width="150">
          <%=sdf.format(article.getRegdate()) %>
     </td>
     
     <td align="center" width="50">
          <%=article.getReadcount() %>
     </td>
     
     <td align="center" width="100">
          <%=article.getIp()%>
     </td>
     
</tr>
<%} %>
</table>
<%} %>

<%-- 페이징 처리 --%>
<%
  if(count > 0) {
	  int pageBlock = 2;
	  int imsi = count % pageSize ==0 ? 0 : 1;
	  int pageCount = count / pageSize + imsi;
	  
	  int startPage =(int)((currentPage-1)/pageBlock) * pageBlock + 1;
	  int endPage = startPage + pageBlock - 1;
	  
	  if(endPage > pageCount) endPage = pageCount;
	  
	  
	  
	  
	  if(startPage  > pageBlock) {
		  // 검색일 경우와 아닐 경우 페이징 처리해야함
		   if(searchText == null) {
%>
   <a href="list.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a>
         <%} else { %>
   <a href="list.jsp?pageNum=<%=startPage-pageBlock%>&searchWhat=<%=searchWhat%>&searchText=<%=searchText%>">[이전]</a>
 <%
         }
	  }
	  for(int i = startPage; i <= endPage; i++){
		  if(searchText == null){// 검색이 아닐 경우
 %>
    <a href="list.jsp?pageNum=<%=i%>">[<%=i%>]</a> 
    <%}else {// 검색일 경우 %>
     <a href="list.jsp?pageNum=<%=i%>&searchWhat=<%=searchWhat%>&searchText=<%=searchText%>">[<%=i%>]</a>		  
  <%}
	 }
	  if(endPage < pageCount) {
		  if(searchText == null){// 검색이 아닐 경우
  %>		  
   <a href="list.jsp?pageNum=<%=startPage+pageBlock%>">[다음]</a>
   <%}else { // 검색일경우 %>
   <a href="list.jsp?pageNum=<%=startPage+pageBlock%>&searchWhat=<%=searchWhat%>&searchText=<%=searchText%>">[다음]</a>
   
<%	 
          }
	   }
	  
  }
%>

<!--  검색창 -->
<form action="list.jsp">

       <select name="searchWhat">
                <option value="writer">작성자</option>
                <option value="subject">제목</option>
                <option value="content">내용</option>
       </select>
       <input type="text" name="searchText">
       <input type="submit" value="검색">
</form>


</div>
</body>
</html>