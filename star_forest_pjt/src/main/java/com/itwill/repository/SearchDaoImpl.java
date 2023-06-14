package com.itwill.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.domain.Search;
import com.itwill.mapper.SearchMapper;
import com.itwill.util.Criteria;
import com.itwill.util.SCriteria;


@Repository
public class SearchDaoImpl implements SearchDao {
	

	
	@Autowired
	private SearchMapper searchMapper;
	

	//매퍼
	
	@Override
	public List<Search> searchList(Search search) throws Exception {
		return searchMapper.searchList(search);
	}


	@Override
	public List<Search> cateList(int category_no) throws Exception{
		return searchMapper.cateList(category_no);
	}


	@Override
	public List<Search> allList() throws Exception{
		return searchMapper.allList();
	}


	


	@Override
	public List<Search> listAll(int pageBegin, int pageEnd, SCriteria cri,int category_no) throws Exception {
		System.out.println("3.Dao-->"+cri);
		Map map=new HashMap();
		map.put("pageBegin",pageBegin);
		map.put("pageEnd",pageEnd);
		map.put("cri",cri);
		if(category_no==900) {
			map.put("category_no",null);
		}else {
			map.put("category_no",category_no);
		}
		System.out.println(">>>>>"+map);
		return searchMapper.listAll(map);
	}


	@Override
	public int categoryCount(int category_no) throws Exception {
		// TODO Auto-generated method stub
		return searchMapper.categoryCount(category_no);
	}


	@Override
	public List<Search> searching(Search search) throws Exception {
		// TODO Auto-generated method stub
		return searchMapper.searchList(search);
	}

	
	
	

/*
	public List<Search> getSearchList() {
		// TODO Auto-generated method stub
		return null;
	}

	public int getTotal(PageUtil page) {
		// TODO Auto-generated method stub
		return 0;
	}*/
/*
	@Autowired
	private SearchMapper searchMapper;

	//제목 검색
	@Override
	public List<Search> titleList(String keyword) throws Exception {
		return searchMapper.titleList(keyword);
	}

	//번호 검색
	@Override
	public Search selectByNo(int book_no) throws Exception {
		return searchMapper.selectByNo(book_no);
	}

	//저자 검색
	@Override
	public List<Search> authorList(String keyword) throws Exception {
		return searchMapper.authorList(keyword);
	}

	//분야명 검색
	@Override
	public List<Search> cateNameList(String keyword) throws Exception {
		return searchMapper.cateNameList(keyword);
	}

	//분야 번호 검색
	@Override
	public List<Search> cateNoList(int category_no) throws Exception {
		return searchMapper.cateNoList(category_no);
	}

	//출판사 검색
	@Override
	public List<Search> publisherList(String keyword) throws Exception {
		return searchMapper.publisherList(keyword);
	}

	//도서 전체 조회 
	@Override
	public List<Search> allList() throws Exception {
		return searchMapper.allList();
	}

	//통합 검색(제목, 저자, 분야, 출판사)
	@Override
	public List<Search> searchList(String keyword) throws Exception {
		return searchMapper.searchList(keyword);
	}
	
	*/
		
}
