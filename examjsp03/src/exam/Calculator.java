package exam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Calculator {
	public String calc(HttpServletRequest request , HttpServletResponse response) throws Throwable;
	
}
