package com.itwill.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.domain.Reservation;
import com.itwill.domain.Search;
import com.itwill.domain.SearchListPageMaker;
import com.itwill.service.SearchService;
import com.itwill.util.Criteria;
import com.itwill.util.PageMaker;
import com.itwill.util.SCriteria;
import com.itwill.util.SPageMaker;

//검색기능
@RestController
public class SearchRestController {
	
	@Autowired
	private SearchService searchService;
	
	//페이징
	@RequestMapping(value="/search_list_json", produces = "application/json;charset=UTF-8")
	public Map search_list_json(SCriteria cri,@RequestParam int category_no,Model model) {
		Map resultMap = new HashMap();
		int code=1;
		String url="";
		String msg="";
        System.out.println("Controller:"+cri);
        SearchListPageMaker listPageMaker=null;
        List<SPageMaker> pageMakerList =null;
        try {
        	cri.setAmount(8);
        	listPageMaker=searchService.listAll(cri,category_no);
        	pageMakerList = new ArrayList<>();
			pageMakerList.add(listPageMaker.pageMaker);
			code=1;
			url="";
			msg="성공";
        }catch(Exception e) {
        	
        	code=2;
			msg="에러";
			e.printStackTrace();
        	
        }
    	resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data",listPageMaker.bookList);
		resultMap.put("pageMaker", pageMakerList);
		resultMap.put("category_no", category_no);
		
		System.out.println(listPageMaker.bookList);
		
		return resultMap;
		
	}
	/*
	//카테고리
	@PostMapping("/search_category")
	public Map search_category(@RequestParam int category_no) throws Exception {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<Search> resultList = new ArrayList<Search>();

		resultList = searchService.cateList(category_no);
		code = 1;
		url = "";
		msg = "조회성공";

		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);
		return resultMap;

	}
	*/
	//도서 리스트
	/*
	@GetMapping("/book_list")
	public Map book_list() throws Exception {
		Map resultMap = new HashMap();
		int code = 2;
		String url = "";
		String msg = "";
		List<Search> resultList = new ArrayList<Search>();

		resultList = searchService.allList();
		code = 1;
		url = "";
		msg = "조회성공";
		resultList.addAll(resultList);

		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);
		return resultMap;
	}
	*/
	
	

	
	
}
