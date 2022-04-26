<%@page import="java.lang.reflect.Method"%>
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
		쿠키 배열을 매개값으로 받아서
		쿠키 이름이 popUp 이고 쿠키 값이 notShow인 쿠키가 있다면
		쿠키체크 값을 true로 바꿔주는 메소드 만들기	
	 --%>

	<%!
	boolean cookieCheck = false; 
	
	boolean check(Cookie[] c){
		boolean cookieCheck = false;
		if ( c != null){
			for (int i = 0 ; i<c.length; i++){
				String cookieName = c[i].getName();
				String cookieValue = c[i].getValue();
				
				if(cookieName.equals("popUp")&&cookieValue.equals("notShow")){
					cookieCheck = true;
				}
			}
		}
		return cookieCheck;	
	}

	
%>
<%
	// 1. request 객체를 사용해서 쿠키 배열 얻기
	// 2. check 메소드 호출해서 cookieCheck 값 얻기
	// 3. cookieCheck 값이 false이면 팝업창을 자바스크립트로 띄워주기
	
	Cookie[] c = request.getCookies();
	cookieCheck = check(c);
	if (!cookieCheck){
		out.print("<script>");
		out.print("window.open(\"popUp.jsp\",\"pop\",\"width = 400 ,height = 500\")");
		out.print("</script>");
	}

%>



	<%--
	<script>
	
		window.open("popUp.jsp","pop","width = 400 ,height = 500");
	</script>
--%>


</body>
</html>