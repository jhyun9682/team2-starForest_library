package com.itwill.controller.test;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.FilterType;

import com.itwill.domain.User;
import com.itwill.repository.UserDao;
import com.itwill.service.UserService;

import org.springframework.context.annotation.ComponentScan.Filter;



@SpringBootApplication
@ComponentScan(basePackages = {"com.itwill"}, includeFilters = {
		@Filter(
				type=FilterType.ASSIGNABLE_TYPE,
				classes = {UserService.class,UserDao.class}
				)
			})
public class UserServiceTest {
	public static void main(String[] args) throws Exception {
		SpringApplication application=new SpringApplication(UserServiceTest.class);
		application.setWebApplicationType(WebApplicationType.NONE);
		ConfigurableApplicationContext context=application.run(args);
		UserService userService=(UserService)context.getBean(UserService.class);
		System.out.println("user service test!!");
		User user=new User("yeji3", "예지3", "3333", "ye@naver.com", "1995-02-02", "F", 
							"01025894567", "서울시강남구", "qr", "대출가능", 3, 89, 300);
		System.out.println("가입:"+userService.create(user));
		
		System.out.println("비밀번호변경:"+userService.updatePassword(new User("soyoon", "4567")));
		
		User updateUser=new User("yeji2", "예찌", "1234", "han@naver.com", 
									"1997-03-03", null, "01023456789", "서울", 0);
		System.out.println("수정:"+userService.update(updateUser));
		System.out.println("삭제:"+userService.remove("yeji3"));
		System.out.println("회원목록"+userService.userList());
		System.out.println("아이디찾기:"+userService.findUser("yeji2"));
		System.out.println("아이디중복체크:"+userService.existedUser("soyoon"));
		System.out.println("대출가능권수카운트:"+userService.userRentalCount("junghyun"));
		System.out.println(userService.rentalStopPeriod("yeji"));
	}
}
