<%@page import="com.jsp.dbcp.KGMemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.jsp.dbcp.KGMemberDAO"%>
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
		KGMemberDAO dao = new KGMemberDAO();
	
		ArrayList<KGMemberDTO> list = dao.list();
		 
		
	%>
<h1>KGMember 리스트</h1>
	<%
	 	for(KGMemberDTO dto : list){
	 %>
		<p>
		아이디 : <%=dto.getId() %>	||
		비밀번호 : <%=dto.getPw() %>	||
		이름 : <%=dto.getName()%>	||
		나이 : <%=dto.getAge() %>	||
		번호 : <%=dto.getPhone() %>
		
		</p>	 
	 
	 
	 
	 <%		
	 	}
	%>
</body>
</html>