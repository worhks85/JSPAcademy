package com.jsp.memo;

import java.sql.*;
import java.util.ArrayList;

public class MemoDAO {

	//싱글톤 패턴으로 해보기
	
	private MemoDAO() {}
	private static MemoDAO instance = new MemoDAO();
	public static MemoDAO getInstance() {
		return instance;
	}
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs ;
	
	private String driver = "oracle.jdbc.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String uid = "C##JK";
	private String upw = "jsp123";
	
	// 닉네임, 메모내용, 메모 작성일을 매개변수로 받아 데이터 넣는 메소드
	public int insertMemo(String nickName, String contents, Timestamp regTime) {
		int res = 0;
		String query = "INSERT INTO memo (memoID,nickName,contents,regTime)"
				+ "values (memo_seq.nextval, ?,?,?)";
		// nextval : 해당 시퀀스의 값을 증가
		// currval : 현재 시퀀스의 값을 얻기
		
		try {
			Class.forName(driver);
			conn =DriverManager.getConnection(url,uid,upw);
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, nickName);
			pstmt.setString(2, contents);
			pstmt.setTimestamp(3,regTime);
			
			res = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				
			} catch (Exception e2) {}
		}
		
		return res;
	}
	
	// DB에서 memo 테이블의 데이터를 얻고 ArrayList<MemoDTO> 에 저장 후
	// ArrayList<MemoDTO> 객체 반환하는 메소드
	public ArrayList<MemoDTO> getList(){
		ArrayList<MemoDTO> list = new ArrayList<>();
		String query = "SELECT * FROM memo order by memoID DESC";
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,uid,upw);
			pstmt = conn.prepareStatement(query);
			rs =pstmt.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("memoID");
				String name = rs.getString("nickName");
				String contents = rs.getString("contents");
				Timestamp ts = rs.getTimestamp("regTime");
				list.add(new MemoDTO(id, name, contents, ts));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if( rs != null ) { rs.close();}
				if( pstmt != null ) { pstmt.close();}
				if( conn != null ) { conn.close();}
				
			} catch (Exception e2) {		}
		}
		
		return list;
	}
	// memoID를 매개변수로 받아 해당 행을 삭제하는 메소드
	
	public void delMemo(int id) {
		String query = "DELETE FROM memo where memoID = ?";
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,uid,upw);
			pstmt =conn.prepareCall(query);
			pstmt.setInt(1, id);
			int res = pstmt.executeUpdate();
			if (res == 1 ) {
				System.out.println("삭제가 완료 되었습니다.");
			}else {
				System.out.println("삭제가 실패 했습니다.");
			}
			
		
		
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if( pstmt != null )  pstmt.close();
				if( conn != null )  conn.close();
			} catch (Exception e2) {}
		}
		
	}
	
	
	
	
	
	
}
