<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
    
    <%
    	 String realFolder ="";
    	 String saveFolder="upload";
    	 String encType="utf-8";
    	 int maxSize= 10 *1024 *1024;
    
    ServletContext context = getServletContext();
    realFolder = context.getRealPath(saveFolder);
    
    ArrayList saveFiles =new ArrayList();
    ArrayList origFiles =new ArrayList();
    
    
    String paramUser = "";
    String paramTitle ="";
    String paramAbstract ="";
    
    
    try{
    	MultipartRequest mulit =new MultipartRequest(
    			request, realFolder, maxSize ,encType, new DefaultFileRenamePolicy());
    	
    	paramUser =mulit.getParameter("txtUser");
    	paramTitle =mulit.getParameter("txtTitle");
    	paramAbstract =mulit.getParameter("txtAbstract");
    	
    	Enumeration files =mulit.getFileNames();
    	while(files.hasMoreElements()){
    		String name =(String)files.nextElement();
    		saveFiles.add(mulit.getFilesystemName(name));
    		origFiles.add(mulit.getOriginalFileName(name));
    		
    	}
 
   
    %>
    
    

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Files Info</title>
</head>
<body>
		<table width="75%" border="1" align="center" cellpadding="1"
			cellspacing="1" bordercolor="#660000" bgcolor="#FFFF99">
		
			<tr>
			<td width="10%" bgcolor="#ffcc00">
				<div align="right" > <strong>paramUser</strong></div>
				</td>
				<td width="30%" ><%=paramUser%></td>
				
				<td width="10%" bgcolor="#ffcc00">
				<div align="right" ><strong>title</strong></div>
				</td>
				<td width="30%"><%=paramTitle%></td>
					
			</tr>
			
			<tr>
				<td width="10%" bgcolor="#ffcc00">
				<div align="right" > <strong>Abstract</strong></div>
				</td>
				<td width="50%" colspan="3">
				<textarea rows="5" cols="50"><%=paramAbstract %></textarea>
				</td>	
				

			</tr>
			
			<tr>
			<td colspan="4" bgcolor="#ffffff">&nbsp;</td></tr>
			<td colspan="4" ><strong>업로드된 파일.</strong></td></tr>
			
			
			<%for(int i =0; i<saveFiles.size(); i++){ %>
			<tr bgcolor="#ffcc00">
				<td colspan="4">
				<a href="<%="/"+saveFolder+"/"+saveFiles.get(i)%>">
				<strong><%=origFiles.get(i) %></strong></a>
				</td>
		
			</tr>
			
			<%} %>
			</table>

</body>
</html>
<%   }catch(IOException io){
		io.printStackTrace();
}catch(Exception e){
	e.printStackTrace();
}
%>