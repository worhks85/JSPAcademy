<%@page import="java.util.Enumeration"%>
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
	세션 객체안의 이름과 값을 모두 꺼내서 웹브라우저에 출력하기
	--%>
	<%
	Enumeration <String> e = session.getAttributeNames();
	int i = 0;
	while(e.hasMoreElements()){
		i++;
		 String sName = e.nextElement();
		 String sValue = session.getAttribute(sName).toString();
		
		 
		 out.print("세션 이름 : " + sName + "<br>");
		 out.print("세션 값 : " + sValue + "<br>" );
	}
	if (i==0){
		out.print("<p> 해당 세션이 삭제 되었습니다.</p>");
	}
	
	%>

</body>
</html>