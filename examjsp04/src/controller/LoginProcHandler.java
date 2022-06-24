package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.InfoDao;
import model.InfoVo;
import model.LoginCommand;

public class LoginProcHandler implements CommandHandler{

	private InfoDao infoDao;
	
	public void setInfoDao(InfoDao infoDao) {
		this.infoDao = infoDao;
	}
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getMethod().equals("GET")) {
			return "login";
		}
		
		
		LoginCommand cmd = new LoginCommand(); 
		cmd.setInfoId(req.getParameter("infoId"));
		cmd.setInfoPw(req.getParameter("infoPw"));	
		
		InfoVo vo = infoDao.selectOne(cmd.getInfoId());
		if(vo == null){
			return "redirect:login";
		}else if(cmd.getInfoPw().equals(vo.getInfoPw())){
			int rid = cmd.getRememberId();
			if(rid == 1){
				Cookie cookie = new Cookie("rememberId", cmd.getInfoId());
				cookie.setMaxAge(60*60*24*30); //60*60*24*30
				resp.addCookie(cookie);
			}else{
				Cookie cookie = new Cookie("rememberId", cmd.getInfoId());
				cookie.setMaxAge(0);
				resp.addCookie(cookie);
			}
			
			HttpSession session = req.getSession();
			session.setAttribute("user", vo); 
			return "redirect:index";
		}else{
			return "redirect:login";
		}
	}

}
