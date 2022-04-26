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
		String food = request.getParameter("food");
		String name = request.getParameter("name");
				
	%>	
	<h2> <%=name %>님 당신은 중국 음식중 <%=food %>를 좋아하시네요</h2>	
</body>
</html>