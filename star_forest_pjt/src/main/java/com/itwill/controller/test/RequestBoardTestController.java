package com.itwill.controller.test;

import java.util.ArrayList;
import java.util.List;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.FilterType;
import org.springframework.context.annotation.ComponentScan.Filter;

import com.itwill.domain.RequestBoard;
import com.itwill.mapper.RequestBoardMapper;
import com.itwill.repository.RequestBoardDao;

@SpringBootApplication
@ComponentScan(basePackages = {"com.itwill"}, includeFilters = {
        @Filter(
                type = FilterType.ASSIGNABLE_TYPE, 
                classes = {RequestBoardDao.class,RequestBoardMapper.class}
            )
        } )
public class RequestBoardTestController {

	public static void main(String[] args) throws Exception {
		SpringApplication application = 
	            new SpringApplication(RequestBoardTestController.class);
	      application.setWebApplicationType(WebApplicationType.NONE);
	      ConfigurableApplicationContext context=application.run(args);
	      RequestBoardDao requestBoardDao=(RequestBoardDao)context.getBean(RequestBoardDao.class);
	      //int rowCount = requestBoardDao.create(new RequestBoard(0, "피프티피플 신청합니다", 
	    		  					//null, "피프티피플 보고싶어요", 0, null, 0, 0, 0, 0, 700, "woohyuck"));
	      //System.out.println(rowCount);
	      /* 답글구현 테스트 다시 해야됨..
	       * int rowCount = requestBoardDao.createReply(new RequestBoard(0, "[re]피프티피플 신청합니다", null, "신청완료됐습니다", 0, "신청접수완료", 0, 0, 0, 21, 700, "manager"));
	      
	     	 System.out.println(rowCount);
	       */
	    //System.out.println(requestBoardDao.findUserBoard("soyoon"));
	    //System.out.println(requestBoardDao.isExisted(21));
	    //System.out.println(requestBoardDao.update(new RequestBoard(8, "수정", null, "수정", 0, null, 0, 0, 0, 0, 100, null)));
	    //System.out.println(requestBoardDao.addReadCount(8));
	      
	    //System.out.println(requestBoardDao.selectAll());  
	   // System.out.println(requestBoardDao.countAll(5));
	    System.out.println(requestBoardDao.selectOne(8));
	    //List<RequestBoard> itemList = new ArrayList();
	    //System.out.println(requestBoardDao.list(itemList.get(3)));
	    
	    //일단 테스트 완료
	    //테스트 다시 해봐야할 것 : 답글구현/페이지에 있는 게시물 시작번호,끝번호//답글존재여부 다시 확인
	}

}
