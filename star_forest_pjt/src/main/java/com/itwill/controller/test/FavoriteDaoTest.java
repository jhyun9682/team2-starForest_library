package com.itwill.controller.test;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.FilterType;
import org.springframework.context.annotation.ComponentScan.Filter;

import com.itwill.mapper.FavoriteMapper;
import com.itwill.repository.FavoriteDao;

@SpringBootApplication
@ComponentScan(basePackages = {"com.itwill"}, includeFilters = {
		@Filter(
				type=FilterType.ASSIGNABLE_TYPE,
				classes = {FavoriteDao.class,FavoriteMapper.class}
				)
			})
public class FavoriteDaoTest {
	public static void main(String[] args) throws Exception {
		SpringApplication application=
				new SpringApplication(FavoriteDaoTest.class);
		application.setWebApplicationType(WebApplicationType.NONE);
		ConfigurableApplicationContext context=application.run(args);
		FavoriteDao favoriteDao=(FavoriteDao)context.getBean(FavoriteDao.class);
		System.out.println("favorite dao test~~~");
		//System.out.println(favoriteDao.insert(new Favorite(0, "yeji", 8)));
		System.out.println(favoriteDao.isExisted("yeji", 1));
		System.out.println(favoriteDao.selectById("yeji"));
		System.out.println(favoriteDao.selectByNo(3));
		System.out.println(favoriteDao.deleteByNo(5));
		System.out.println(favoriteDao.remove("yeji"));
	}
}
