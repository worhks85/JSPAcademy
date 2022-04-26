<%@page import="com.jsp.circle.CircleMemberDAO"%>
<%@page import="com.jsp.circle.CircleMemberDTO"%>
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
	<%--
		1. 넘어온 데이터 받기
		2. DTO 빈 객체 생성해서 데이터 셋팅하기
		3. DAO 객체 생성한후 insertCircle 메소드 호출하기
		4. 결과를 받은 후 회원가입이 잘 이루어졌다면 회원가입 축하 메세지와
		a태그 사용해서 회원목록 보는 버튼 만들기
		회원가입이 잘 이루어 지지 않았다면 a태그 이용해서 회원가입 하는 버튼 만들기
	 --%>
	 <%!
	 private String name,phone,email,agestr;
	 private int age;
	 
	 
	 %>

<%
	request.setCharacterEncoding("UTF-8");
	name = request.getParameter("name");
	agestr = request.getParameter("age");
	age = Integer.parseInt(agestr);
	phone = request.getParameter("phone");
	email = request.getParameter("email");
	
	CircleMemberDTO dto = new CircleMemberDTO(name,age,phone,email);
	CircleMemberDAO dao = CircleMemberDAO.getInstance();
	int result = dao.insertCircle(dto);
	if (result ==1){

		out.print("<p>회원가입을 완료했습니다</p>");
		out.print("<a href = \"circleMemberList.jsp\">리스트 보기</a>");
	
	}else{
	
		out.print("<p>회원가입에 실패했습니다.</p>");
		out.print("<a href = \"circleForm.html\">회원가입 다시하기</a>");
	}
	
%>


</body>
</html>