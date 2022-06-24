package exam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MulCalculator implements Calculator {
	@Override
	public String calc(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int n1 = Integer.parseInt(request.getParameter("n1"));
		int n2 = Integer.parseInt(request.getParameter("n2"));
		request.setAttribute("result", n1*n2);
		return "mulResult";
	}
}
