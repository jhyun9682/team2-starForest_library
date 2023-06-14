package com.itwill.controller.test;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.FilterType;
import org.springframework.context.annotation.ComponentScan.Filter;

import com.itwill.domain.Book;
import com.itwill.domain.Favorite;
import com.itwill.repository.FavoriteDao;
import com.itwill.service.FavoriteService;

@SpringBootApplication
@ComponentScan(basePackages = {"com.itwill"}, includeFilters = {
		@Filter(
				type=FilterType.ASSIGNABLE_TYPE,
				classes = {FavoriteService.class,FavoriteDao.class}
				)
			})
public class FavoriteServiceTest {
public static void main(String[] args) throws Exception {
	SpringApplication application=
			new SpringApplication(FavoriteServiceTest.class);
	application.setWebApplicationType(WebApplicationType.NONE);
	ConfigurableApplicationContext context=application.run(args);
	FavoriteService favoriteService=(FavoriteService)context.getBean(FavoriteService.class);
	System.out.println("favorite service test!!");
	System.out.println(favoriteService.insert(new Favorite(0, "yeji", new Book(7, 0, null, null, null, null, null))));
	System.out.println(favoriteService.selectById("yeji"));
	System.out.println(favoriteService.selectByNo(3));
	System.out.println(favoriteService.deleteByNo(1));
	System.out.println(favoriteService.remove("soyoon"));
}
}
