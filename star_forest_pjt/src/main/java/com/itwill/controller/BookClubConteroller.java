package com.itwill.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.domain.BookClub;
import com.itwill.service.BookClubService;

@Controller
public class BookClubConteroller {
	@Autowired
	private BookClubService bookClubService;
	
	@RequestMapping("/bookclub")
	public String club_main(HttpServletRequest request) throws Exception {
	
		String sUserId=(String)request.getSession().getAttribute("sUserId");
		String admin="admin";
		if(sUserId==null) {
			return "bookclub";
		}
		else if(sUserId.equals(admin)) {
			return "bookclub_admin";
		}
		else {
			return "bookclub";
		}
		
		
	}
	
	
	
	
}
