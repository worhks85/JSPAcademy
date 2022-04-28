package com.jsp.members;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MembersDAO {
	public MembersDAO() {}
	
	private static MembersDAO instance = new MembersDAO();
	public static MembersDAO getInstance() {
		return instance;
	}
	
	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	{
	try {
		Context context = new InitialContext();
		ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
	}catch (Exception e) {
		e.printStackTrace();
	}}
	
	// form에서 입력한 데이터를 DB에 넣어 주는 메소드
	
	public int insertMember(MembersDTO dto) {
		int res = 0;
		String query = "INSERT INTO members values (?,?,?,?,?,?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.setTimestamp(5, dto.getRegDate());
			pstmt.setString(6, dto.getAddress());
			res = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(conn);
		}
		return res;
	}
	// members 테이블에 같은 아이디가 있는지 확인하는 메소드
	// 같은 아이디가 있다면 1 반환 없다면 0반환
	public int confirmID(String id) {
		int res = 0;
		String query = "SELECT id FROM members where id = ?"  ;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs =pstmt.executeQuery();
			if(rs.next()) {
				res= 1;
			}else {
				res = 0;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
			close(conn);
		}		
		return res;
	}
	
	// id와 pw를 매개값으로 데이터를 받아 DB에 연결 후 입력받은 id로 pw데이터 얻어오기
	// 아이디가 존재하지 않는다면 -1 , 존재하고 비밀번호가 틀리다면 0
	// 존재하고 비밀번호가 맞다면 1
	public int userCheck(String id, String pw) {
		int res = -2;
		String dbPw;
		String query = "SELECT pw FROM members where id ="+id;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				res = 0;
				dbPw = rs.getString("pw");
				if ( pw == dbPw) {
					res = 1;
				}
			}else {
				res = -1;
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {}
		}
		
		return res;
	}
	
	// id를 매개값으로 받아 DB 연결 후 해당하는 id의 모든 컬럼의 데이터를 얻은 후
	// DTO객체에 셋팅하고 DTO 객체 리턴 해주는 메소드
	public MembersDTO getMember(String id) {
		MembersDTO dto =new MembersDTO();
		String query = "SELECT * FROM members where id = "+id;
		try {
			conn= ds.getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			if(rs.next()) {
			dto.setId(rs.getString("id"));
			dto.setPw(rs.getString("pw"));
			dto.setName(rs.getString("name"));
			dto.setEmail(rs.getString("email"));
			dto.setRegDate(rs.getTimestamp("regDate"));
			dto.setAddress(rs.getString("address"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				close(rs);
				close(pstmt);
				close(conn);
			} catch (Exception e2) {		}
		}
		return dto;
	}
	
	// DTO객체를 매개 값으로 받아 회원의 정보(pw,email,address)를 수정 해주는 메소드
	//-- update [테이블] set [컬럼] = [변경할 값] where [조건]
	public int updateMember(MembersDTO dto) {
		int res = 0;
		String query = "UPDATE members set pw = ? , email = ? , address = ? where id = " +dto.getId();
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getAddress());
			res = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
			close(conn);
		}
		return res;
	}
	
	private void close(Connection conn) {
		try {
			if(conn != null) conn.close();
			
		} catch (Exception e) {e.printStackTrace();}
		
	}
	private void close(PreparedStatement pstmt) {
		try {
			if(pstmt != null) pstmt.close();
			
		} catch (Exception e) {e.printStackTrace();}
		
	}
	private void close(ResultSet rs ) {
		try {
			if(rs != null) rs.close();
			
		} catch (Exception e) {e.printStackTrace();}
		
	}
}












