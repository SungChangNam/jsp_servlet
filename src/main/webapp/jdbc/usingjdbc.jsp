<%@ page contentType="text/html;charset=UTF-8" import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import ="java.sql.SQLException"%>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;

	String id = "", 
			pass = "", 
			 name = "", 
			mem_num1  = "", 
			  mem_num2 = "", 
			 email = "", 
		     phone = "", 
		     zipcode = "", 
		     address = "", 
		     job = "";
	int counter = 0;
	try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
	    con = DriverManager.getConnection(
                "jdbc:oracle:thin:@localhost:1521:orcl",
                "scott", "tiger");
	    stmt = con.createStatement();
	    rs = stmt.executeQuery("select * from tempmember");
%>
<html>
<head>
<title>JSP에서 데이터베이스 연동</title>
<link href="style.css" rel="stylesheet" type="text/csss">

</head>
<body bgcolor="#FFFFCC">
	<h2>JSP 스크립트에서 데이터베이스 연동 </h2><br/>
	<h3>회원정보</h3>
	<table bordercolor="#0000ff" border="1">
		<tr>
			<td><strong>ID</strong></td>
			<td><strong>PASS</strong></td>
			<td><strong>NAME</strong></td>
			<td><strong>MEM_NUM1</strong></td>
			<td><strong>MEM_NUM2</strong></td>
			<td><strong>EMAIL</strong></td>
			<td><strong>PHONE</strong></td>
			<td><strong>ZIPCODE/ADDRESS</strong></td>
			<td><strong>JOB</strong></td>
		</tr>
		<%
			if (rs != null) {

					while (rs.next()) {
						id = rs.getString("id");
						pass = rs.getString("pass");
						name = rs.getString("name");
						mem_num1 = rs.getString("mem_num1");
						mem_num2 = rs.getString("mem_num2");
						email = rs.getString("e_mail");
						phone = rs.getString("phone");
						zipcode = rs.getString("zipcode");
						address = rs.getString("address");
						job = rs.getString("job");
		%>
		<tr>
			<td><%=id%></td>
			<td><%=pass%></td>
			<td><%=name%></td>
			<td><%=mem_num1%></td>
			<td><%=mem_num2%></td>
			<td><%=email%></td>
			<td><%=phone%></td>
			<td><%=zipcode%>/<%=address%></td>
			<td><%=job%></td>
		</tr>
			<%
				counter++;
						}//end while
					}//end if
			%>
	</table>
	<br/>
	total records :<%=counter%>
	<%
    } catch (SQLException e) {
        e.printStackTrace();
    } catch (ClassNotFoundException ce) {
        ce.printStackTrace();
		} finally {
			if (rs != null)
				try {rs.close();} 
				catch (SQLException ex) {}
			if (stmt != null)
				try {stmt.close();} 
				catch (SQLException ex) {}
			if (con != null)
				try {con.close();} 
				catch (Exception ex) {}
		}
	%>
	
	</table>
	</body>