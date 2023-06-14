package com.itwill.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.controller.interceptor.LoginCheck;
import com.itwill.domain.Book;
import com.itwill.domain.Rental;
import com.itwill.service.BookService;
import com.itwill.service.BookServiceImpl;
import com.itwill.service.RentalService;
import com.itwill.service.UserService;

@RestController
public class RentalRestController {

	@Autowired
	private RentalService rentalService;

	@Autowired
	private BookService bookService;

	@Autowired
	private UserService userService;

	// 모달안에 대여 신청 (버튼)
	@RequestMapping("/rest_rental")
	public Map rental_tot(@RequestParam int book_no, HttpSession session) throws Exception {
		Map resultMap = new HashMap();

		int code = 2;
		String url = "";
		String msg = "";
		List<Rental> resultList = new ArrayList<Rental>();
		try {
			String sUserId = (String) session.getAttribute("sUserId");
			int userStatus = userService.selectUserRentalStatus(sUserId);
			if(userStatus ==1) {
				System.out.println("넘어갔음");
				int fiveLimit = rentalService.rentalFiveLimit(sUserId);
				if (fiveLimit <= 2) {

					int duplication = rentalService.bookCheckDupli(sUserId, book_no);
					if (duplication == 0) {
						Date date = new Date();
						int rental = rentalService.insertRental(new Rental(0, null, null, date, 1, book_no, sUserId));
						bookService.updateRentalBookQty(book_no);
						bookService.updateRentalCnt(book_no);
						userService.userRentalCount(sUserId);
						if (rental == 1) {
							code = 1;
							url = "";
							msg = "신청완료";
						}
					} else if (duplication != 0) {
						code = 0;
						url = "";
						msg = "이미 대여한 도서입니다.";
					} 
					}else if (fiveLimit >= 3) {
						code = -1;
						url = "";
						msg = "최대 대여 가능 권수 3권을 대여하였습니다.";
				}
			}else if(userStatus==0) {
				System.err.println("나 정지");
				code = 3;
				url = "";
				msg = sUserId+"님은 연체로 인한 대출 정지 기간입니다.";
			}
		} catch (Exception e) {
			code = 2;
			url = "";
			msg = "오류제기럴";
			e.printStackTrace();
		}

		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);

		return resultMap;
	}

	// admin 반납 버튼
	// 책 수량 +1, 대여 상태 1--> 0 변경, 반납일짜 sysdate, 개인 대출가능 수량 +1
	@PostMapping("/rest_return")
	public Map admin_return(@RequestParam(value = "book_no", required = false) int book_no,
			@RequestParam(value = "user_id", required = false) String user_id, HttpServletRequest request)
			throws Exception {
		Map resultMap = new HashMap();

		int code = 2;
		String url = "";
		String msg = "";
		List<Rental> resultList = new ArrayList<Rental>();
		resultList = rentalService.selectNowLental();
		try {
			String sUserId = (String) request.getSession().getAttribute("sUserId");
			int rental = rentalService.updateRentalStatus(user_id, book_no);
			if (rental == 1) {
				bookService.updateByIdNo(user_id, book_no);
				userService.userReturnCount(user_id);
				code = 1;
				url = "";
				msg = "반납완료";
			} else if (rental == 0) {
				code = -1;
				url = "";
				msg = "error";
			}
		} catch (Exception e) {
			code = 2;
			url = "";
			msg = "오류";
			e.printStackTrace();
		}

		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);

		return resultMap;
	}

	// user 총 대출목록
	@LoginCheck
	@PostMapping("/user_rental_list")
	public Map user_rental_list(HttpServletRequest request) {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<Rental> resultList = new ArrayList<Rental>();

		try {
			String sUserId = (String) request.getSession().getAttribute("sUserId");
			resultList = rentalService.selectByIdTotalList(sUserId);
			code = 1;
			url = "";
			msg = "성공";
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

	// user 현재 대출중인 도서 리스트
	@LoginCheck
	@PostMapping("/user_now_rental_list")
	public Map user_now_rental_list(HttpServletRequest request) {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<Rental> resultList = new ArrayList<Rental>();

		try {
			String sUserId = (String) request.getSession().getAttribute("sUserId");
			resultList = rentalService.selectById(sUserId);
			code = 1;
			url = "";
			msg = "성공";
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

	// 도서관 전체 대출 리스트
	@LoginCheck
	@PostMapping("/total_rental_list")
	public Map total_rental_list(HttpServletRequest request) {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<Rental> resultList = new ArrayList<Rental>();

		try {
			String sUserId = (String) request.getSession().getAttribute("sUserId");
			sUserId = "admin";
			resultList = rentalService.selectNowLental();
			code = 1;
			url = "";
			msg = "성공";
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

	// admin창에서 user 검색 현재 대출중인 도서 리스트
	@LoginCheck
	@PostMapping("/admin_user_now_rental_list")
	public Map user_now_rental_list(@RequestParam(value = "keyword", defaultValue = "") String keyword,
			HttpServletRequest request) {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<Rental> resultList = new ArrayList<Rental>();

		try {
			List<Rental> searchList = rentalService.searchSelectById(keyword);
			code = 1;
			url = "";
			msg = "성공";
			resultList.addAll(searchList);
		} catch (Exception e) {
			e.printStackTrace();
			code = 2;
			url = "";
			msg = "실패";
		}
		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);
		return resultMap;
	}

	// 책 대여 기간 연장 7일
	@PostMapping("/extend_rental")
	public Map extend_rental(@RequestParam(value = "book_no", required = false) int book_no, HttpServletRequest request)
			throws Exception {
		Map resultMap = new HashMap();

		int code = 2;
		String url = "";
		String msg = "";
		List<Rental> resultList = new ArrayList<Rental>();
		try {
			String sUserId = (String) request.getSession().getAttribute("sUserId");
			int onceExtend = rentalService.onceExtend(sUserId, book_no);
			if (onceExtend == 1) {
				code = -1;
				url = "";
				msg = "연장은 한 번 만 가능합니다.";
			} else {
				rentalService.updateDate(sUserId, book_no);
				code = 1;
				url = "";
				msg = "기간 연장 완료";
			}
		} catch (Exception e) {
			code = 2;
			url = "";
			msg = "오류";
			e.printStackTrace();
		}

		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);

		return resultMap;
	}

}