package com.itwill.controller.test;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.FilterType;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.domain.Book;
import com.itwill.domain.Rental;
import com.itwill.mapper.BookMapper;
import com.itwill.mapper.RentalMapper;
import com.itwill.repository.BookDao;
import com.itwill.repository.RentalDao;

@SpringBootApplication
@ComponentScan(basePackages = { "com.itwill" }, includeFilters = {
		@Filter(type = FilterType.ASSIGNABLE_TYPE, classes = { RentalDao.class, RentalMapper.class }) })
public class RentalDaoTestController {

	public static void main(String[] args) throws Exception {
		SpringApplication application = new SpringApplication(RentalDaoTestController.class);
		application.setWebApplicationType(WebApplicationType.NONE);
		ConfigurableApplicationContext context = application.run(args);
		RentalDao rentalDao = (RentalDao) context.getBean(RentalDao.class);
//		System.out.println(rentalDao.updateDate("hyeonjeong", 4));
//		System.out.println(rentalDao.selectById("hyeonjeong")); //리스트 렌탈이라서 렌탈정보만 나옴 이게맞나 --> 렌탈테이블추가해서 모두 출력완료
//		System.out.println(rentalDao.selectByNo(2)); 
//		System.out.println(rentalDao.updateRentalStatus("yeji", 2));
//		System.out.println(rentalDao.updateRentalStatusOverdue(3));
//		System.out.println(rentalDao.selectMostReturn_duedate(3));
//		System.out.println(rentalDao.selectByIdTotalList("hyeonjeong"));
		System.out.println(rentalDao.selectNowLental());
		
	}

}
//일단 테스트 완료
	
