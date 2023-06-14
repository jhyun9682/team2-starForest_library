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
import com.itwill.repository.BookDao;

@SpringBootApplication
@ComponentScan(basePackages = { "com.itwill" }, includeFilters = {
		@Filter(type = FilterType.ASSIGNABLE_TYPE, classes = { BookDao.class, BookMapper.class }) })
public class BookDaoTestController {

	public static void main(String[] args) throws Exception {
		SpringApplication application = new SpringApplication(BookDaoTestController.class);
		application.setWebApplicationType(WebApplicationType.NONE);
		ConfigurableApplicationContext context = application.run(args);
		BookDao bookDao = (BookDao) context.getBean(BookDao.class);
		Date date = new Date();
//		Book insertNBookd = new Book(0, 0, "책제목", "저자", "출판사", "책줄거리", "2022년 1월", date, "이미지", "이미지rul", 200, 3, 0, 0, 400,null);
//		System.out.println(bookDao.insertBook(insertNBookd));
//		System.out.println(bookDao.selectBookDetail(12));
// 		System.out.println(bookDao.updateRentalBookQty(1));
// 		System.out.println(bookDao.updateReturnBookQty(2));
//		System.out.println(bookDao.updateById("hyeonjeong")); 
//		System.out.println(bookDao.updateByIdNo("yeji",2)); 
//		System.out.println(bookDao.selectAll());
//		System.out.println(bookDao.updateRentalCnt(1));
//		System.out.println(bookDao.updateResCnt(2));
//		System.out.println(bookDao.selectAll());
//		System.out.println(bookDao.userBook("yeji"));
		System.out.println(bookDao.selectNew());
		//테스트 완료
	}

}
