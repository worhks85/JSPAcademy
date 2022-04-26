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

<%
String strage = request.getParameter("age");
int age =Integer.parseInt(strage);
if (age > 20){
	response.sendRedirect("OK.jsp");
}else {
	response.sendRedirect("NG.jsp");
}
	//서버는 클라이언트 요청에 대해 특정 URL로 이동을 요청할 수 있따.
	// 이를 리다이렉트라고 한다 데이터 없이 다눈 이동일떄 주로 사용한다.
	
%>

</body>
</html>