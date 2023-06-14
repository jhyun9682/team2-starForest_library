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
import com.itwill.mapper.BookClubMapper;
import com.itwill.repository.BookClubDao;
import com.itwill.repository.FavoriteDao;
import com.itwill.util.Criteria;

/**
 * @author itwill
 *
 */
@SpringBootApplication
@ComponentScan(basePackages = { "com.itwill" }, includeFilters = {
		@Filter(
				type = FilterType.ASSIGNABLE_TYPE, 
				classes = { BookClubDao.class, BookClubMapper.class 
				}) 
		})
public class BookClubDaoTest {
	public static void main(String[] args) throws Exception {
		SpringApplication application=
				new SpringApplication(BookClubDaoTest.class);
		application.setWebApplicationType(WebApplicationType.NONE);
		ConfigurableApplicationContext context=application.run(args);
		BookClubDao bookClubDao=(BookClubDao)context.getBean(BookClubDao.class);
		System.out.println("bookClub dao test~~");
		// 동아리생성
		BookClub bookClub = new BookClub(0, "동아리제목", 8, "동아리대상", "매주 화요일", 
										 "강남역 2번출구앞", "동아리내용", 2, 100, "yeji");
		System.out.println(bookClubDao.create(bookClub));
		System.out.println(bookClubDao.selectAll(new Criteria(0, 0)));
		System.out.println(bookClubDao.selectByCategory(200));
		System.out.println(bookClubDao.selectById("yeji"));
		System.out.println(bookClubDao.selectByNo(3));
		System.out.println(bookClubDao.isDuplicate("yeji", 5));

		// 동아리수정
		BookClub update = new BookClub(1, "제목수정", 9, "누구든환영", "시간수정", 
										"장소수정", "내용수정", 2, 100, "yeji");
		System.out.println(bookClubDao.update(update));
		System.out.println(bookClubDao.clubJoin("yeji",6));
		System.out.println(bookClubDao.addReadCount(3));
		System.out.println(bookClubDao.remove(20));
	}
}
