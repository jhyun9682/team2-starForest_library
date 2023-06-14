package com.itwill.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.controller.interceptor.LoginCheck;
import com.itwill.domain.Reservation;
import com.itwill.service.BookService;
import com.itwill.service.ReservationService;

@RestController
public class ReservationRestController {

	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private BookService bookService;
	
	//예약신청
	@PostMapping("/reservation")
	public Map reservation(int book_no, HttpSession session) throws Exception{
		Map resultMap = new HashMap();
		
		int code=2;
		String url="";
		String msg="";
		List<Reservation> resultList = new ArrayList<Reservation>();
		try {
			String sUserId= (String)session.getAttribute("sUserId");
			int duplicationRes = reservationService.resCheckDupli(sUserId, book_no);
			if(duplicationRes == 0) {
				int res = reservationService.insertReservation(new Reservation(0, null, 1, book_no, sUserId));
				bookService.updateResCnt(book_no);
				if(res==1) {
					code=1;
					url="";
					msg="신청완료";
				}
			}else if (duplicationRes !=0){
				code=0;
				url="";
				msg="이미 예약한 도서입니다.";
			}
		} catch (Exception e) {
			code=2;
			url="";
			msg="오류";
			e.printStackTrace();
		}
		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);
	
		return resultMap;
	}
	
	@PostMapping("/reservation_delete")
	public Map reservation_delete(int book_no, HttpSession session) throws Exception{
		Map resultMap = new HashMap();
		
		int code=2;
		String url="";
		String msg="";
		List<Reservation> resultList = new ArrayList<Reservation>();
		try {
			String sUserId= (String)session.getAttribute("sUserId");
			int resDelete = reservationService.deleteReservation(sUserId, book_no);
			if(resDelete == 1) {
					code=1;
					url="";
					msg="삭제완료";
			}else if (resDelete !=1){
				code=0;
				url="";
				msg="에러";
			}
		} catch (Exception e) {
			code=2;
			url="";
			msg="오류";
			e.printStackTrace();
		}
		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);
		
		return resultMap;
	}
	
	//회원이 예약한 예약 리스트 뽑기
			@LoginCheck
			@PostMapping("/reservation_list")
			public Map reservation_list(HttpServletRequest request) {
				Map resultMap = new HashMap();
				int code = 2;
				String url = "";
				String msg = "";
				List<Map<String, Object>> reservationList = new ArrayList<Map<String,Object>>();
				try {
					String user_id = (String) request.getSession().getAttribute("sUserId");
					List<Map<String, Object>> resList = reservationService.selectReservationListById(user_id);
					code=1;
					url="";
					msg="예약리스트";
					reservationList.addAll(resList);
				} catch (Exception e) {
					e.printStackTrace();
					code=2;
					url="";
					msg="로그인 후 이용해주세요.";
				}

				
				resultMap.put("msg", msg);
				resultMap.put("code", code);
				resultMap.put("url", url);
				resultMap.put("data", reservationList);
				return resultMap;
			}
	
}
