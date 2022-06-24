<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= "info.*"%>
 <%
 	String infoId = request.getParameter("info_id");
 	String infoPw = request.getParameter("info_pw");
 	String infoNick = request.getParameter("info_nick");
 	
 	InfoVo vo = new InfoVo(infoId, infoPw, infoNick);
 	InfoDao dao = new InfoDao();
 	dao.insertInfo(vo);
 	response.sendRedirect("index.jsp");
 %>