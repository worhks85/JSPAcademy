<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력</title>
</head>
<body>

<form method="post" action="${pageContext.request.contextPath}/add">
	<input type = "text" name = "n1"> + <input type="text" name="n2">
	<input type = "submit" value="더하기">
</form>
<form method="post" action="${pageContext.request.contextPath}/min">
	<input type = "text" name = "n1"> - <input type="text" name="n2">
	<input type = "submit" value="빼기">
</form>
<form method="post" action="${pageContext.request.contextPath}/mul">
	<input type = "text" name = "n1"> * <input type="text" name="n2">
	<input type = "submit" value="곱하기">
</form>
<form method="post" action="${pageContext.request.contextPath}/div">
	<input type = "text" name = "n1"> / <input type="text" name="n2">
	<input type = "submit" value="나누기">
</form>

<form method="post" action="${pageContext.request.contextPath}/mod">
	<input type = "text" name = "n1"> % <input type="text" name="n2">
	<input type = "submit" value="나머지">
</form>

<form method="post" action="${pageContext.request.contextPath}/fac">
	<input type = "text" name = "n1"> !
	<input type = "submit" value="팩토리얼">
</form>


</body>
</html>