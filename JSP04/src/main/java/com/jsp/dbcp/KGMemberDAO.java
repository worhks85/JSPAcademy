
package com.jsp.dbcp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class KGMemberDAO {
	private DataSource ds;
	// Datasource 객체는 Connection Pool을 관리 하는 객체
	// 이 객체는 JNDI (Java Naming & Directory Interface) API 를 통해서 사용된다.
	
	//JNDI는 이름을 가지고 객체를 얻을수 있는 API이다.
	
	public KGMemberDAO() {
		try {
			Context context = new InitialContext();
			// JNDI 서비스를 ㅈ공하는 객체를 생성한다.
			// 리소스가 로컬에 있을 경우 InitialCContext 객체를
			// 생성하는 것만으로 JNDI를 사용할 수 있다.
			
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
			// java:comp/env 는 톰켓에서 리소스를 관리하는 가상의 디렉토리 주소 이다.
			// jdbc/oracle : context.xml에 등록한 자원의 이름
			}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<KGMemberDTO> list(){
		ArrayList<KGMemberDTO> list = new ArrayList<KGMemberDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from KGMember";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				int age = rs.getInt("age"); 
				String ph = rs.getString("phone");

				list.add(new KGMemberDTO(id, pw, name, age, ph));
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				
			} catch (Exception e2) {}

			
		}
		return list;
		
	}
}
