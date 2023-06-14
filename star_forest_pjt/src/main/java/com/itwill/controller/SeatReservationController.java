package com.itwill.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.domain.SeatReservation;
import com.itwill.service.SeatReservationService;


@Controller
public class SeatReservationController {
	@Autowired
	private SeatReservationService seatReservationService;
	@RequestMapping("/seatReservation_list_partition")
	public String seat_list_partition(HttpServletRequest request) {
		String forwardPath="";
		try {
			List<SeatReservation> seatList = seatReservationService.selectAll();
			int rowCount= seatReservationService.resetAll();
			//seatReservationService.resetAll();
			request.setAttribute("seatList", seatList);
			forwardPath="forward:/WEB-INF/views/seatReservation_list_partition.jsp";
		}catch (Exception e) {
			e.printStackTrace();
		}
		return forwardPath;
	}
	
	@RequestMapping("/seatReservation_list_nopartition")
	public String seat_list_nopartition(HttpServletRequest request) {
		String forwardPath="";
		try {
			List<SeatReservation> seatList = seatReservationService.selectAll();
			int rowCount= seatReservationService.resetAll();
			//seatReservationService.resetAll();
			request.setAttribute("seatList", seatList);
			forwardPath="forward:/WEB-INF/views/seatReservation_list_nopartition.jsp";
		}catch (Exception e) {
			e.printStackTrace();
		}
		return forwardPath;
	}
	@RequestMapping("/seatReservation")
	public String seatReservation_main(Model model) {
		try {
			int count = seatReservationService.countAvailableSeat(0);
			int countAll = seatReservationService.countAll();
			model.addAttribute("available", count);
			model.addAttribute("all", countAll);
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		return "forward:/WEB-INF/views/seatReservation.jsp";
	}
	
	@RequestMapping("/seatReservation_my")
	public String seatReservation_my_main() {
		return "forward:/WEB-INF/views/seatReservation_my.jsp";
	}
}
