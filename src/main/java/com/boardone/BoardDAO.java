package com.boardone;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {

	private static BoardDAO instance = null;
	
	private BoardDAO() {	}

	public static BoardDAO getInstance() {
		
		if(instance == null) {
			synchronized (BoardDAO.class) {
				instance = new BoardDAO();
			}
		}
		return instance;
	}
	
	// 게시판 작업의 기능 하나하나를 이곳 아래에서 부터 차례로 구현하면됨
	
	// 실제 데이터베이스에 글을 추가하는 메소드 구현
	public void insertArticle(BoardVO article) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int num = article.getNum();
		int ref  =article.getRef();
		int step = article.getStep();
		int depth = article.getDepth();
		
		int number = 0;
		String sql1="select max(num) from board";
		String sql2="";
		
		try {
			con = ConnUtil.getConnection();
			pstmt =con.prepareStatement(sql1);
			rs =pstmt.executeQuery();
			
			if(rs.next()) number =rs.getInt(1)+1;
			else number = 1;
			
			if(num != 0) {// 답변글 일 경우
				sql2 = "update board set step=step+1 where ref=? and step > ?";
				pstmt =con.prepareStatement(sql2);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, step);
				
				pstmt.executeUpdate();
				step = step +1;
				depth = depth+1;
					
			}else {// 새글일 경우
				ref =number;
				step = 0;
				depth = 0;
			}
			
	    String sql3="insert into board(num, writer, email, subject, "
			+ "pass, regdate, ref, step, depth, content, ip) "
			+ "values(board_seq.nextval, ?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql3);
			
			pstmt.setString(1, article.getWriter());
			pstmt.setString(2, article.getEmail());
			pstmt.setString(3, article.getSubject());
			pstmt.setString(4, article.getPass());
			pstmt.setTimestamp(5, article.getRegdate());
			pstmt.setInt(6, ref);
			pstmt.setInt(7, step);
			pstmt.setInt(8, depth);
			pstmt.setString(9, article.getContent());
			pstmt.setString(10, article.getIp());
			
			pstmt.executeUpdate();
		}catch(SQLException ss) {
			ss.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException s){}
	    	 if(pstmt != null) try {pstmt.close();}catch(SQLException s){}
	    	 if(con != null) try {con.close();}catch(SQLException s){}
		}
	}// end insertArticle
	
	/*
	 * 글을 추가한 후 리다이렉트로 리스트 페이지를 보여줌
	 * 전체 글의 개수를 가져와서 목록을 보여줘야함
	 */
	
	public int getArticleCount() {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x =0;
		
		try {
			con = ConnUtil.getConnection();
			String sql ="select count(*) from board";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);
			}
			
		}catch(SQLException ss) {
			ss.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException s){}
	    	 if(pstmt != null) try {pstmt.close();}catch(SQLException s){}
	    	 if(con != null) try {con.close();}catch(SQLException s){}
		}
	
		return x;
	
	}//end getArticleCount
	
	/*
	 *   board테이블에서 데이터를 가져와서 목록을 보여줄 메소드 구현
	 *  
	 *    start : 시작번호,  end :  끝번호
	 */
	public List<BoardVO> getArticles(int start, int end){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<BoardVO> articleList = null;
		
		try {
			con = ConnUtil.getConnection();
			/*
			pstmt=con.prepareStatement(
					"select * from board order by num desc");
			*/
			String sql="select * from (select rownum rnum, num, writer, "
					+ "email, subject, pass, regdate, readcount, ref, step, depth, "
					+ "content, ip from (select * from board order by ref desc,"
					+ " step asc)) where rnum >=? and rnum <= ?";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				articleList = new ArrayList<BoardVO>(end-start+1);
				do {
					BoardVO article = new BoardVO();
					article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("writer"));
					article.setEmail(rs.getString("email"));
					article.setSubject(rs.getString("subject"));
					article.setPass(rs.getString("pass"));
					article.setRegdate(rs.getTimestamp("regdate"));
					article.setReadcount(rs.getInt("readcount"));
					article.setRef(rs.getInt("ref"));
					article.setStep(rs.getInt("step"));
					article.setDepth(rs.getInt("depth"));
					article.setContent(rs.getString("content"));
					article.setIp(rs.getString("ip"));
					articleList.add(article);
					
				}while(rs.next());
				
			}
			
		}catch(SQLException ss) {
			ss.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException s){}
	    	 if(pstmt != null) try {pstmt.close();}catch(SQLException s){}
	    	 if(con != null) try {con.close();}catch(SQLException s){}
		}
		
		return articleList;
		
	}// end getArticles()
	
	/*  글 상세보기
	 *   글 제목을 누르면 글 상세보기를 할 수 있다.
	 *    글의 번호를 매개변수로 해서 하나의 글에대한 세보정보를 가져오는
	 *    메소드를 구현
	 */
	public BoardVO getArticle(int num) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardVO article = null;
		
		try {
			con = ConnUtil.getConnection();
			
			String sql1 ="update board set readcount=readcount+1 where num=?";// 조회수 증가
			
			pstmt = con.prepareStatement(sql1);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			String sql2 ="select * from board where num=?";
			
			pstmt = con.prepareStatement(sql2);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				article = new BoardVO();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setEmail(rs.getString("email"));
				article.setSubject(rs.getString("subject"));
				article.setPass(rs.getString("pass"));
				article.setRegdate(rs.getTimestamp("regdate"));
				article.setReadcount(rs.getInt("readcount"));
				article.setRef(rs.getInt("ref"));
				article.setStep(rs.getInt("step"));
				article.setDepth(rs.getInt("depth"));
				article.setContent(rs.getString("content"));
				article.setIp(rs.getString("ip"));
			}
		}catch(SQLException ss) {
			ss.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException s){}
	    	 if(pstmt != null) try {pstmt.close();}catch(SQLException s){}
	    	 if(con != null) try {con.close();}catch(SQLException s){}
		}
		
		return article;
	}// end getArticle
	
	
	public BoardVO updateGetArticle(int num) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardVO article = null;
		
		try {
			
			con = ConnUtil.getConnection();
             String sql ="select * from board where num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				article = new BoardVO();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setEmail(rs.getString("email"));
				article.setSubject(rs.getString("subject"));
				article.setPass(rs.getString("pass"));
				article.setRegdate(rs.getTimestamp("regdate"));
				article.setReadcount(rs.getInt("readcount"));
				article.setRef(rs.getInt("ref"));
				article.setStep(rs.getInt("step"));
				article.setDepth(rs.getInt("depth"));
				article.setContent(rs.getString("content"));
				article.setIp(rs.getString("ip"));
			}
			
			
		}catch(SQLException ss) {
			ss.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException s){}
	    	 if(pstmt != null) try {pstmt.close();}catch(SQLException s){}
	    	 if(con != null) try {con.close();}catch(SQLException s){}
		}
		
		return article;
	}
	
	// 데이터베이스에서 실제 글이 수정되어야함
	public int updateArticle(BoardVO article) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd="";
		String sql1="";
		String sql2="";
		int result = -1;
		
		try {
		
			con = ConnUtil.getConnection();
			sql1 ="select pass from board where num=?";
			pstmt=con.prepareStatement(sql1);
			pstmt.setInt(1, article.getNum());
			rs =pstmt.executeQuery();
			
			if(rs.next()) {
				
				dbpasswd = rs.getString("pass");
				if(dbpasswd.equals(article.getPass())) {
					sql2 ="update board set writer=?, email=?, "
							+ "subject=?, content=? where num=?";
					
					pstmt = con.prepareStatement(sql2);
					pstmt.setString(1, article.getWriter());
					pstmt.setString(2,article.getEmail());
					pstmt.setString(3,article.getSubject());
					pstmt.setString(4,article.getContent());
					pstmt.setInt(5,article.getNum());
					pstmt.executeUpdate();
					
					result =1;
				}else {
					result = 0;
				}
		  }
			
		}catch(SQLException ss) {
			ss.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException s){}
	    	 if(pstmt != null) try {pstmt.close();}catch(SQLException s){}
	    	 if(con != null) try {con.close();}catch(SQLException s){}
		}
		
		return result;
	}//end updateArticle
	
	public int deleteArticle(int num, String pass) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String dbpasswd="";
		String sql1="";
		String sql2="";
		int result = -1;
		
		try {
			con = ConnUtil.getConnection();
			sql1 ="select pass from board where num=?";
			pstmt=con.prepareStatement(sql1);
			pstmt.setInt(1, num);
			rs =pstmt.executeQuery();
			
			if(rs.next()) {
				
				dbpasswd = rs.getString("pass");
				
				if(dbpasswd.equals(pass)) {
					sql2="delete from board where num=?";
					pstmt = con.prepareStatement(sql2);
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
					
					result = 1;	// 글삭제 성공				
				}else {
					result = 0;// 비밀번호 오류
				}
			}
		}catch(SQLException ss) {
			ss.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException s){}
	    	 if(pstmt != null) try {pstmt.close();}catch(SQLException s){}
	    	 if(con != null) try {con.close();}catch(SQLException s){}
		}
		
		return result;
	}// end deleteArticle
	
// 검색한 내용이 몇 개 있는지를 반환함(what:검색조건, content:검색내용)	
public int getArticleCount(String what, String content) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x =0;
		
		try {
			con = ConnUtil.getConnection();
			//String sql ="select count(*) from board";
			String sql ="select count(*) from board where "+what+" like '%"+content+"%'";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);
			}
			
		}catch(SQLException ss) {
			ss.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException s){}
	    	 if(pstmt != null) try {pstmt.close();}catch(SQLException s){}
	    	 if(con != null) try {con.close();}catch(SQLException s){}
		}
	
		return x;
	
	}//end getArticleCount
	

/*
 *  검색한 내용을 리스트로 받아옴(조건, 내용, 시작번호, 끝번호)
 *
 */


public List<BoardVO> getArticles(String what, String content, int start, int end){
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	List<BoardVO> articleList = null;
	
	try {
		con = ConnUtil.getConnection();
		/*
		pstmt=con.prepareStatement(
				"select * from board order by num desc");
		*/
		/*
		String sql="select * from (select rownum rnum, num, writer, "
				+ "email, subject, pass, regdate, readcount, ref, step, depth, "
				+ "content, ip from (select * from board order by ref desc,"
				+ " step asc)) where rnum >=? and rnum <= ?";
		*/
		String sql="select * from (select rownum rnum, num, writer, "
				+ "email, subject, pass, regdate, readcount, ref, step, depth, "
				+ "content, ip from (select * from board  where "+what+" like   '%"+content+"%' order by ref desc,"
				+ " step asc)) where rnum >=? and rnum <= ?";
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, start);
		pstmt.setInt(2, end);
		
		
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			articleList = new ArrayList<BoardVO>(5);
			do {
				BoardVO article = new BoardVO();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setEmail(rs.getString("email"));
				article.setSubject(rs.getString("subject"));
				article.setPass(rs.getString("pass"));
				article.setRegdate(rs.getTimestamp("regdate"));
				article.setReadcount(rs.getInt("readcount"));
				article.setRef(rs.getInt("ref"));
				article.setStep(rs.getInt("step"));
				article.setDepth(rs.getInt("depth"));
				article.setContent(rs.getString("content"));
				article.setIp(rs.getString("ip"));
				articleList.add(article);
				
			}while(rs.next());
			
		}
		
	}catch(SQLException ss) {
		ss.printStackTrace();
	}finally {
		if(rs != null) try {rs.close();}catch(SQLException s){}
    	 if(pstmt != null) try {pstmt.close();}catch(SQLException s){}
    	 if(con != null) try {con.close();}catch(SQLException s){}
	}
	
	return articleList;
	
}// end getArticles()
	
}