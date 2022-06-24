<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//서버에서 요청 정보로부터 쿠키를 꺼냄
	Cookie[] cookies = request.getCookies();
	String id = "";
	String checked = "";
	for(int i = 0; i < cookies.length; i++){
		String cookieName = cookies[i].getName();
		System.out.println(cookieName);
		if(cookieName.equals("rememberId")){
			id = cookies[i].getValue();
			checked = "checked";
		}
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<form method="post" action="${pageContext.request.contextPath}/login">
	<input type="text" name="infoId" value="<%= id %>" placeholder="아이디" required><br>
	<input type="password" name="infoPw" placeholder="비밀번호" required><br>
	<input type="checkbox" name="rememberId" value="1" <%= checked %>>아이디 기억하기
	<input type="submit" value="로그인">
</form>
</body>
</html>





