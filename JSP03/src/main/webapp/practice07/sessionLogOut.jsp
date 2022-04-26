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
	로그아웃한 후 로그아웃 했습니다 출력하기
	a 태그로 session 확인하는 버튼 만들기 
 --%>
	<%
	
	session.invalidate();
	
	%>
	<h2> 로그아웃 되었습니다.</h2>
	<a href = "sessionTest.jsp"> 세션 확인</a>	
</body>
</html>