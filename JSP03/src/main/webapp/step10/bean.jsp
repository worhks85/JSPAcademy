<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="stu" class= "com.java.jsp.Student" scope ="page"/>
	<%--
		Student stu = new Student();
	id : JSP 에서 자바빈 객체에 접근할 때 사용하는 이름
	class : 패키지 이름을 포함한 자바빈 클래스의 완전한 이름을 입력
	scope : 자바빈 객체가 저장될 영역을 지정 
	 --%>
	 
	 <jsp:setProperty name = "stu" property="studentID" value ="202201"/>
	 <jsp:setProperty name = "stu" property="name" value ="홍길동"/>
	 <jsp:setProperty name = "stu" property="age" value ="20"/>
	 <jsp:setProperty name = "stu" property="grade" value ="1"/>
	 
	 이름 : <jsp:getProperty property="name" name="stu"/><br>
	 나이 : <jsp:getProperty property="age" name="stu"/><br>
	 학번 : <jsp:getProperty property="studentID" name="stu"/><br>
	 학년 : <jsp:getProperty property="grade" name="stu"/>
</body>
</html>