	package com.actiontag;
	
	import java.sql.*;
	
	public class StudentManager {
	
	    private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:orcl"; // 또는 jdbc:oracle:thin:@//localhost:1521/ORCL
	    private static final String DB_USER = "scott";
	    private static final String DB_PASSWORD = "tiger";
	
	    public static void main(String[] args) {
	        try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD)) {
	            // JDBC 드라이버 로드
	            Class.forName("oracle.jdbc.OracleDriver");

	            // 테이블 존재 여부 확인
	            if (!tableExists(conn, "students")) {
	                // 테이블 생성
	                createTable(conn);
	            }

	            // 데이터 삽입
	            insertStudent(conn, "홍길동", "0112013", "컴퓨터공학");
	            insertStudent(conn, "김유진", "1014011", "제어계측공학");
	            insertStudent(conn, "이순신", "0794012", "생명공학");

	            // 데이터 조회
	            System.out.println("\n--- 학생 정보 ---");
	            selectStudents(conn);

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    private static boolean tableExists(Connection conn, String tableName) throws SQLException {
	        DatabaseMetaData meta = conn.getMetaData();
	        ResultSet resultSet = meta.getTables(null, null, tableName.toUpperCase(), null);
	        return resultSet.next();
	    }
	    
	    
	    private static void createTable(Connection conn) throws SQLException {
	        String sql = "CREATE TABLE students (" +
	                     "    이름 VARCHAR(50) NOT NULL," +
	                     "    학번 VARCHAR(20) PRIMARY KEY," +
	                     "    학과 VARCHAR(50)" +
	                     ")";
	        try (Statement stmt = conn.createStatement()) {
	            stmt.executeUpdate(sql);
	        }
	    }
	
	    private static void insertStudent(Connection conn, String name, String id, String dept) throws SQLException {
	        String sql = "INSERT INTO students (이름, 학번, 학과) VALUES (?, ?, ?)";
	        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	            pstmt.setString(1, name);
	            pstmt.setString(2, id);
	            pstmt.setString(3, dept);
	            pstmt.executeUpdate();
	        }
	    }
	
	    private static void selectStudents(Connection conn) throws SQLException {
	        String sql = "SELECT * FROM students";
	        try (Statement stmt = conn.createStatement();
	             ResultSet rs = stmt.executeQuery(sql)) {
	            while (rs.next()) {
	                String name = rs.getString("이름");
	                String id = rs.getString("학번");
	                String dept = rs.getString("학과");
	                System.out.println(name + " | " + id + " | " + dept);
	            }
	        }
	    }
	}
	
