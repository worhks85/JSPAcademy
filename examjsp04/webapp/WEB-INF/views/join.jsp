<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<form method="post" action="${pageContext.request.contextPath}/join">
	<input type="text" name="info_id" placeholder="아이디" required><br>
	<input type="text" name="info_pw" placeholder="비밀번호" required><br>
	<input type="text" name="info_nick" placeholder="닉네임" required><br>
	<input type="submit" value="가입">
</form>
</body>
</html>