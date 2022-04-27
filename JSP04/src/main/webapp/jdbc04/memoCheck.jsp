<%@page import="com.jsp.memo.MemoDAO"%>
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
	2. 현재 시간으로 Timestamp 객체 생성하기 
		>> new Timestamp(System.currentTimemillis())
	3. DAO 객채 생성 후 insertMemo 메소드 호출하기
	4. 결과를 받아 메모가 잘 등록 되었다면 memoList.jsp로 보내기
		잘등록 되지 않았다면 memoForm.html로 보내기
		 
 --%>
 <%
 	request.setCharacterEncoding("UTF-8");
 	String nickName = request.getParameter("nickName");
 	String contents = request.getParameter("contents");
 	Timestamp ts = new Timestamp(System.currentTimeMillis());
 	MemoDAO dao = MemoDAO.getInstance();
 	int result = dao.insertMemo(nickName, contents, ts);
 	if ( result ==1 ){
 		%>
 		
 	<script>
 	alert('메모가 등록되었습니다');
 	window.location = "memoList.jsp"
 	</script>
 		
 		<%
 	}else{
 		out.print("메모등록이 실패했습니다.");
 		out.print("<a href = \"memoForm.jsp\">다시 쓰기</a>");
 	}
 	
 	
 
 %>
 <!-- 
 	<script>
 	alert('메모가 등록되었습니다');
 	window.location = "memeoList.jsp"
 	</script>
  -->

</body>
</html>