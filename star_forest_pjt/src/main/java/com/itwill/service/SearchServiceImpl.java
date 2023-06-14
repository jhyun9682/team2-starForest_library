package com.itwill.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.domain.Search;
import com.itwill.domain.SearchListPageMaker;
import com.itwill.repository.SearchDao;
import com.itwill.util.Criteria;
import com.itwill.util.PageMaker;
import com.itwill.util.SCriteria;
import com.itwill.util.SPageMaker;

//검색기능
@Service
public class SearchServiceImpl  implements SearchService{
	
	
	@Autowired
	private SearchDao searchDao;
	
	public SearchServiceImpl() {
	}
	
	@Override
	public List<Search> searchList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return searchDao.searchList(search);
	}

	@Override
	public List<Search> cateList(int category_no) throws Exception {
		// TODO Auto-generated method stub
		return searchDao.cateList(category_no);
	}

	@Override
	public List<Search> allList() throws Exception {
		// TODO Auto-generated method stub
		return searchDao.allList();
	}


	@Override
	public SearchListPageMaker listAll(SCriteria cri,int category_no) throws Exception {
		
		SearchListPageMaker bookListPageMaker=new SearchListPageMaker();
		int totCount=searchDao.categoryCount(category_no);
		System.out.println("1. Service totCount==>"+totCount);
		SPageMaker pageMaker=new SPageMaker(cri, totCount);
		System.out.println("2. pageMaker ==>"+pageMaker);
		List<Search> bookList=searchDao.listAll(pageMaker.getPageBegin(),pageMaker.getPageEnd(),cri,category_no);
		System.out.println("3. category_no ==>"+category_no);
		System.out.println("4. bookList ==>"+bookList);
		bookListPageMaker.bookList=bookList;
		bookListPageMaker.pageMaker=pageMaker;
		bookListPageMaker.totRecordCount=totCount;
		
		return bookListPageMaker;
	}




	//빈칸체크
	
/*
	//제목 검색
	@Override
	public List<Search> titleList(String keyword) throws Exception {
		return searchDao.titleList(keyword);
	}

	//번호검색
	@Override
	public Search selectByNo(int book_no) throws Exception {
		return searchDao.selectByNo(book_no);
	}

	//저자검색
	@Override
	public List<Search> authorList(String keyword) throws Exception {
		return searchDao.authorList(keyword);
	}

	//분야명 검색
	@Override
	public List<Search> cateNameList(String keyword) throws Exception {
		return searchDao.cateNameList(keyword);
	}

	//분야 번호 검색
	@Override
	public List<Search> cateNoList(int category_no) throws Exception {
		return searchDao.cateNoList(category_no);
	}

	//출판사검색
	@Override
	public List<Search> publisherList(String keyword) throws Exception {
		return searchDao.publisherList(keyword);
	}

	//도서 리스트
	@Override
	public List<Search> allList() throws Exception {
		return searchDao.allList();
	}

	//통합검색
	@Override
	public List<Search> searchList(String keyword) throws Exception {
		return searchDao.searchList(keyword);
	}
	
	*/
	
	
}
