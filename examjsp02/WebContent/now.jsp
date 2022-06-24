<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현재시간</title>
</head>
<body>
현재 시간은 <%= request.getAttribute("now") %>입니다.<br>
현재 시간은 ${ now }입니다.
</body>
</html>