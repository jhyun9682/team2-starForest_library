package com.itwill.controller.test;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScan.Filter;

import com.itwill.domain.User;
import com.itwill.mapper.UserMapper2;
import com.itwill.repository.UserDao2;
import com.itwill.service.UserService2;

import org.springframework.context.annotation.FilterType;

@SpringBootApplication
@ComponentScan(basePackages = {"com.itwill"},
includeFilters= {@Filter(type= FilterType.ASSIGNABLE_TYPE,
				classes= {UserDao2.class,UserService2.class,UserMapper2.class}
		)
})

public class User2Test {
	public static void main(String[] args) throws Exception {
		SpringApplication application = 
				new SpringApplication(User2Test.class);
		application.setWebApplicationType(WebApplicationType.NONE);
		ConfigurableApplicationContext context=application.run(args);
		UserService2 userService2=(UserService2)context.getBean(UserService2.class);
		
		
		//회원가입_성공
		User user=new User("aaa","가나다","9999","aaa@naver.com","1999-01-01","F","010-9999-9999","서울시 강남구 역삼동", 700);
		System.out.println("회원가입+"+userService2.insertUser(user));
		
		//회원 아이디 검색_내정보_성공
		System.out.println("내정보");
		System.out.println(userService2.selectByUserId("junghyun"));
		
		//정보수정_성공
		User updateUser=new User("aaa","홍길동","8888","bbb@naver.com","1990-10-10","F","010-8888-8888","서울시 은평구 역삼동", 500);
		System.out.println("정보수정+"+userService2.updateUser(updateUser));
		
		
		//회원탈퇴_안됨
		//System.out.println("회원 탈퇴::"+userService2.deleteUser("aaa","8888"));
		
		
		//회원리스트_성공
		System.out.println("회원리스트>>>>>>"+userService2.selectAll());
		
		//아이디중복_성공
		System.out.println("아이디중복+"+userService2.existUserId("jjjj"));//false
		System.out.println("아이디중복+"+userService2.existUserId("admin"));//true
		
		//전화번호 중복_성공
		System.out.println("전화번호 중복>>>"+userService2.existUserPhone("01011112222"));//false
		System.out.println("전화번호 중복>>>"+userService2.existUserPhone("01025894567"));//false
		System.out.println("전화번호 중복>>>"+userService2.existUserPhone("01012345678"));//true
		
		//이메일 중복_성공
		System.out.println("이메일 중복>>>"+userService2.existUserEmail("jjjj@naver.com"));//false
		System.out.println("이메일 중복>>>"+userService2.existUserEmail("soyun@naver.com"));//true
		
		//아이디 찾기_성공
		System.out.println("아이디 찾기>>>"+userService2.findId("이우혁", "01012345678"));//woohyuk

		//비밀번호 찾기_성공
		System.out.println("비밀번호 찾기>>>"+userService2.findPassword("soyoon", "soyun@naver.com"));//2222
		
}
}