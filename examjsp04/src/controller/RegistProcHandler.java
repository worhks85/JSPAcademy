package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.InfoDao;
import model.InfoVo;

public class RegistProcHandler implements CommandHandler{

	private InfoDao dao;
	
	public RegistProcHandler(InfoDao infoDao) {
		this.dao = infoDao;
	}
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getMethod().equals("GET")) {
			return "join";
		}
		
		String infoId = request.getParameter("info_id");
		String infoPw = request.getParameter("info_pw");
		String infoNick = request.getParameter("info_nick");
		
		InfoVo vo = new InfoVo(infoId, infoPw, infoNick);
		dao.insertInfo(vo);
		return "redirect:index";
	}

}
