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
<!-- 
	선언문으로 Connection, statement 객체를 받을 변수 선언하기
	넘어올 데이터 받을 변수 선언하기
	스크립트릿으로 넘어온 데이터 받기
 -->
 
 <%!
 private Connection conn;
 private Statement stmt;
 private ResultSet rs;
 private String id,pw,name,phone,strage;
 private int age;
 private String uid = "C##JK";
 private String upw = "jsp123";
 %>
<%
	request.setCharacterEncoding("UTF-8");
	id = request.getParameter("id");
	pw = request.getParameter("pw");
	name = request.getParameter("name");
	strage = request.getParameter("age");
	age = Integer.parseInt(strage);
	phone  = request.getParameter("phone");

	String query = "insert into KGMember(id,pw,name,age,phone) values('" 
	+id + "','" + pw +"','"+name+"',"+age+",'"+phone+"')";	
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","C##JK","jsp123");
		stmt = conn.createStatement();
		int su = stmt.executeUpdate(query);
		//메소드는 테이블에서 변경된 레코드의 수를 반환(insert,update,delete)
		if(su==1){
			System.out.print("insert 성공");
			response.sendRedirect("joinResult.jsp");
		}else{ 
			System.out.print("insert 실패");
			response.sendRedirect("memberJoinForm.html");
			}
		
		
	}catch(Exception e){
		e.printStackTrace();
		
	}finally{
		try{
			if (stmt != null ) stmt.close();
			if (conn != null ) conn.close();
		}catch(Exception e ){}
		
	}
%> 

</body>
</html>