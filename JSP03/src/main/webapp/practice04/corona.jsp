<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
	넘어온 데이터 받기
	3차 까지 맞았다면 여행 가능 하다고 웹 브라우저에 출력하기
 --%>
 <%
 	request.setCharacterEncoding("UTF-8");
 	String name,country,corona;
 	name = request.getParameter("name");
 	country = request.getParameter("country");
 	corona = request.getParameter("corona");
 	
 	if (corona.equals("3")){
 		out.print("<h2>" +name + "님 " + country + "나라 여행이 가능합니다.</h2>");
 		out.print("<a href=\"#\"> 여행 예약하기</a>");
 	} else {
 		out.print("<h2>" +name + "님 " + country + "나라 여행은 3차까지 맞으셔야 합니다.</h2>");
 	}
	 
	 
	 
 %>

</body>
</html>