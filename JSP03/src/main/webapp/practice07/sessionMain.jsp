<%@page import="java.util.Enumeration"%>
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
		getATtributeNames()로 세션의 이름들을 enumulation() 
		타입으로 받은후 세션 이름과 세션 값을 얻고 세션 값이 sung과 
		같다면 웹브라우저에 성춘향님 안녕하세요 출력하기
 		a태그로 세션 확인하는 버튼과 로그아웃 버튼 만들기
	 --%>
	 <%
	 Enumeration<String> e = session.getAttributeNames();
	 while(e.hasMoreElements()){
		 String sName = e.nextElement();
		 String sValue = session.getAttribute(sName).toString();
		 if ( sValue.equals("sung")){
			 out.print("성춘향님 안녕하세요<br>");
			 out.print("<a href =\"sessionTest.jsp\"> 로그인<br>");
			 out.print("<a href =\"sessionLogOut.jsp\"> 로그아웃<br>");
		 }
		 
	 }
	 
	 %>
	
</body>
</html>