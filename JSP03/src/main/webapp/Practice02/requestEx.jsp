<%@page import="java.util.Arrays"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
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
		선언문으로 form에서 받을 변수 선언
		스크립트릿으로 넘어온 데이터 받기
		표현식으로 웹브라우저에 출력하기
	--%>
	<%!
	String name,age,tel,jumin,major;
	String[] hobby;
	%>
	
	<%
	request.setCharacterEncoding("UTF-8");
	name = request.getParameter("name");
	age = request.getParameter("age");
	tel = request.getParameter("tel");
	jumin = request.getParameter("jumin");
	major = request.getParameter("major");
	
	hobby = request.getParameterValues("hobby");
	
	%>
이름 : <%=name %><br>
나이 : <%=age %><br>
번호 : <%=tel %><br>
주민번호 : <%=jumin %><br>
전공 : <%=major %><br>

취미 : <%=Arrays.toString(hobby) %>


</body>
</html>