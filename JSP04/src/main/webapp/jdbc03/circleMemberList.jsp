<%@page import="com.jsp.circle.CircleMemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.jsp.circle.CircleMemberDAO"%>
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
		DAO 객체 생성후 circleList 메소드 호출하기
		ArrayList<CircleMemberDTO> 객체 얻은 후
		웹브라우저에 동아리 회원목록을 출력하기
		
	 --%>
	 
	 <%
	 	CircleMemberDAO dao = CircleMemberDAO.getInstance();
	 	ArrayList<CircleMemberDTO> list = dao.circleList();
	 	for (CircleMemberDTO dto : list){
	 		int age = dto.getAge();
	 		String email= dto.getEmail();
	 		String name = dto.getName();
	 		String phone = dto.getPhone();
	 %>
	 <p> 이름 : <%=name %> ||
	 	나이 : <%=age %> ||
	 	번호 : <%=phone %> ||
	 	이메일 : <%=email %>
	 </p>
	 <% 		
	 		
	 		
	 	}
	 %>

</body>
</html>