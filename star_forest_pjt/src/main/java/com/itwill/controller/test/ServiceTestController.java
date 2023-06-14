package com.itwill.controller.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.domain.Book;
import com.itwill.domain.Favorite;
import com.itwill.service.BookClubService;
import com.itwill.service.FavoriteService;

@Controller
public class ServiceTestController {
	@Autowired
	private FavoriteService favoriteService;
	@Autowired
	private BookClubService bookClubService;
	
	//내서재
	@RequestMapping("/favorite_service_test")
	public String favorite_service_test() throws Exception {
		System.out.println("favorite service test!!");
		
		Favorite favorite=new Favorite(0, "yeji", new Book(7, 0, null, null, null, null, null));
		System.out.println(favoriteService.insert(favorite));
		System.out.println(favoriteService.selectById("yeji"));
		System.out.println(favoriteService.selectByNo(3));
		System.out.println(favoriteService.deleteByNo(1));
		System.out.println(favoriteService.remove("soyoon"));
		
		
		return "test/test_result";
	}
}
