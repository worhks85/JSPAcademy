package exam;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 이 서블릿은 Front Controller 역할
public class DispatcherServlet extends HttpServlet {
	private Map<String,Calculator> handler = new HashMap<>();

	public DispatcherServlet() {
		handler.put("/add",new AddCalculator());
		handler.put("/min",new MinCalculator());
		handler.put("/div",new DivCalculator());
		handler.put("/mul",new MulCalculator());
		handler.put("/mod",new ModCalculator());
		handler.put("/fac",new FacCalculator());
		
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		handlerProcess(req,resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		handlerProcess(req,resp);
	}
	private void handlerProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("클라이언트로부터 요청을 받음");
		System.out.println(req.getMethod());
		System.out.println(req.getRequestURI());
		String reqURI = req.getRequestURI();
		String cmd = reqURI.substring(req.getContextPath().length());
		System.out.println("요청 cmd : " + cmd);
		
		String viewPage = "";
		
		if (cmd.equals("/form")) {
			viewPage = "form";
		}else {
			Calculator proc = handler.get(cmd);
			if(proc != null) {
				try {
					viewPage = proc.calc(req, resp);
				} catch (Throwable e) {
					e.printStackTrace();
				}
				
			}
			
		}
		String prefix = "/views/";
		String suffix = ".jsp";
		
		req.getRequestDispatcher(prefix + viewPage + suffix).forward(req, resp);
		
		
	}
	
}















