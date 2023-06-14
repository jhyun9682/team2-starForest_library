package com.itwill.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itwill.domain.User;
import com.itwill.service.UserService;

@Controller
public class UserInfoController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/user")
	public String user() {
		return "user";
	}
	
	@RequestMapping("/user_modify")
	public String user_modify(@ModelAttribute User user,HttpServletRequest request,String user_password,Model model) {
		String forwardPath="";
		try {
			String sUserId=(String)request.getSession().getAttribute("sUserId");
			int result=userService.PWcheck(sUserId, user_password);
			if(result==1) {
				userService.update(user);
				forwardPath= "MyPage_Info";
			}else {
				model.addAttribute("msg","비밀번호가 틀렸습니다.");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return forwardPath;
	}
	@RequestMapping("/passwordCheck")
	public String passwordCheck_form() {
		return "passwordCheck";
		
	}
	@RequestMapping("/user_qr")
	public String user_qr() {
		return "forward:/js/qrcode/user_qr.jsp";
	}
	
	@RequestMapping("/user_admin")
	public String user_admin() {
		return "user_admin";
	}
	
	@RequestMapping("/addrViewpageAPI")
	public String addrViewpageAPI() {
		return "addrViewpageAPI";
	}

}
