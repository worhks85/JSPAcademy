package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.InfoVo;

public class LogoutHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		InfoVo vo = (InfoVo)session.getAttribute("user");
		System.out.println(vo.getInfoId() + "회원 로그아웃");
		session.invalidate();
		return "redirect:index";
	}

}
