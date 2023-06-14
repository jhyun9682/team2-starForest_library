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
import com.itwill.repository.ReservationDao;

/**
 * @author itwill
 *
 */
@SpringBootApplication
@ComponentScan(basePackages = { "com.itwill" }, includeFilters = {
		@Filter(
				type = FilterType.ASSIGNABLE_TYPE, 
				classes = { ReservationDao.class, ReservationMapper.class 
				}) 
		})
public class ReservationDaoTest {
	public static void main(String[] args) throws Exception {
		SpringApplication application=
				new SpringApplication(ReservationDaoTest.class);
		application.setWebApplicationType(WebApplicationType.NONE);
		ConfigurableApplicationContext context=application.run(args);
		ReservationDao reservationDao=(ReservationDao)context.getBean(ReservationDao.class);
		Date date = new Date();
		Reservation newRes = new Reservation(100, date, 1, 100, "woohyuk");
//		System.out.println(reservationDao.insertReservation(newRes));
//		System.out.println(reservationDao.deleteReservation("woohyuk", 100));
		System.out.println(reservationDao.selectReservationList(3));
	
	}
}
//테스트완료