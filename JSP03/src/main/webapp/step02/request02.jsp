<%@page import="java.util.Arrays"%>
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
	String name , ID, tel, area;
	String[] circle;
	%>
	
	<%
		
		request.setCharacterEncoding("UTF-8");
		name = request.getParameter("name");
		ID = request.getParameter("ID");
		tel = request.getParameter("tel");
		area = request.getParameter("area");
		
		circle = request.getParameterValues("circle");
		
	%>
<h2>form 에서 넘어온 데이터</h2>

이름 : <%=name  %><br>
학번 : <%=ID %><br>
번호 : <%=tel %><br>
지역 : <%=area %><br>
동아리 : <%=Arrays.toString(circle) %>

	

</body>
</html>