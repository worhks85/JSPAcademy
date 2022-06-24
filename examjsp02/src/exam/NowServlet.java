package exam;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NowServlet extends HttpServlet{
	public NowServlet() {
		System.out.println("NowServlet()");
	}
	
	@Override
	public void init() throws ServletException {
		System.out.println("init()");
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("service()");
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println("<!doctype html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>현재시간</title>");
		out.println("<meta charset='utf-8'></head>");
		out.println("<body>");		
		out.println("현재 시간은:" + new Date());
		out.println("</body></html>");
	}
	
	@Override
	public void destroy() {
		System.out.println("destroy()");
	}
}
