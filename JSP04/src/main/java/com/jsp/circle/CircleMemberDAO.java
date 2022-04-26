package com.jsp.circle;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CircleMemberDAO {
	// DAO : 데이터 베이스의 데이터에 접근하기 위한 객체 data access object
	
	// 싱글톤 : 단 하나의 객체만 생성하는 거
	// 싱글톤을 만들려면 클래스 외부에서 new 연산자로 생성자를 호출할 수 없도록 한다.
	// 외부에서 생성자 노출을 막기위해 private를 붙여준다.
	// 외부에서 객체를 얻는 방법은 정적메소드를 호출하는 방법으로 한다.(getInstance 메소드)
	// getInstance 메소드는 단 하나의 객체만 반환한다.
	
	// 싱글톤을 쓰는이유
	// 고정된 메모리 영역을 얻으면서 한번의 new로 인스턴스를
	// 사용하기 때문에 메모리 낭비를 방지할 수있따.
	// 전역 인스턴스이기 때문에 다른 클래스의 인스턴스들이 데이터를 공유하기 쉬바.
	// DBCP 처럼 공통된 객체를 여러개 생성해서 사용하는 상황에 많이 사용한다.
	private CircleMemberDAO(){
		
	}
	private static CircleMemberDAO instance = new CircleMemberDAO();
	
	
	public static CircleMemberDAO getInstance() {
		return instance;
	}
	// 회원 가입 후에 해당 데이터를 DB에 넣어주는 메소드
	public int insertCircle(CircleMemberDTO dto) {
		int result = 0;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		// 자바에서 데이터베이스를 쿼리문을 전송할때 사용할수 있는인터페이스는
		// statement와 PreparedStatement 2가지가 있다.
		// PreparedSTatement는 Statement를 상속받은인터페이스
		// 1. Statement 클래스의 기능 향상(여러버 ㄴ수행할 때 빠른 속도)
		// 2. 코드안정성과 가독성이 높음.
		String driver = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String uid = "C##JK";
		String upw = "jsp123";
		String query = "insert into circleMember values (?,?,?,?)";
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,uid,upw);
			psmt = conn.prepareStatement(query);
			psmt.setString(1,dto.getName());
			psmt.setInt(2,dto.getAge());
			psmt.setString(3,dto.getPhone());
			psmt.setString(4,dto.getEmail());
			result = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try{
				if(psmt != null) psmt.close();
				if(conn != null) conn.close();
			}catch (Exception e) {}
		}
		
		return result;
	}
	// 회원의 목록을 모두 가져와서 ArrayList<CircleMemberDTO>에 넣은후
	// 목록을 ArrayList를 반환해주는 메소드
	
	
	public ArrayList<CircleMemberDTO> circleList(){
		ArrayList<CircleMemberDTO> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String driver = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String uid = "C##JK";
		String upw = "jsp123";
		String query = "SELECT * FROM circleMember";
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,uid,upw);
			psmt = conn.prepareStatement(query);
			rs = psmt.executeQuery();
		
			while (rs.next()) {
				String name = rs.getString("name");
				int age = rs.getInt("age");
				String phone = rs.getString("phone");
				String email = rs.getString("email");
				list.add(new CircleMemberDTO(name, age,phone, email));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if ( rs != null) rs.close();
				if ( psmt != null) psmt.close();
				if ( conn != null) conn.close();
			} catch (Exception e2) {}
		}
		
		return list;
	}
	
}
