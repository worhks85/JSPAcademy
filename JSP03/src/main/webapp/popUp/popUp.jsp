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
		String puc = request.getParameter("popUpClose");
		if (puc != null){
			if(puc.equals("close")){
				Cookie cookie = new Cookie("popUp","notShow");
				cookie.setPath("/");
				cookie.setMaxAge(60*60*24);
				response.addCookie(cookie);
				out.print("<script>");
				out.print("window.close()");
				out.print("</script>");
				
				
			}
		}
		
	%>
	<h1>공지사항 입니다.</h1>
	<br><br><br><br><br><br><br><br><br><br><br>
	
	<form action="popUp.jsp" method = "post">
	<label>	<input type = "checkbox" name = "popUpClose" value = "close">
	오늘 더이상 공지사항 보지 않기</label>
	
	<input type = "submit" value ="체크 후 클릭">
	
	</form>

	

</body>
</html>