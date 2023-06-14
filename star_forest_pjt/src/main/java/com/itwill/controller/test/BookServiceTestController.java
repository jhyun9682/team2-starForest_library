package com.itwill.controller.test;

import java.util.Date;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.FilterType;
import org.springframework.context.annotation.ComponentScan.Filter;

import com.itwill.domain.Book;
import com.itwill.mapper.BookMapper;
import com.itwill.service.BookService;

@SpringBootApplication
@ComponentScan(basePackages = { "com.itwill" }, includeFilters = {
		@Filter(type = FilterType.ASSIGNABLE_TYPE, classes = { BookService.class, BookMapper.class }) })

public class BookServiceTestController {

	public static void main(String[] args) throws Exception {
		SpringApplication application = new SpringApplication(BookServiceTestController.class);
		application.setWebApplicationType(WebApplicationType.NONE);
		ConfigurableApplicationContext context = application.run(args);
		BookService bookService = (BookService) context.getBean(BookService.class);
		Date date = new Date();
		Book insertNBookd = new Book(0, 0, "책제목서비스", "저자", "출판사", "책줄거리", "2022년 1월", date, "이미지", "이미지rul", 200, 3, 0, 0, 400);
		System.out.println(bookService.insertBook(insertNBookd));
//		System.out.println(bookService.selectBookDetail(12));
// 		System.out.println(bookService.updateRentalBookQty(1));
// 		System.out.println(bookService.updateReturnBookQty(2));
//		System.out.println(bookService.updateById("hyeonjeong")); 
//		System.out.println(bookService.updateByIdNo("yeji",2)); 
//		System.out.println(bookService.selectAll());
//		System.out.println(bookService.updateRentalCnt(1));
//		System.out.println(bookService.updateResCnt(2));
		//테스트 완료
	}

}
