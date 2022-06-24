package info;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class InfoDao {

	public InfoDao() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			System.out.println("드라이버클래스 로딩 성공!");


		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public void insertInfo(InfoVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO INFO(INFO_NO, info_id, info_pw,INfo_NIck) ");
		sql.append("VALUES (SEQ_INFO.NEXTVAL, ?, ?, ?)");
		System.out.println("sql : " +sql.toString());
		try {
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "C##springuser";
			String password = "1234";
			conn = DriverManager.getConnection(url,user,password);
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, vo.getInfoId());
			pstmt.setString(2, vo.getInfoPw());
			pstmt.setString(3, vo.getInfoNick());
			pstmt.executeUpdate();
			System.out.println("등록완료");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) {	try {	pstmt.close();	} catch (SQLException e) {	e.printStackTrace();}
			if(conn != null) {	try {	conn.close();	} catch (SQLException e) {	e.printStackTrace();}
			}
			}

		}

	}
	
	public InfoVo SelectOne(String infoId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		InfoVo vo = null;
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT INFO_ID, INFO_PW FROM INFO WHERE INFO_ID = ?");
		System.out.println("sql : " +sql.toString());
		try {
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "C##springuser";
			String password = "1234";
			conn = DriverManager.getConnection(url,user,password);
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, infoId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new InfoVo(rs.getString(1), rs.getString(2),"");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) {	try {	pstmt.close();	} catch (SQLException e) {	e.printStackTrace();}}

			if(conn != null) {	try {	conn.close();	} catch (SQLException e) {	e.printStackTrace();}}
			if(rs != null) {	try {	rs.close();	} catch (SQLException e) {	e.printStackTrace();}}
			}
		return vo;
			}

	

	}
	
