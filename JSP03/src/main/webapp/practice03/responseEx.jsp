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
		폼에서 넘어온 데이터 받기
		이름이 홍길동과 가다면 sendRedirect로 ok.jsp로
		다르다면 sendRedirecct로 NG.jsp 로 이동 요청하기
	 --%>
	 <%
	 String answer = request.getParameter("answer");
	 if (answer.equals("홍길동")){
		 response.sendRedirect("OK.jsp");
	 }else{
		 response.sendRedirect("NG.jsp");
	 }
	 %>

</body>
</html>