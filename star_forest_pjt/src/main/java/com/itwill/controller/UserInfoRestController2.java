package com.itwill.controller;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.domain.User;
import com.itwill.service.UserService2;
import com.itwill.service.UserService3;

@RestController
public class UserInfoRestController2 {
	@Autowired
	private UserService3 userService3;
	//private UserService2 userService2;
	
	
		

		

		// 아이디 중복 검사
		@PostMapping(value ="/checkid")
		@ResponseBody
		public int checkid(@RequestParam("user_id") String user_id,@RequestParam("type")String type) {

			System.out.println("ajax 완료 : "+user_id);
			String check = userService3.checkID(user_id,type);
			System.out.println("중복검사 : "+check);

			if (user_id.equals(userService3.checkID(user_id,type))) {
				return 1;
			}
			return 0;
		}
/*
		// 일반회원 계정 찾기 페이지 이동
		@GetMapping(value ="/findAcntU")
		String findAcntU() {
			return "insertCustomer2/findAcntU";
		}
*/
		// 일반 회원 아이디 찾기
		@PostMapping(value ="/findUId")
		@ResponseBody
		String findUId(@RequestParam("user_name") String user_name, @RequestParam("user_phone") String user_phone) {
			// System.out.println(mname+ " : "+mphone);

			return userService3.findUId(user_name, user_phone);
		}
		
		//비밀번호찾기
		@PostMapping(value ="/findUPwd")
		@ResponseBody
		String findUPwd(@RequestParam("user_id") String user_id, @RequestParam("user_email") String user_email) {
			// System.out.println(mname+ " : "+mphone);
			
			return userService3.findUPwd(user_id, user_email);
		}
	
	
	
	
	
	
	
	/*

	//아이디 중복체크
	@PostMapping(value = "/user_id_check_post",produces = "text/plain;charset=UTF-8")
	public boolean user_id_check(@RequestParam String user_id) throws Exception{
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<User> resultList = new ArrayList<User>();

		boolean isDuplicate = userService2.existUserId(user_id);
		return !isDuplicate; // 중복되지않으면 아이디사용가능
	}
	//이메일 중복체크
	@PostMapping(value = "/user_email_check",produces = "text/plain;charset=UTF-8")
	public boolean user_email_check(@RequestParam String user_email) throws Exception{
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<User> resultList = new ArrayList<User>();

		boolean isDuplicate = userService2.existUserEmail(user_email);
		return !isDuplicate; // 중복되지않으면 이메일 사용가능
	}
	//전화번호 중복체크
	@PostMapping(value = "/user_phone_check",produces = "text/plain;charset=UTF-8")
	public boolean user_phone_check(@RequestParam String user_phone) throws Exception{
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<User> resultList = new ArrayList<User>();

		boolean isDuplicate = userService2.existUserPhone(user_phone);
		return !isDuplicate; // 중복되지않으면 이메일 사용가능
	}
	
	//회원가입
	@PostMapping(value ="/user_write_action_post")
	public Map user_write_action_post(@ModelAttribute User user){
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<User> resultList = new ArrayList<User>();

		*
		 * 회원가입
		 * 
		 * -1:아이디중복 1:회원가입성공
		 *
		try {
			int result = userService2.insertUser(user);
			if (result == -1) {
				code = -1;
				url = "insertCustomer2";
				msg = user.getUser_id() + " 는 이미 존재하는 아이디입니다.";
			} else if (result == 1) {
				code = 1;
				url = "user";
				msg = "회원가입 성공";
			}

		} catch (Exception e) {
			e.printStackTrace();
			code = 2;
			url = "Home";
			msg = "잘못된 접근입니다.";
		}

		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);
		return resultMap;
	}
	
*/
}
