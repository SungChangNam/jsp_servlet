package com.boardone;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;



public class ConnUtil {

	private static DataSource ds;
	
		static {
			try {
				Context initContext =new InitialContext();
				ds =(DataSource)initContext.lookup(
						"java:/comp/env/jdbc/myoracle");	
	
			} catch (NamingException ne) {

				ne.printStackTrace();
			}
		}
		
		public static Connection getConnection() throws SQLException{
			return ds.getConnection();
		}
		
}
