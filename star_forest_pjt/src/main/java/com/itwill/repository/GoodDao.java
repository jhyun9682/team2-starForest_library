package com.itwill.repository;

import java.util.List;

import com.itwill.domain.Good;

//추천도서
public interface GoodDao {

	//분야 추천
	List<Good> goodList(int category_no) throws Exception;
	
	//ArrayList<Good> goodCategoryNo (String keyword) throws Exception;
}
