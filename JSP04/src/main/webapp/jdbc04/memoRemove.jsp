<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@page import="com.jsp.memo.MemoDAO"%>
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
	넘어온 memoID 받기
	정수로 변환 하기
	DAO 객체 생성후 delMemo메소드 호출하기
	라다이렉트로 memoList.jsp로 보내기
 	--%>
 	<%
 	String idstr = request.getParameter("id");
 	int id = Integer.parseInt(idstr);
 	MemoDAO dao = MemoDAO.getInstance();
 	dao.delMemo(id);
 	%>
 	<script> alert('삭제완료');</script>
 	<%
 	response.sendRedirect("memoList.jsp");
 	
 	%>
</body>
</html>