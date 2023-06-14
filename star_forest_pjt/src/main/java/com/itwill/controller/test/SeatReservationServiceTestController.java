package com.itwill.controller.test;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.FilterType;
import org.springframework.context.annotation.ComponentScan.Filter;

import com.itwill.domain.SeatReservation;
import com.itwill.mapper.SeatReservationMapper;
import com.itwill.repository.SeatReservationDao;
import com.itwill.service.SeatReservationService;

@SpringBootApplication
@ComponentScan(basePackages = {"com.itwill"}, includeFilters = {
        @Filter(
                type = FilterType.ASSIGNABLE_TYPE, 
                classes = {SeatReservationService.class,SeatReservationMapper.class}
            )
        } )
public class SeatReservationServiceTestController {
	public static void main(String[] args) throws Exception{
	      SpringApplication application = 
	            new SpringApplication(SeatReservationTestController.class);
	      application.setWebApplicationType(WebApplicationType.NONE);
	      ConfigurableApplicationContext context=application.run(args);
	      SeatReservationService seatReservationService=(SeatReservationService)context.getBean(SeatReservationService.class);
	      //System.out.println(seatReservationDao.reservation(new SeatReservation("C01", null, null, null, 0, "hyeonjeong")));
	      //int rowCount = seatReservationService.reservation(new SeatReservation("A01", null, null, null, 0, "soyoon"));
	      //System.out.println(rowCount);
	      //좌석 테스트 완료
	      
	      //SeatReservation seat= seatReservationService.selectTimeUsingSeat("B01");
	      //System.out.println(seat.seat_date);
	      //int rowCount = seatReservationService.findByUser("soyoon");
	     // System.out.println(rowCount);
	      //SeatReservation findSeat = seatReservationService.findSeat("soyoon");
	      //System.out.println(findSeat);
	      System.out.println(seatReservationService.selectAll());
	   }
}
