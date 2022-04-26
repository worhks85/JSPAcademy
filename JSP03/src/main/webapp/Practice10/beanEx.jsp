<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="mem" class= "com.java.jsp.Member" scope ="page"/>
<%--
	useBean 액션태그로 Member 빈 객체 만들기
	setProperty 액션태그로 Member 빈 객체에 데이터 넣기
	getProperty 액션태그로 Member 빈 객체의 데이터 얻어 웹브라우저에 출력하기
 --%>
	<jsp:setProperty name="mem" property="id" value ="jkjk"/>
	<jsp:setProperty name="mem" property="pw" value ="1234"/>
	<jsp:setProperty name="mem" property="name" value ="재관"/>
	<jsp:setProperty name="mem" property="age" value ="25"/>
	
id : <jsp:getProperty property="id" name="mem"/>	<br>
pw : <jsp:getProperty property="pw" name="mem"/>	<br>
name : <jsp:getProperty property="name" name="mem"/><br>
age : <jsp:getProperty property="age" name="mem"/><br>

</body>
</html>