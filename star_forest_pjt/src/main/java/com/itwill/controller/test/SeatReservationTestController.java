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

@SpringBootApplication
@ComponentScan(basePackages = {"com.itwill"}, includeFilters = {
        @Filter(
                type = FilterType.ASSIGNABLE_TYPE, 
                classes = {SeatReservationDao.class,SeatReservationMapper.class}
            )
        } )
public class SeatReservationTestController {

   public static void main(String[] args) throws Exception{
      SpringApplication application = 
            new SpringApplication(SeatReservationTestController.class);
      application.setWebApplicationType(WebApplicationType.NONE);
      ConfigurableApplicationContext context=application.run(args);
      SeatReservationDao seatReservationDao=(SeatReservationDao)context.getBean(SeatReservationDao.class);
      //System.out.println(seatReservationDao.reservation(new SeatReservation("C01", null, null, null, 0, "hyeonjeong")));
      System.out.println(seatReservationDao.selectAll());
      //System.out.println(seatReservationDao.countAvailableSeat(0));
      //System.out.println(seatReservationDao.selectAvailableSeat(0));
     //SeatReservation usingSeat = seatReservationDao.selectTimeUsingSeat("B01");
      //System.out.println(usingSeat);
      //System.out.println(seatReservationDao.returnByAuto(usingSeat));
      
      //좌석 테스트 완료
   }

}