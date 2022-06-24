package exam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FacCalculator implements Calculator {

	@Override
	public String calc(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int n1 = Integer.parseInt(request.getParameter("n1"));
		int res = 0;
		for (res=1; n1 > 0; n1--) {
			res *= n1;
		}
		request.setAttribute("result", res);
		return "facResult";
	}
	

}
