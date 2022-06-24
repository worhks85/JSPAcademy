<%@page import="javafx.scene.control.Alert"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="info.*" %>
    
<jsp:useBean id="cmd" class = "info.LoginCommand" />
<jsp:setProperty name ="cmd" property="*"/>
<jsp:useBean id="dao" class="info.InfoDao" />
<%
	InfoVo vo = dao.SelectOne(cmd.getInfoId());
	if(vo ==null){
		
		response.sendRedirect("Login.jsp");
	}else if(cmd.getInfoPw().equals(vo.getInfoPw())){
		session.setAttribute("user", vo);
		response.sendRedirect("index.jsp");
		
	}else{
		response.sendRedirect("Login.jsp");
	}
%>