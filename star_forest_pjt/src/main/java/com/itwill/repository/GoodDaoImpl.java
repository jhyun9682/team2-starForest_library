package com.itwill.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.domain.Good;
//추천도서
import com.itwill.domain.GoodSQL;
import com.itwill.mapper.GoodMapper;

@Repository
public class GoodDaoImpl implements GoodDao{
	@Autowired
	private GoodMapper goodMapper;
	
//분야추천
	@Override
	public List<Good> goodList(int category_no) throws Exception{
		return goodMapper.GoodList(category_no);
}
	
	
}