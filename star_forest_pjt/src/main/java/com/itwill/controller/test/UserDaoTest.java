package com.itwill.controller.test;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.FilterType;

import com.itwill.domain.User;
import com.itwill.mapper.UserMapper;
import com.itwill.repository.UserDao;

import org.springframework.context.annotation.ComponentScan.Filter;

@SpringBootApplication
@ComponentScan(basePackages = {"com.itwill"}, includeFilters = {
		@Filter(
				type=FilterType.ASSIGNABLE_TYPE,
				classes = {UserDao.class,UserMapper.class}
				)
			})
public class UserDaoTest {

	public static void main(String[] args) throws Exception {
		SpringApplication application=
				new SpringApplication(UserDaoTest.class);
		application.setWebApplicationType(WebApplicationType.NONE);
		ConfigurableApplicationContext context=application.run(args);
		UserDao userDao=(UserDao)context.getBean(UserDao.class);
		System.out.println("user dao test~~");
//		User user = new User("yeji2", "예지한", "1234", "han@gmail.com", "1995-01-30", "F", 
//							 "0102349808", "서울시 강남구", "qr", "대출가능",
//							  4, 80, 100);
//		System.out.println(userDao.create(user));
//		System.out.println(userDao.updatePassword(new User("yeji", null, "3445", null, 
//															null, null, null, null, null,
//															null, 0, 0, 500)));
//		
//		System.out.println(userDao.update(new User("soyoon", "소윤", "3333", "so@naver.com", 
//													"1991-03-03", null, "01023456789", "분당",0)));
//		System.out.println("삭제:"+userDao.remove("yeji3"));
//		System.out.println(userDao.userList());
//		System.out.println(userDao.findUser("yeji"));
//		System.out.println(userDao.existedUser("yeji"));
//		System.out.println(userDao.userRentalCount("yeji"));
//		System.out.println(userDao.rentalStopPeriod("yeji"));
		System.out.println(userDao.selectUserRentalStatus("hyeonjeong"));

	}
	
}
