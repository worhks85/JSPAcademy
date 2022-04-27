<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.jsp.memo.MemoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.jsp.memo.MemoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
	
	h1,h3{
		text-align : center;
	}
	 table , th , td{
	 	border : 1px solid black;
	 	border-collapse: collapse;
	 	margin : 0 auto
	 }
	 table {
	 	width : 700px;
	 }
		th,td{
			text-align : center;
			vertical-align : middle;
			height: 70px;
		}
	</style>

</head>
<body>
<!-- 
	DAO 객체 생성 후 memoList 메소드 호출하기
	ArrayList<MemoDTO> 객체를 얻은 후 
	닉네임 메모 메모작성일 [삭제] 출력하기  삭제는 a 태그로 만들기 <table> 태그 사용하기
 -->
 <%
 	MemoDAO dao = MemoDAO.getInstance();
 	ArrayList<MemoDTO> list = dao.getList();
 	%>
 	<h1> 메모장 </h1>
 	<table>
	<thead>
		<tr>
			<th>닉네임</th>
			<th>메모</th>
			<th>작성일</th>
		</tr>
	</thead>
	<tbody>
 	<%
 	for ( MemoDTO dto : list){
 		int id = dto.getMemoID();
 		String nickname = dto.getNickName();
 		String contents = dto.getContents();
 		Timestamp ts = dto.getRegTime();
 		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd, hh:mm");
 		String regtime = sdf.format(ts);
 		%>
 		<tr>
 		<td> <%= nickname%></td>
 		<td><%=contents %></td>
 		<td><%=regtime %></td>
 		<td><a href = "memoRemove.jsp?id=<%=id%>"> 삭제</a></td>
 		</tr>
 		
	<%
 		}
	 %> 
 
 </tbody>
</table>
<h3><a href = "memoForm.html">메모 다시 쓰기</a></h3>
</body>
</html>