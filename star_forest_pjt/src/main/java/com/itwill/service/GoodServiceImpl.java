package com.itwill.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.domain.Good;
import com.itwill.repository.GoodDao;

public class GoodServiceImpl implements GoodService{
	@Autowired
	private GoodDao goodDao;
	
	public GoodServiceImpl() {
		// TODO Auto-generated constructor stub
	}
	
	

	@Override
	public List<Good> goodList(int category_no) throws Exception {
		return goodDao.goodList(category_no);
	}
	

}
