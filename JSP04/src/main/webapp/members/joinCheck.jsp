<%@page import="com.jsp.members.MembersDAO"%>
<%@page import="com.jsp.members.MembersDTO"%>
<%@page import="java.sql.Timestamp"%>
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
	1. 넘어온 데이터 받기 
	2. regDate를 현재 시간에 객체로 생성하기
	3. MembersDTO 객체에 셋팅하기
	4. DAO 객체 생성후 confirmID 메소드 호출 후에 members테이블에
		같은 아이디가 없다면 insertMember 메소드 호출하기
		결과값을 받아 회원가입이 되었다면 축하메세지 출력 login.jsp로 보내기
		회원가입이 되지 않았다면 회원가입 실패했다고 메세지 출력 join.jsp로 보내기
 --%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dto" class = "com.jsp.members.MembersDTO"/>
<jsp:setProperty property="*" name = "dto"/>
<%--
	프로퍼티가 많을 경우에는 jsp:setProperty 액션태그에 property 속성값을 *로 해주면
	폼으로 부터 넘어오는 파라미터의 값들이 프로퍼티 속성의 값으로 셋팅된다.
	주의사항 : 폼에서 넘어오는 데이터의 이름과 프로퍼티의 이름이 일치해야 한다.
 --%>
<%

	Timestamp regDate = new Timestamp(System.currentTimeMillis());
//	String id = request.getParameter("id");
//	String pw = request.getParameter("pw");
//	String name  = request.getParameter("name");
//	String email = request.getParameter("email");
//	String address = request.getParameter("address");
	dto.setRegDate(regDate);
	System.out.println("회원가입 시작");
	MembersDAO dao = MembersDAO.getInstance();
	int res = dao.confirmID(dto.getId());
	System.out.println(res);
	if (res == 1 ){
		res = dao.insertMember(dto);
		if(res == 0 ){
			
		%>
		<script>
		alert ('중복된 아이디가 있습니다.');
		history.back();
		</script>
		<%
		
		}else{
			res = dao.insertMember(dto);
			if(res ==1 ){
				%>
				<script>
					alert('회원가입을 축하합니다.');
					window.location = "login.jsp";
				</script>
				
				<%
			}else{
				%>
				<script>
					alert('회원가입에 실패했습니다.');
					window.location = "join.jsp";
				</script>
				<%
			}
		}
		
	}else{
		%>
		<script>
		alert ('중복된 아이디가 있습니다.');
		history.back();
		</script>
		<%
	}
	
	
%>
</body>
</html>