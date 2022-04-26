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
		request.setCharacterEncoding("UTF-8");
	
	%>
	
<jsp:forward page = "food.jsp">
	<jsp:param value = "홍길동" name ="name"/>

</jsp:forward>

<%--
	하나의 jsp 페이지에서 다른 JSP 페이지로 요청 처리를 전달할 때 사용
	웹 브라우저의 주소는 그대로 요청받은 JSP주소로 유지된다.
	요청 흐름이 이동할 때 request, response 기본객체가 전달된다.
 --%>

</body>
</html>