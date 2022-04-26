<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%!
		Connection conn;
		//Connection : DB와 연결성을 갖는 인터페이스
		
		Statement stmt;
		//Statement : SQL문을 실행하는 인터페이스
		
		ResultSet rs;
		//ResultSet : 조회결과 데이터를 갖는 인터페이스
		
		String driver = "oracle.jdbc.OracleDriver";
		// OracleDriver : JDBC 드라이버 클래스
		// 자바응용 프로그램에서 데이터베이스에 접속하려면
		// 드라이버를 프로그램에 등록하는 코드를 제공해야한다.
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String uid= "C##JK";
		String upw= "jsp123";
		
		String query = "select * from KGMember";
		
	%>
	<%
		try{
			Class.forName(driver);
			//OracleDriver 클래스를 메모리에 로딩
			conn = DriverManager.getConnection(url,uid,upw);
			//DriverManager sms  Class.forName 을 통해서 생성된다.
			// JDBC 드라이버를 통하여  Connection을 만다는 역할을 한다.
			
			stmt = conn.createStatement();
			//connection 객체의 createStatement 메소드를 호출하여
			// SQL문을 전송하고 처리된 결과를 다시 자바 프로그램으로 전달해주는
			// Statement 객체를 생성한다.
			
			rs = stmt.executeQuery(query);
			// Statement 객체의 executeQuery 메소드로 SQL문을 전송한다.
			//
			
			while(rs.next()){
				// 다음 레코드가 있는지 판단 후 없으면 false
				// 있으면 true반환후 커서를 다음 커서로 이동
				String id = rs.getString("id");
				// 컬럼의 값을 추출하는 getter 메소드를 가지고 있따.
				// 문자열로 컬럼의 이름을 지정하여 해당 컬럼의 데이터를 얻을 수 있다.
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				int age = rs.getInt("age"); 
				String ph = rs.getString("phone");
				out.print ("id : " +id + " pw : "+ pw + " name : " +name + " age : "+age +" phone : "  +ph+"<br>");
				
			}
		}catch (Exception e){
			
			e.printStackTrace();
			
		}finally{
			// DB관련 처리작업이 완료된 다은에는 사용했던 객체ㅡㄹ은 메모리에서 해제해주어야 한다.
			// 해체하는 순서는 최근에 사용헀던 객체부터 거꾸로 올라가며 해제한다.
		
			try{
				if ( rs!= null) rs.close();
				if ( stmt!= null) stmt.close();
				if ( conn!= null) conn.close();
				
			}catch(Exception e2){}
			
		}
	%>
	
	
</body>
</html>