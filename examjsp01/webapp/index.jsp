<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="info.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
</head>
<body>
<h1>
index
</h1>
<div>
현재 브라우저를 식별하는 세션: <%= session %><br>
세션 ID: <%= session.getId() %><br>
</div>
<%
	InfoVo vo = (InfoVo)session.getAttribute("user");
if(vo == null){
	%>
	
	<a href = "Login.jsp"><button>로그인</button></a>
	<a href = "join.jsp"><button>회원가입</button></a>
	
	<% 
	out.print("로그인 되어 있지 않음");
	
}else{
	out.print(vo.getInfoId() +"님으로 로그인");
	%>
	
	<a href ="logout.jsp"><button>로그아웃</button></a>
	
<% } %>

</body>
</html>