package exam;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NowServlet2 extends HttpServlet{
	public NowServlet2() {
		System.out.println("NowServlet2()");
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("service()");
		req.setAttribute("now", new Date());
		req.getRequestDispatcher("/now.jsp").forward(req, resp);
	}
	
}
