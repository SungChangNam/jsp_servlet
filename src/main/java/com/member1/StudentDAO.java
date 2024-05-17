package com.member1;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import java.util.*;

public class StudentDAO {
	
	private Connection getConnection() {
		Connection con =null;
		try {
			Context initContext =new InitialContext();
			DataSource	 ds =(DataSource)initContext.lookup(
					"java:/comp/env/jdbc/myoracle");	
			con =ds.getConnection();
		} catch ( Exception e) {
			System.out.println("Connection 생성 실패");
		}
		return con;
	}// 데이터베이스 연결 메소드
	 // 아이디 중복 체크 구현
	
		public boolean idCheck(String id) {
			boolean result = true;
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
		
			
			try {
				con =getConnection();
				String sql="select * from student where id=?";
				pstmt= con.prepareStatement(sql);
				pstmt.setString(1, id);
				
				rs =pstmt.executeQuery();
					
				if(!rs.next() ) 
					result =false;
				
			} catch (SQLException ss) {
			ss.printStackTrace();
			}finally {
				if(rs != null) try {rs.close();}catch(SQLException s){}
			    if(pstmt != null) try {pstmt.close();}catch(SQLException s){}
			    if(con != null) try {con.close();}catch(SQLException s){}
			}
			
			return result ;
		}//end idCheck
		/*
		 *  우편번로를 데이터베이스에서 검색해서Vector에 저장하며 리턴해주는 메소드 구현
		 * */
		
		public Vector<ZipcodeVO> zipcodeRead(String dong){
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			Vector<ZipcodeVO> vecList = new Vector<ZipcodeVO>();
			
			try {
				con =getConnection();
				String sql="select * from zipcode where dong like '"+dong+"%'";
				pstmt= con.prepareStatement(sql);
				rs =pstmt.executeQuery();
				
				while(rs.next()) {
					
				ZipcodeVO  tempZicode = new ZipcodeVO();
				tempZicode.setZipcode(rs.getString("zipcode"));
				tempZicode.setSido(rs.getString("sido"));
				tempZicode.setGugun(rs.getString("gugun"));
				tempZicode.setDong(rs.getString("dong"));
				tempZicode.setRi(rs.getString("ri"));
				tempZicode.setBunji(rs.getString("bunji"));
				
				vecList.addElement(tempZicode);
				}
				
				
				}catch (SQLException ss) {
					ss.printStackTrace();
				}finally {
					if(rs != null) try {rs.close();}catch(SQLException s){}
				    if(pstmt != null) try {pstmt.close();}catch(SQLException s){}
				    if(con != null) try {con.close();}catch(SQLException s){}
				}
				return vecList;
			} 
		/*
		 * 실제로 데이터베이스에 회원정보데이터를 저장하여
		 * 메소드로 기능을 구현함
		 * */
		
		public boolean memberInsert(StudentVO vo) {
			Connection con = null;
			PreparedStatement pstmt = null;
			boolean flag= false;
			
			try {
				con =getConnection();
				String sql="insert into student  values(?,?,?,?,?,?,?,?,?,?)";
				pstmt= con.prepareStatement(sql);
				
				pstmt.setString(1, vo.getId());
				pstmt.setString(2, vo.getPass());
				pstmt.setString(3, vo.getName());
				pstmt.setString(4, vo.getPhone1());
				pstmt.setString(5, vo.getPhone2());
				pstmt.setString(6, vo.getPhone3());
				pstmt.setString(7, vo.getEmail());
				pstmt.setString(8, vo.getZipcode());
				pstmt.setString(9, vo.getAddress1());
				pstmt.setString(10, vo.getAddress2());
				
				
				
				
				int count =pstmt.executeUpdate();
				if(count >0) flag=true;
				
			} catch (SQLException ss) {
				ss.printStackTrace();
			}finally {
	
			    if(pstmt != null) try {pstmt.close();}catch(SQLException s){}
			    if(con != null) try {con.close();}catch(SQLException s){}
			}
			return flag;
		}//end membereInsert
		/*
		 * 로그인 버튼을 클릭하면 우리가 입력한 id/pass	를 데이터 베이스에서 가져와서
		 * 비교해서 같으면 로그인성공, 다르면 로그인 실패 처리해야함
		 * 
		 * 데이터베이스에서 아이디와 비밀번호를 비교한 결과를 정수형으로 리턴해주는
		 * 메소드를 구현함
		 * 1: 로그인 성공, 0:비밀번호 틀림, -1: 아이디가 존재하지 않음
		 * 
		 * */
		
		 public int loginCheck(String id, String pass) {
			 
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				int check =  -1;

				try {
					
					con =getConnection();
					
					String sql = "select pass from student where id=? ";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, id);
					rs =pstmt.executeQuery();
					
					if(rs.next()) {// 아이디로 비밀번호를 조회했다.
						String dbpass = rs.getString("pass");
						if (pass.equals(dbpass)) check =1;
						else check=0;
					}
					
				} catch (SQLException ss) {
					ss.printStackTrace();
				}finally {
					if(rs != null) try {rs.close();}catch(SQLException s){}
				    if(pstmt != null) try {pstmt.close();}catch(SQLException s){}
				    if(con != null) try {con.close();}catch(SQLException s){}
				}
				return check;
			 
		 } //end loginchek
		 
		 /*
		  * 로그인 회원정보를 수정하기 위해서는 회원정보를 데이터베이스에서
		  * 가져와야함
		  * */
		 public StudentVO getMember(String id) {
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				StudentVO vo =null;
				
				try {
				con =getConnection();
				String sql = "select * from student where id=? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs =pstmt.executeQuery();
					
				if (rs.next()) {//조회한 아이디에 해당하는 회원정보가 존재한다면
					vo=new StudentVO();
					vo.setId(rs.getString("id"));
					vo.setPass(rs.getString("pass"));
					vo.setName(rs.getString("name"));
					vo.setPhone1(rs.getString("phone1"));
					vo.setPhone2(rs.getString("phone2"));
					vo.setPhone3(rs.getString("phone3"));
					vo.setEmail(rs.getString("email"));
					vo.setZipcode(rs.getString("zipcode"));
					vo.setAddress1(rs.getString("address1"));
					vo.setAddress2(rs.getString("address2"));
					
	
					
				}
				} catch (SQLException ss) {
					ss.printStackTrace();
				}finally {
					if(rs != null) try {rs.close();}catch(SQLException s){}
				    if(pstmt != null) try {pstmt.close();}catch(SQLException s){}
				    if(con != null) try {con.close();}catch(SQLException s){}
				}
				return vo;
				
		 }//end getMember
		 
		public void updateMember(StudentVO vo ) {
			Connection con = null;
			PreparedStatement pstmt = null;
	
			try {
				con =getConnection();
				String sql = "update student set pass=?,phone1=?,phone2=?, "
						+"phone3=?,email=?,zipcode=?,address1=?, "
						+ "address2=?  where id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, vo.getPass());
				pstmt.setString(2, vo.getPhone1());
				pstmt.setString(3, vo.getPhone2());
				pstmt.setString(4, vo.getPhone3());
				pstmt.setString(5, vo.getEmail());
				pstmt.setString(6, vo.getZipcode());
				pstmt.setString(7, vo.getAddress1());
				pstmt.setString(8, vo.getAddress2());
				pstmt.setString(9, vo.getId());
				pstmt.executeUpdate();
			
				
				
			} catch (SQLException ss) {
				ss.printStackTrace();
			}finally {
			    if(pstmt != null) try {pstmt.close();}catch(SQLException s){}
			    if(con != null) try {con.close();}catch(SQLException s){}
			}
			
		}//end updateMember
		
		/*
		 * deleteForm 에서 탈퇴버튼을 클릭하면 실제 데이터베이스에서
		 * 회원정보를 삭제해야함
		 * 
		 * */
		public int deleteMember(String id, String pass) {
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String dbPass =""; // 데이터베이스에 저장된 패스워드를 저장하는 변수
			int result = -1;// 아이디가 존재하지 않음
			
			try {
				
				con = getConnection();
				String sql1="select pass from student where id=?";
				pstmt = con.prepareStatement(sql1);
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					dbPass = rs.getString("pass");
					if(dbPass.equals(pass)) {// 본인확인 여부
						// 비밀번호가 일치하면 삭제 처리함
						String sql2 ="delete from student where id=?";
						pstmt= con.prepareStatement(sql2);
						pstmt.setString(1, id);
						pstmt.executeUpdate();
						result = 1; // 회원탈퇴 성공
						
					}else {// 본인 확인 실패
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
		}// end deleteMember
}
