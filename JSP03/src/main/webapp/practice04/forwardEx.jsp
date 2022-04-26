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
		jsp 액션 태그로 corona.jsp로 요청 전송하기
	 --%>
<jsp:forward page = "corona.jsp" />
<%--
	태ㅡ 내부에 추가적으로 종속된 태그가 없다면 닫는 태그를
	생략하고 끝부분은 / > 로 마감할 수 있다.
	
 --%>

</body>
</html>