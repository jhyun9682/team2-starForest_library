package com.itwill.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.controller.interceptor.LoginCheck;
import com.itwill.domain.Reservation;
import com.itwill.service.ReservationService;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService reservationService;
	
	//회원이 예약한 예약 리스트 뽑기
		@LoginCheck
		@RequestMapping("/userbook_status")
		public String user_book_status(String user_id, HttpSession sesstion, HttpServletRequest request) {
			String forwardPath="";
			try {
				user_id = (String) request.getSession().getAttribute("sUserId");
				System.out.println(user_id);
				List<Map<String, Object>> resList = reservationService.selectReservationListById(user_id);
				request.setAttribute("resList", resList);
				forwardPath="forward:/WEB-INF/views/userbook_status.jsp";
			} catch (Exception e) {
				e.printStackTrace();
			}

			return forwardPath;
		}

}
