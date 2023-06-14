package com.itwill.controller.test;

import java.util.Date;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.FilterType;
import org.springframework.context.annotation.ComponentScan.Filter;

import com.itwill.domain.Reservation;
import com.itwill.mapper.ReservationMapper;
import com.itwill.service.ReservationService;


@SpringBootApplication
@ComponentScan(basePackages = { "com.itwill" }, includeFilters = {
		@Filter(
				type = FilterType.ASSIGNABLE_TYPE, 
				classes = { ReservationService.class, ReservationMapper.class 
				}) 
		})
public class ReservationServiceTest {
	public static void main(String[] args) throws Exception {
		SpringApplication application=
				new SpringApplication(ReservationServiceTest.class);
		application.setWebApplicationType(WebApplicationType.NONE);
		ConfigurableApplicationContext context=application.run(args);
		ReservationService reservationService=(ReservationService)context.getBean(ReservationService.class);
		Date date = new Date();
		Reservation newRes = new Reservation(100, date, 1, 100, "woohyuk");
//		System.out.println(reservationService.resCheckDupli("woohyuk", 100));
//		System.out.println(reservationService.insertReservation(newRes));
//		System.out.println(reservationService.deleteReservation("woohyuk", 100));
		System.out.println(reservationService.deleteReservation("yeji", 3));
//		System.out.println(reservationService.selectReservationList(3));
//		System.out.println(reservationService.selectReservationListById("hyeonjeong"));
	
	}
}
//테스트완료