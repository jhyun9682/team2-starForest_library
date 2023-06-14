<%@page import="com.itwill.service.UserServiceImpl2"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.itwill.service.UserService"%>
<%@page import="com.itwill.domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("index.jsp");
		return;
	}

	String userId = request.getParameter("userId");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String birth = request.getParameter("birth");
	String gender = request.getParameter("gender");
	String address = request.getParameter("address");
	int category_no=Integer.parseInt(request.getParameter("category_no"));
	
	
	User newUser = null;
	
	try{
		newUser = new User(userId, name, password, email, birth,gender,phone,address,category_no);
		UserServiceImpl2 userServiceImpl2 = new UserServiceImpl2();
		
		int rowCount = userServiceImpl2.insertUser(newUser);
		
		if(rowCount == 1) {
			response.sendRedirect("user_login.jsp");
		} else {
			String errorMessage = URLEncoder.encode("는 이미존재하는 아이디입니다.","UTF-8");
	    	response.sendRedirect("user_join.jsp?msg=" + errorMessage);			
		}
	} catch(Exception e) {
		e.printStackTrace();
		response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);	
	}
%>