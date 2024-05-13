package com.jdbc;

import java.sql.*;
import java.util.*;
import javax.sql.*;

import org.apache.catalina.webresources.Cache;
import javax.naming.*;

public class DBCPTempMember {
	DataSource ds;

	public DBCPTempMember() {
		try {
		Context initContext =new InitialContext();
		 ds =(DataSource)initContext.lookup(
				"java:/comp/env/jdbc/myoracle");	
	}catch(NamingException ne) {
		ne.printStackTrace();
	}
}
	public Vector<TempMemberVO> getMemberList() {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

		Vector<TempMemberVO> vecList =
		new Vector<TempMemberVO>();

		try {
		con = ds.getConnection();

		String sql ="select * from tempmember";

		stmt = con.createStatement();

		rs = stmt.executeQuery(sql);

		while(rs.next()) {
		TempMemberVO vo = new TempMemberVO();

		vo.setId(rs.getString("id"));
		vo.setPass(rs.getString("pass"));
		vo.setName(rs.getString("name"));
		vo.setMem_num1(rs.getString("mem_num1"));
		vo.setMem_num2(rs.getString("mem_num2"));
		vo.setEmail(rs.getString("e_mail"));
		vo.setPhone(rs.getString("phone"));
		vo.setZipcode(rs.getString("zipcode"));
		vo.setAddress(rs.getString("address"));
		vo.setJob(rs.getString("job"));
		vecList.add(vo);
		}
		}catch(Exception e) {
		e.printStackTrace();
		}finally {
		if(rs != null) try {rs.close();}catch(SQLException s){}
		    if(stmt != null) try {stmt.close();}catch(SQLException s){}
		    if(con != null) try {con.close();}catch(SQLException s){}
		}

		return vecList;
		}
}
