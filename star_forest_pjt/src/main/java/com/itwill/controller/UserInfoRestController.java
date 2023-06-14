package com.itwill.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.ibatis.javassist.bytecode.ByteArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.itwill.controller.interceptor.LoginCheck;
import com.itwill.domain.User;
import com.itwill.service.UserService;

@RestController
public class UserInfoRestController {
	@Autowired
	private UserService userService;

	// 세션체크
	@LoginCheck
	@PostMapping("/user_session_check")
	public Map user_session_check(HttpSession session,Model model) throws Exception {
		Map resultMap = new HashMap();
		int code = 1;
		String url = "main";
		String msg = "세션존재";
		List<User> resultList = new ArrayList<User>();

		String sUserId = (String) session.getAttribute("sUserId");
		User sUser = userService.findUser(sUserId);
		resultList.add(sUser);
		model.addAttribute("sUserId", sUserId);
		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);
		return resultMap;
	}

	// 아이디 중복체크
	@PostMapping("/user_id_check")
	public boolean user_id_check(@RequestParam String user_id) throws Exception {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<User> resultList = new ArrayList<User>();

		boolean isDuplicate = userService.existedUser(user_id);
		return !isDuplicate; // 중복되지않으면 아이디사용가능

	}

	// 회원가입
	@PostMapping("/user_write_action")
	public Map user_write_action(@ModelAttribute User user) {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<User> resultList = new ArrayList<User>();

		/*
		 * 회원가입
		 * 
		 * -1:아이디중복 1:회원가입성공
		 */
		try {
			int result = userService.create(user);
			if (result == -1) {
				code = -1;
				url = "user_write_form";
				msg = user.getUser_id() + " 는 이미 존재하는 아이디입니다.";
			} else if (result == 1) {
				code = 1;
				url = "user_login_form";
				msg = "회원가입 성공";
			}

		} catch (Exception e) {
			e.printStackTrace();
			code = 2;
			url = "main";
			msg = "잘못된 접근입니다.";
		}

		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);
		return resultMap;
	}

	// 로그인	
	
	@PostMapping("/user_login_action")
	public Map user_login_action(@ModelAttribute(value = "fuser") User user, HttpServletRequest request)
			throws Exception {
		Map resultMap = new HashMap();
		int code = 0;
		String url = "";
		String msg = "";
		List<User> resultList = new ArrayList<User>();

		int result = userService.login(user.getUser_id(), user.getUser_password());
		/*
		 * 회원로그인
		 * 
		 * 0:아이디존재안함 1:패쓰워드 불일치 2:로그인성공
		 */
		if(result==0) {
			code = 0;
			url = "user_login_form";
			msg = "아이디 존재안함";
			System.out.println("아이디없음");
		}else if(result==1) {
			code = 1;
			url = "user_login_form";
			msg = "패스워드 불일치";
			System.out.println("패스워드불일치");
		}else {
			request.getSession().setAttribute("sUserId", user.getUser_id());
			User sUser=userService.findUser(user.getUser_id());
			code = 2;
			url = "main";
			msg = "로그인 성공";
			System.out.println("성공");
			resultList.add(sUser);
		}
		
		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);
		return resultMap;
	}

	// 로그아웃
	@LoginCheck
	@PostMapping("/user_logout_action")
	public Map user_logout_action(HttpServletRequest request) {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "user_main";
		String msg = "";
		List<User> resultList = new ArrayList<User>();

		request.getSession().invalidate();

		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);
		return resultMap;
	}

	// 회원수정폼
	@LoginCheck
	@PostMapping("/user_modify_form")
	public Map user_modify_form(HttpServletRequest request) throws Exception {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<User> resultList = new ArrayList<User>();

		String sUserId = (String) request.getSession().getAttribute("sUserId");
		User user = userService.findUser(sUserId);
		resultList.add(user);

		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);
		return resultMap;
	}

	// 비밀번호변경폼
	@LoginCheck
	@PostMapping("/pw_modify_form")
	public Map pw_modify_form(HttpServletRequest request) throws Exception {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<User> resultList = new ArrayList<User>();

		String sUserId = (String) request.getSession().getAttribute("sUserId");
		User user = userService.findUser(sUserId);
		resultList.add(user);

		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);
		return resultMap;
	}

	// 비밀번호변경
	@LoginCheck
	@PostMapping("/pw_modify_action")
	public Map pw_modify_action(@ModelAttribute User user, HttpServletRequest request) {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<User> resultList = new ArrayList<User>();

		try {
			int result = userService.updatePassword(user);
			if (result == 1) {
				code = 1;
				url = "";
				msg = "비밀번호가 수정되었습니다.";
			} else {
				code = -1;
				url = "modify_form";
				msg = "비밀번호 변경에 실패하였습니다.";
			}
		} catch (Exception e) {
			e.printStackTrace();
			code = 2;
			url = "main";
			msg = "잘못된 접근입니다.";
		}
		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);
		return resultMap;
	}

	// 회원수정
	@LoginCheck
	@PostMapping("/user_modify_action")
	public Map user_modify_action(@ModelAttribute User user, HttpServletRequest request) {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<User> resultList = new ArrayList<User>();

		try {
			int result = userService.update(user);
			if (result == 1) {
				code = 1;
				url = "main";
				msg = "수정성공";
			} else {
				code = -1;
				url = "modify_form";
				msg = "수정실패";
			}
		} catch (Exception e) {
			e.printStackTrace();
			code = 2;
			url = "main";
			msg = "잘못된 접근입니다.";
		}
		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);
		return resultMap;
	}

	// 상세보기
	@LoginCheck
	@PostMapping("/user_view")
	public Map user_view(HttpServletRequest request) {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<User> resultList = new ArrayList<User>();

		try {
			String sUserId = (String) request.getSession().getAttribute("sUserId");
			User loginUser = userService.findUser(sUserId);
			resultList.add(loginUser);
			code = 1;
			url = "main";
			msg = "상세보기성공";

		} catch (Exception e) {
			e.printStackTrace();
			code = 2;
			url = "main";
			msg = "로그인 후 이용해주세요.";
		}

		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);
		return resultMap;
	}

	// 비밀번호체크(비밀번호변경,수정,탈퇴 전 체크)
	@LoginCheck
	@PostMapping("/user_pw_check")
	public Map user_pw_check(@RequestParam String user_password, HttpServletRequest request) throws Exception {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<User> resultList = new ArrayList<User>();

		String sUserId = (String) request.getSession().getAttribute("sUserId");
		int result = userService.PWcheck(sUserId, user_password);
		if (result == 1) {
			code = 1;
			url = "";
			msg = "비밀번호체크성공";
			
		} else {
			code = -1;
			url = "main";
			msg = "비밀번호가 틀렸습니다. 다시 입력해주세요.";
		}
		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);
		return resultMap;
	}

	// 인당 대출가능권수 한도 카운트
	@LoginCheck
	@PostMapping("/user_rental_count")
	public Map user_rental_count(HttpServletRequest request) throws Exception {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<User> resultList = new ArrayList<User>();

		String sUserId = (String) request.getSession().getAttribute("sUserId");
		int rentalCount = userService.userRentalCount(sUserId);
		if (rentalCount == 1) {
			code = 1;
			url = "";
			msg = "대출가능"; // 대출가능 권수가남아서 대출가능
		} else {
			code = -1;
			url = "main";
			msg = "대출불가능";
		}

		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);
		return resultMap;
	}

	// 연체로 인한 대출정지기간
	@LoginCheck
	@PostMapping("/user_rental_stop")
	public Map user_rental_stop(HttpServletRequest request) throws Exception {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<User> resultList = new ArrayList<User>();

		String sUserId = (String) request.getSession().getAttribute("sUserId");
		int stopPeriod = userService.rentalStopPeriod(sUserId);
		if (stopPeriod > 0) {
			code = -1;
			url = "main";
			msg = sUserId + " 님은 연체로 인해 "+ stopPeriod + " 일 동안 대출정지입니다.";
		} else {
			code = 1;
			url = "";
			msg = "대출가능"; // 연체된 기간이 없으므로 대출가능
		}
		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);
		return resultMap;

	}

	//회원의 대출가능여부
	@LoginCheck
	@PostMapping("/user_rental_status")
	public Map user_rental_status(HttpServletRequest request){
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<User> resultList = new ArrayList<User>();
		
		try {
		String sUserId = (String) request.getSession().getAttribute("sUserId");
		int stopPeriod = userService.rentalStopPeriod(sUserId);
		int result=userService.userRentalStatus(sUserId);
		if(result==1) {
			code = -1;
			url = "";
			msg = sUserId + " 님은 연체로 인해 " + stopPeriod + " 일 동안 대출정지입니다.";//연체기간이 있어서 대출불가
		}else {
			code = 1;
			url = "";
			msg = sUserId +" 님은 미연체로 현재 대출이 가능한 상태입니다.";
		}
		
		} catch (Exception e) {
			e.printStackTrace();
			code = 2;
			url = "";
			msg = "대출중인 도서가 없습니다.";
		}
		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);
		return resultMap;


	}
	//user_list
	@LoginCheck
	@GetMapping("/user_all_list")
	public Map user_list(HttpSession session) throws Exception {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		String admin="admin";
		String sUserId = (String)session.getAttribute("sUserId");
		List<User> resultList = new ArrayList<User>();
		if(admin.equals(sUserId)) {
		resultList=userService.userList();
		code = 1;
		url = "";
		msg = "성공";
		//resultList.addAll(resultList);
		}
		
		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);
		return resultMap;

	}
	
	// 회원 탈퇴
		@LoginCheck
		@PostMapping("/user_remove_action")
		public Map user_remove_action(@ModelAttribute User user, HttpServletRequest request) {
			Map resultMap = new HashMap();
			int code = 2;
			String url = "";
			String msg = "";
			List<User> resultList = new ArrayList<User>();

			try {
				String sUserId = (String) request.getSession().getAttribute("sUserId");
				int result = userService.remove(sUserId);
				if (result == 1) {
					request.getSession().invalidate();
					code = 1;
					url = "main";
					msg = "삭제성공";
				} else {
					code = -1;
					url = "main";
					msg = "삭제실패";
				}
			} catch (Exception e) {
				e.printStackTrace();
				code = 2;
				url = "main";
				msg = "잘못된 접근입니다.";
			}
			resultMap.put("code", code);
			resultMap.put("url", url);
			resultMap.put("msg", msg);
			resultMap.put("data", resultList);
			return resultMap;
		}
		
		//관리자권한 회원삭제
		@LoginCheck
		@PostMapping("admin_user_delete")
		public Map admin_user_delete(@RequestParam String user_id,HttpServletRequest request) throws Exception {
			Map resultMap = new HashMap();
			int code = 2;
			String url = "";
			String msg = "";
			List<User> resultList = new ArrayList<User>();
			
			int result=userService.remove(user_id);
			if(result==1) {
				code = 1;
				url = "main";
				msg = "삭제성공";
			}else {
				code = -1;
				url = "main";
				msg = "삭제실패";
			}
			
			resultMap.put("code", code);
			resultMap.put("url", url);
			resultMap.put("msg", msg);
			resultMap.put("data", resultList);
			return resultMap;
		}
		
		//대출정지기간
		@PostMapping("/rental_stop_period")
		public Map rental_stop_period(@RequestParam String user_id) throws Exception {
			Map resultMap = new HashMap();
			int code = 2;
			String url = "";
			String msg = "";
			List<User> resultList = new ArrayList<User>();
			
			int stopPeroid=userService.rentalStopPeriod(user_id);
			if(stopPeroid>0) {
				code = 1;
				url = "main";
				msg = "삭제성공";
			}else {
				code = -1;
				url = "main";
				msg = "삭제실패";
			}
			
			
			resultMap.put("code", code);
			resultMap.put("url", url);
			resultMap.put("msg", msg);
			resultMap.put("data", resultList);
			return resultMap;
		}
}