package com.itwill;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.SpringBootConfiguration;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
/*
 * BookLibraryTemplateApplication클래스를 기준으로 
 * 하위 모든 디렉토리에 있는 클래스들의 annotation을 읽어서 Container를 빈을생성
 * @SpringBootConfiguration
@EnableAutoConfiguration
@ComponentScan
이 세게를 @SpringBootApplication 얘가 해주는거임
 */
@SpringBootApplication
public class BookLibraryTemplateApplication {

	public static void main(String[] args) {
		SpringApplication.run(BookLibraryTemplateApplication.class, args);
	}

}
