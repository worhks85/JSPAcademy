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
		웹브라우저를 통해 서버에 어떤 정보를 요청하는 것을 request라고 한다.
		이러한 요청정보는 request객체가 관리한다.
	 --%>
	 
	 <%
	 	out.print("서버 : " +request.getServerName() + "<br>");
	 	out.print("컨텍스트 패스 : " + request.getContextPath()+"<br>");
	 	out.print("포트 번호 : " + request.getServerPort()+"<br>");	 	
	 	out.print("요청 방식 :" + request.getMethod()+"<br>");
 	 	out.print("프로토콜 : " + request.getProtocol()+"<br>");
	 	out.print("url : " + request.getRequestURL()+"<br>");
	 	out.print("URI : " +request.getRequestURI()+"<br>");
	 %>
	 
</body>
</html>