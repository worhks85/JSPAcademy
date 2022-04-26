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
	어플리케이션 객체를 사용해서 웹브라우저(applicationEx.jsp)에
	방문시 방문자수 출력하기
 --%>
 
 
 <%
 int cnt = 0;

 
 if(application.getAttribute("count")!=null){
 	cnt = (Integer)application.getAttribute("count");
 }
 cnt++;
 application.setAttribute("count",cnt);	
 out.print("현재 방문자 수 : " +cnt);
 %>

</body>
</html>