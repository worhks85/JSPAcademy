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
	String sessionID = session.getID();
	
	out.print("세션 아이디 : " + sessionID+ "<br>");
	
	int sessionInter = session.getMaxInactiveInterval();
	// 세션의 유효시간 (기본 30분)
	
	out.print("세션의 유효 시간 : " + sessionInter+ "<br>");
	
	session.removeArrtibute("sessionName");
	//세션삭제 :  removeAttribute("세션이름");
	
	while(e.hasmoreElements()){
		sName = e.nextElement();
		sValue = session.getAttribute(sName).toString();
		
		out.print("세션 이름 : " + sName + "<br>");
		out.print("세션 값 : " + sValue + "<br>");
		
		session.invalidate();
		// 세션의 모든 데이터를 삭제한다.
		 
		if(request.isRequestedSessionIdValid()){
			//유효한 세션이 있으면  true 반환  없으면 false반환
			out.print("유효한 세션이 있음");
		}else{
			out.print("세션이 없음");
		}
		
	}
	
	--%>

</body>
</html>