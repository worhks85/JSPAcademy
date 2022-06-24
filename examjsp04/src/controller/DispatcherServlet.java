package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.InfoDao;

public class DispatcherServlet extends HttpServlet{
	private Map<String, CommandHandler> handlerMap = new HashMap<>();
	
	public DispatcherServlet() {
		InfoDao dao = new InfoDao();
		handlerMap.put("/join", new RegistProcHandler(dao));
		LoginProcHandler loginProcHandler = new LoginProcHandler();
		loginProcHandler.setInfoDao(dao);
		handlerMap.put("/login", loginProcHandler);
		handlerMap.put("/logout", new LogoutHandler());
	}
	
	@Override
	protected void doGet(HttpServletRequest req, 
			HttpServletResponse resp) 
					throws ServletException, IOException {
		handlerProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, 
			HttpServletResponse resp) 
					throws ServletException, IOException {
		handlerProcess(req, resp);
	}
	
	private void handlerProcess(HttpServletRequest req, 
			HttpServletResponse resp) 
					throws ServletException, IOException {
		String reqUri = req.getRequestURI();
		String cmd = reqUri.substring(req.getContextPath().length());
		System.out.println("요청 cmd:" + cmd);
		String method = req.getMethod();
		
		String viewPage = "index";
	
		CommandHandler handler = handlerMap.get(cmd);
		if (handler != null) {
			try {
				viewPage = handler.process(req, resp);
			} catch (Throwable e) {
				e.printStackTrace();
			}
		}
		System.out.println("viewPage:" + viewPage);
		if(viewPage.startsWith("redirect")) {
			viewPage = viewPage.substring("redirect:".length());
			viewPage = req.getContextPath() + "/" + viewPage;
			resp.sendRedirect(viewPage);
		} else {
			String prefix = "/WEB-INF/views/";
			String suffix = ".jsp";
			System.out.println("jsp:" + prefix + viewPage + suffix);
			req.getRequestDispatcher(prefix + viewPage + suffix).forward(req, resp);
		}
	}
	
}
