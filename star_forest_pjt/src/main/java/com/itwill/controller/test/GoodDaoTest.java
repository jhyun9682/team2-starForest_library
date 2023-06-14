package com.itwill.controller.test;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.context.annotation.FilterType;

import com.itwill.mapper.GoodMapper;
import com.itwill.repository.GoodDao;
import com.itwill.service.GoodService;


@SpringBootApplication
@ComponentScan(basePackages = {"com.itwill"},
includeFilters= {@Filter(type= FilterType.ASSIGNABLE_TYPE,
				classes= {GoodDao.class,GoodService.class,GoodMapper.class}
		)
})
public class GoodDaoTest {
	public static void main(String[] args) throws Exception {
		SpringApplication application = 
				new SpringApplication(GoodDaoTest.class);
		application.setWebApplicationType(WebApplicationType.NONE);
		ConfigurableApplicationContext context=application.run(args);
		GoodDao goodDao=(GoodDao)context.getBean(GoodDao.class);
		GoodService goodService=(GoodService)context.getBean(GoodService.class);

		//분야 추천
	}
}
