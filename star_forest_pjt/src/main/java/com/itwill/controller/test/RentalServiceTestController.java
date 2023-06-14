package com.itwill.controller.test;

import java.util.Date;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.FilterType;
import org.springframework.context.annotation.ComponentScan.Filter;

import com.itwill.domain.Rental;
import com.itwill.mapper.RentalMapper;
import com.itwill.service.RentalService;

@SpringBootApplication
@ComponentScan(basePackages = { "com.itwill" }, includeFilters = {
		@Filter(type = FilterType.ASSIGNABLE_TYPE, classes = { RentalService.class, RentalMapper.class }) })
public class RentalServiceTestController {

	public static void main(String[] args) throws Exception {
		SpringApplication application = new SpringApplication(RentalServiceTestController.class);
		application.setWebApplicationType(WebApplicationType.NONE);
		ConfigurableApplicationContext context = application.run(args);
		RentalService rentalService = (RentalService) context.getBean(RentalService.class);
//		Date date = new Date();
//		Rental newRental = new Rental(66, date, date, date, 1, 90, "hyeonjeong");
//		System.out.println(rentalService.updateDate("hyeonjeong", 4));
//		System.out.println(rentalService.selectById("hyeonjeong")); //리스트 렌탈이라서 렌탈정보만 나옴 이게맞나 --> 렌탈테이블추가해서 모두 출력완료
//		System.out.println(rentalService.selectByNo(2)); 
//		System.out.println(rentalService.updateRentalStatus("hyeonjeong", 14));
//		System.out.println(rentalService.updateRentalStatusOverdue(3));
//		System.out.println(rentalService.selectMostReturn_duedate(2));	
//		System.out.println(rentalService.selectByIdTotalList("hyeonjeong"));
//		System.out.println(rentalService.insertRental(newRental));
//		System.out.println(rentalService.bookCheckDupli("hyeonjeong", 700));
//		System.out.println(rentalService.rentalFiveLimit("hyeonjeong"));
//		System.out.println(rentalService.selectNowLental());
//		System.out.println(rentalService.searchSelectById("hyeonjeong"));
		System.out.println(rentalService.onceExtend("hyeonjeong", 50));
		
	}

}
//일단 테스트 완료
	
