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
	 아이디와 비밀번호 데이터 받기
	 아이디가 sung 이고 비밀번호가 1111이면 session 객체에
	 value를 아이디 값으로 세션 생성하기 setAttribute("id",id)
	 리다이렉트로 sessionMain.jsp로 보내기
	 아이디, 비밀번호가 틀리다면 리다이렉트로 sessionLogin.html 로 보내기
 --%>
 <%!
 	String id,pw;
 %>
 <%
 	id = request.getParameter("id");
 	pw = request.getParameter("pw");
	
 	if (id.equals("sung") && pw.equals("1111")){
 	session.setAttribute("id",id);
 	response.sendRedirect("sessionMain.jsp");
 	}else{
 		response.sendRedirect("sessionLogin.html");
 		
 	}
 	
 	
 %>
 

</body>
</html>