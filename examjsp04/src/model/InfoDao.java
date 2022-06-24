package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class InfoDao {

	public InfoDao() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			System.out.println("드라이버 클래스 로딩 성공!");
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public void insertInfo(InfoVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO INFO(INFO_NO, INFO_ID, INFO_PW, INFO_NICK) ");
		sql.append("VALUES (SEQ_INFO.NEXTVAL, ? ,? ,?)");
		System.out.println("sql:" + sql.toString());
		try {
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "c##springuser";
			String password = "1234";
			conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, vo.getInfoId());
			pstmt.setString(2, vo.getInfoPw());
			pstmt.setString(3, vo.getInfoNick());
			pstmt.executeUpdate();
			System.out.println("등록 완료!");
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) {
				try { 
					pstmt.close(); 
				} catch(SQLException e) { 
					e.printStackTrace(); 
				}
			}
			if(conn != null) {
				try { 
					conn.close(); 
				} catch(SQLException e) { 
					e.printStackTrace(); 
				}
			}
		}
	}
	
	public InfoVo selectOne(String infoId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		InfoVo result = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT INFO_ID, INFO_PW FROM INFO WHERE INFO_ID=?");
		System.out.println("sql:" + sql.toString());
		try {
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "c##springuser";
			String password = "1234";
			conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, infoId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = new InfoVo(rs.getString(1), rs.getString("INFO_PW"), "");
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {
				try { 
					rs.close(); 
				} catch(SQLException e) { 
					e.printStackTrace(); 
				}
			}
			if(pstmt != null) {
				try { 
					pstmt.close(); 
				} catch(SQLException e) { 
					e.printStackTrace(); 
				}
			}
			if(conn != null) {
				try { 
					conn.close(); 
				} catch(SQLException e) { 
					e.printStackTrace(); 
				}
			}
		}
		return result;
	}
	
}





