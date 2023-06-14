package com.itwill.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.controller.interceptor.LoginCheck;
import com.itwill.service.BookService;
import com.itwill.service.BookServiceImpl;
import com.itwill.service.RentalService;

@Controller
public class RentalController {
	@Autowired
	BookService bookService;
	@Autowired
	RentalService rentalService;


	@LoginCheck
	@RequestMapping("/admin")
	public String adminPage(HttpServletRequest request) throws Exception {

		String sUserId=(String)request.getSession().getAttribute("sUserId");
		String admin="admin";
		if(sUserId.equals(admin)) {
			return "forward:/WEB-INF/views/admin.jsp";
		}else {
			return "forward:/WEB-INF/views/Home.jsp";
		}

	}
	
	
	
	
	}
