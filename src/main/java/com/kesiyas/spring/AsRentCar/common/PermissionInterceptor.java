package com.kesiyas.spring.AsRentCar.common;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class PermissionInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request
			, HttpServletResponse response
			, Object handler) throws IOException {
		
		HttpSession session = request.getSession();
		Integer centerUserId = (Integer)session.getAttribute("centerUserId");
		String authority = String.valueOf(session.getAttribute("authority"));
		
		String uri = request.getRequestURI();
		
		// 관리자 권한이 없는 경우		
		if(!(authority.equals("admin"))) {
			if(uri.startsWith("/rent/user/admin/car")) {
				response.sendRedirect("/rent/user/signin/view");
				
				return false;
			}		
		} 
		
		// 관리자 회원가입 단계가 아닌 경우
		if(centerUserId == null) {
			if(uri.startsWith("/rent/user/admin/branch")) {
				response.sendRedirect("/rent/user/signin/view");
				
				return false;
			}		
		}
		
		return true;
	}
	
	@Override
	// Response가 아직 완성이 안된 상태
	public void postHandle(
			HttpServletRequest request
			, HttpServletResponse response
			, Object handler
			, ModelAndView modelAndView
			) {		
	}
	
	
	// Response가 완성된 이후
	@Override
	public void afterCompletion(
			HttpServletRequest request, 
			HttpServletResponse response, 
			Object handler, 
			Exception ex) throws Exception {		

	}
}
