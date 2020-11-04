package global.sesoc.good.util;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String id = (String)request.getSession().getAttribute("loginId");
		if(id==null) {
		
		String path = request.getContextPath();
		
		response.sendRedirect(path+"/member/login");
		
		return false;
		}
       return true;	
	
	}

	
}
