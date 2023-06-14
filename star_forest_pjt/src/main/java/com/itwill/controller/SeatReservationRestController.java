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
import org.springframework.web.bind.annotation.RestController;

import com.itwill.controller.interceptor.LoginCheck;
import com.itwill.domain.SeatReservation;
import com.itwill.service.SeatReservationService;

@RestController
public class SeatReservationRestController {
		@Autowired
		private SeatReservationService seatReservationService;
		
		/*
		 * 로그인체크
		 */
		@LoginCheck
		@GetMapping(value="/login_check",produces = "application/json;charset=UTF-8")
		public Map login_check(HttpSession session) {
			Map resultMap = new HashMap();
			String msg="";
			int code=-999;
			if(session.getAttribute("sUserId")==null) {
				msg="로그인 후 이용해주세요";
				code=2;
			}else {
				code=1;
			}
			resultMap.put("msg", msg);
			resultMap.put("code", code);
			return resultMap;
			
		}
		
		/*
		 * 좌석 예약
		 */
		@LoginCheck
		@PostMapping(value="/seat_reservation_action_json", produces = "application/json;charset=UTF-8")
		public Map seat_reservation_action_json(@ModelAttribute SeatReservation seatReservation,HttpSession session) {
			Map resultMap = new HashMap();
			int code = 1;
			String url = "";
			String msg = "";
			List<SeatReservation> resultList = new ArrayList<SeatReservation>();
			try {
				//String userId = (String)session.getAttribute("userId");
				//userId = "yeji";
				//int rowCount = seatReservationService.reservation(new SeatReservation(null, null, null, null, 0, userId));
				String sUserId = (String)session.getAttribute("sUserId");
				int rowCount = seatReservationService.findByUser(sUserId);
				seatReservation.setUser_id(sUserId);
				if(rowCount==1) {
					code=0;
					msg="이미 예약하고 있는 좌석이 있습니다";
				}else if(rowCount==0){
					int reservationCount = seatReservationService.reservation(new SeatReservation(seatReservation.getSeat_no(), null, null, null, 0, seatReservation.getUser_id()));
						code=1;
						msg="예약이 완료되었습니다. 종료시간이 지나면 자동으로 반납됩니다.";
			}
				}catch (Exception e) {
				code = 2;
				msg="로그인 후 사용해주세요";
				e.printStackTrace();
			}
			resultMap.put("code", code);
			resultMap.put("url", url);
			resultMap.put("msg", msg);
			resultMap.put("data", resultList);
			return resultMap;
		}
		/*
		 * 좌석반납
		 */
		@PostMapping(value="/seat_return_action_json", produces = "application/json;charset=UTF-8")
		public Map seat_return_action_json(@ModelAttribute SeatReservation seatReservation) {
			Map resultMap = new HashMap();
			int code = 1;
			String url = "";
			String msg = "";
			List<SeatReservation> resultList = new ArrayList<SeatReservation>();
			try {
				//String userId = (String)session.getAttribute("userId");
				//userId = "soyoon";
				int rowCount = seatReservationService.returnByUser(seatReservation);
				if(rowCount ==1) {
					code=1;
					url="seatReservation";
				}
			}catch (Exception e) {
				code = 2;
				msg="반납에러";
				e.printStackTrace();
			}
			resultMap.put("code", code);
			resultMap.put("url", url);
			resultMap.put("msg", msg);
			resultMap.put("data", resultList);
			return resultMap;
		}
		/*
		 * 내좌석정보
		 */
		@GetMapping(value="/my_seat_json",produces="application/json;charset=UTF-8")
		public Map my_seat_json(HttpSession session) {
			Map resultMap = new HashMap();
			int code=1;
			String msg="";
			String url="";
			List<SeatReservation> resultList = new ArrayList<SeatReservation>();
			
			try {
				String sUserId = (String)session.getAttribute("sUserId");
				SeatReservation seatReservation = seatReservationService.findSeat(sUserId);
				seatReservationService.returnByAuto(seatReservation);
				resultList.add(seatReservation);
				code=1;
				msg="";
				
			}catch (Exception e) {
				code=2;
				e.printStackTrace();
				msg="나의 좌석 정보 불러오기 에러";
			}
			resultMap.put("code", code);
			resultMap.put("url", url);
			resultMap.put("msg", msg);
			resultMap.put("data", resultList);
			return resultMap;
		}
		
		/*
		 * 연장
		 */
		@PostMapping(value="/seat_continue_action_json",produces = "application/json;charset=UTF-8")
		public Map my_seat_continue(String user_id, HttpSession session) {
			Map resultMap = new HashMap();
			int code=1;
			String msg="";
			String url="";
			List<SeatReservation> resultList = new ArrayList<SeatReservation>();

			try {
				String sUserId = (String)session.getAttribute("sUserId");
				user_id = sUserId;
				int rowCount = seatReservationService.continueSeat(sUserId);
				if(rowCount==1){
					code=1;
					msg="+2시간 연장되었습니다.";
				}else if(rowCount==0){
					code=2;
					msg="이용시간 30분 남았을때만 연장 가능합니다.";
				}
			}catch (Exception e) {
				e.printStackTrace();
				msg="뭔가가 걍 잘못됨";
			}
			resultMap.put("msg", msg);
			resultMap.put("code", code);
			resultMap.put("url", url);
			resultMap.put("data", resultList);
			return resultMap;
		}
		
}
