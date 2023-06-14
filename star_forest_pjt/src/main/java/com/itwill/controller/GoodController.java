package com.itwill.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.domain.Good;
import com.itwill.service.GoodService;

//맞춤 추천
@Controller
public class GoodController {
	
	@Autowired
	private GoodService goodService;
	public GoodController() {
		
	}
	/*
	@RequestMapping(value = {"/good","*.do"})
	public String main() {
		return "forward:/WEB-INF/views/good.jsp";
	}
	
	@RequestMapping(value = {"/good_list"})
	public String good_list(@RequestParam int category_no, Model model) throws Exception{
		String forwardPath = "";
		List<Good> goodlist=goodService.goodCategoryNo(category_no);
		model.addAttribute("goodlist",goodlist);
		forwardPath = "forward:/WEB-INF/views/good_list.jsp";
		return forwardPath;
	}
*/
}
