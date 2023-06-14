package com.itwill.controller.test;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.FilterType;
import org.springframework.context.annotation.ComponentScan.Filter;

import com.itwill.domain.BookCategory;
import com.itwill.domain.BookClub;
import com.itwill.repository.BookClubDao;
import com.itwill.service.BookClubService;
import com.itwill.util.Criteria;

@SpringBootApplication
@ComponentScan(basePackages = { "com.itwill" }, includeFilters = {
		@Filter(type = FilterType.ASSIGNABLE_TYPE, 
				classes = { BookClubService.class, BookClubDao.class }) })
public class BookClubServiceTest {
	public static void main(String[] args) throws Exception{
		SpringApplication application = new SpringApplication(BookClubServiceTest.class);
		application.setWebApplicationType(WebApplicationType.NONE);
		ConfigurableApplicationContext context = application.run(args);
		BookClubService bookClubService 
			= (BookClubService) context.getBean(BookClubService.class);
		System.out.println("bookclub service test!!");
//		BookClub insert=new BookClub(0, "동아리제목", 8, "동아리대상", "매주 화요일", 
//									 "강남역 2번출구앞", "동아리내용", 2, 100, "yeji");
//		System.out.println(bookClubService.create(insert));
//		System.out.println(bookClubService.selectAll());
//		System.out.println(bookClubService.selectByCategory(200));
//		System.out.println(bookClubService.selectById("yeji"));
//		System.out.println(bookClubService.selectByNo(6));
//		System.out.println(bookClubService.isDuplicate("yeji", 5));
		//BookClub update = new BookClub(1, "제목수정", 9, "누구든환영", "시간수정", 
										//"장소수정", "내용수정", 2, 100, "yeji");
		//System.out.println(bookClubService.update(update));
//		System.out.println(bookClubService.clubJoin("yeji",4));
//		System.out.println(bookClubService.addReadCount(8));
//		System.out.println(bookClubService.remove(28));
		
//		System.out.println(bookClubService.selectAll(new Criteria(2,10)));
	}
}
