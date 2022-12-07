package com.billy.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthenticationInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//로그인을 안한경우는 로그인을 하도록 한다.
		//세션을 검사후..
		//클라이언트마다 세션이 있다.. 클라이언트가 보낸 쿠키의 아이디와 일치하는 세션의 객체를 가져와라
		HttpSession session = request.getSession();
		//가져온 세션에서 login 변수를 찾아서 리턴받아라 그런데 login변수의 리턴타입을 모르니 모든변수의 최상위인 Object로 호출
		Object obj = session.getAttribute("login");
		if(obj== null) {//로그인 안한 경우
			response.sendRedirect(request.getContextPath()+"/login"); // 컨트롤러로 경로 바꿈
			return false;
		}
		return true;//가던길 가라
	}
	
	//컨트롤러가 끝날때 동작
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("PostHandle start");
		System.out.println("PostHandle end");
		super.postHandle(request, response, handler, modelAndView);
	}

}
