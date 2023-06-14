package com.itwill.controller.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthLoginAnnotationRestInterceptor extends HandlerInterceptorAdapter {
	public AuthLoginAnnotationRestInterceptor() {
		System.out.println("### AuthLoginAnnotationInterceptor()생성자");
	}

	// preHandle() : 컨트롤러보다 먼저 수행되는 메서드
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, 
			Object handler)
			throws Exception {
		System.out.println("### AuthLoginAnnotationInterceptor.preHandle()메써드");

		/***********************************************************************************
		1. handler객체 종류 확인
		    우리가 관심 있는 것은 @Controller객체에 있는 매핑된(@RequestMapping이 붙은) 메서드이므로 
		    HandlerMethod 타입인지 체크
		*************************************************************************************/   
		if (handler instanceof HandlerMethod == false) {
			/*
			 * @ Controller객체에 @RequestMapping이 붙은메쏘드 :  HandlerMethod
			 */
			//return true이면 그대로 컨트롤러로 진행
			return true;
		}
		
		/*********************************
		 2.HandlerMethod 타입으로 형 변환
		 ********************************/
		HandlerMethod handlerMethod = (HandlerMethod) handler;
		
		/***************************
		 3.HandlerMethod객체 로부터 @LoginCheck 어노테이션 객체얻기
		***************************/
		LoginCheck loginCheck = handlerMethod.getMethodAnnotation(LoginCheck.class);
		/***************************
		4. HandlerMethod객체에 @LoginCheck어노테이션 이없는 경우, 
		   즉 인증이 필요 없는 요청
		***************************/
		if (loginCheck == null) {
			System.out.println("### AuthLoginAnnotationInterceptor.preHandle()메써드 @LoginCheck 없는경우");
			return true;
		}
		/***************************
		4. HandlerMethod객체에 @LoginCheck어노테이션 이있는 경우, 
		   세션이 있는지 체크
		***************************/
		System.out.println("### AuthLoginAnnotationInterceptor.preHandle()메써드 @LoginCheck있 는경우");
		//session 객체를 가져옴
		HttpSession session = request.getSession();
		//login처리를 담당하는 사용자 정보를 담고 있는 객체를 가져옴
		String sUserId = (String) session.getAttribute("sUserId");
		if (sUserId == null) {
			// 로그인이 안되어 있는 상태임으로 로그인 폼으로 다시 돌려보냄(redirect)
			response.setContentType("application/json;charset=UTF-8");
			PrintWriter out=response.getWriter();
			StringBuffer sb=new StringBuffer();
			
			sb.append("{");
			sb.append("\"code\":2,");
			sb.append("\"url\":\"user_main\",");
			sb.append("\"msg\":\"로그인하세요\",");
			sb.append("\"data\":[]");
			sb.append("}");
			out.print(sb.toString());
			
			return false; // 더이상 컨트롤러 요청으로 가지 않도록 false로 반환함
		}
		// preHandle의 return은 컨트롤러 요청 uri로 가도 되냐 안되냐를 허가하는 의미임
		// 따라서 true로하면 컨트롤러 uri로 가게 됨.
		return true;
	}

	// 컨트롤러가 수행되고 화면이 보여지기 직전에 수행되는 메서드
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		super.afterCompletion(request, response, handler, ex);
	}
}