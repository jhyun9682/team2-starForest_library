package com.itwill.controller.test;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.context.annotation.FilterType;

import com.itwill.domain.Search;
import com.itwill.mapper.SearchMapper;
import com.itwill.repository.SearchDao;
import com.itwill.service.SearchService;
import com.itwill.util.Criteria;

//검색 기능

@SpringBootApplication
@ComponentScan(basePackages = {"com.itwill"},
includeFilters= {@Filter(type= FilterType.ASSIGNABLE_TYPE,
				classes= {SearchDao.class,SearchService.class,SearchMapper.class}
		)
})
public class SearchServiceTest {
	public static void main(String[] args) throws Exception {
		SpringApplication application = 
				new SpringApplication(SearchServiceTest.class);
		application.setWebApplicationType(WebApplicationType.NONE);
		ConfigurableApplicationContext context=application.run(args);
		SearchService searchService=(SearchService)context.getBean(SearchService.class);
		
		//System.out.println("제목>>"+searchService.searchList(new Search(0, "축구", null, null, null)));
		
		//System.out.println("분야>>"+searchService.cateList(700));
		Criteria cri1=new Criteria(2, 10);
		Criteria cri2=new Criteria(1, 10);
		//searchService.listAll(cri1,100);
		//searchService.listAll(cri2,200);
		
		//제목 검색
		
		//번호 검색
		
		//분야명 검색
		//분야번호 검색
		
		//출판사 검섹
		
		//저자 검색
		
		//통합 검색
		
		//도서 전체 리스트
		
	}
}
