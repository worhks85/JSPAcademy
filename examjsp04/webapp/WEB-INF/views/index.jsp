<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
</head>
<body>
<h1>Index</h1>
<div>
현재 브라우저를 식별하는 세션:<%= session %><br>
세션ID:<%= session.getId() %>
</div>
<%
	InfoVo vo = (InfoVo)session.getAttribute("user");
	if(vo == null){
%>
	<a href="${pageContext.request.contextPath}/login"><button>로그인</button></a>
	<a href="${pageContext.request.contextPath}/join"><button>회원가입</button></a>
<%  } else{ %>
	<%= vo.getInfoId() %>님으로 로그인
	<a href="${pageContext.request.contextPath}/logout"><button>로그아웃</button></a>
<%  } %>
</body>
</html>







