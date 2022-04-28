<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function formCheck(){
		var id = document.joinForm.id.value;	
		var pw = document.joinForm.pw.value;
		var pwcheck = document.joinForm.pwcheck.value;
		var name = document.joinForm.name.value;
		
		if (id == "" || id == null) {
			alert("id는 필수 사항 입니다.");
			document.joinForm.id.focus();
			return;
		}
		if (pw == "" || pw == null) {
			alert("pw는 필수 사항 입니다.");
			document.joinForm.pass.focus();
			return;
		}
		if (name == "" || name == null) {
			alert("name는 필수 사항 입니다.");
			document.joinForm.name.focus();
			return;
		}
		if ( pw != pwcheck) {
			alert("비밀번호가 일치하지 않습니다."); 
			document.joinForm.checkpass.focus();	
			return;
		}
		
		document.joinForm.submit();
		
		
	}
</script>
</head>
<body>
<%--
	회원가입 폼 만들기
	자바 스크립트로 유효성 검사후 joinCheck.jsp로 전송하기
 --%>
 <form action="joinCheck.jsp" name = "joinForm" method ="post">
 아이디 : <input type = "text" name = "id" size ="10"><br>
 비밀번호 : <input type = "password" name = "pw" size ="10"><br>
 비밀번호 확인 : <input type = "password" name = "pwcheck" size ="10"><br>
 이름 : <input type = "text" name = "name" size ="10"><br>
 메일 : <input type = "text" name = "email" size ="15"><br>
 주소 : <input type = "text" name = "address" size ="20"><br>

 <input type = "button" onclick = "formCheck()" value="회원가입">
 
</form>
</body>
</html>