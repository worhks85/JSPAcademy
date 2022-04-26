<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
private Connection conn;
private Statement stmt;
private ResultSet rs;
String driver = "oracle.jdbc.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String uid= "C##JK";
String upw= "jsp123";

%>
<%
try{
	Class.forName(driver);
	conn = DriverManager.getConnection(url,uid,upw);
	stmt = conn.createStatement();
	rs = stmt.executeQuery("SELECT * FROM KGMember");
	
	while(rs.next()){
		String id = rs.getString("id");
		String pw = rs.getString("pw");
		String name = rs.getString("name");
		String phone = rs.getString("phone");
		int age = rs.getInt("age");
		out.print("아이디 : " + id + " 패스워드 : " + pw +
				" 이름 : " + name + " 번호 : " + phone + " 나이 : "+ age +"<br>");
	}
}catch(Exception e ){
	e.printStackTrace();	
}finally{
	try{if (rs!= null) rs.close();
		if (stmt != null) stmt.close();
		if (conn != null) conn.close();
		
	}catch(Exception e ){}
}

%>

</body>
</html>