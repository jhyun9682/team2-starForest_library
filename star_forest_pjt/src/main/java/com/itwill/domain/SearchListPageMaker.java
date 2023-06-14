package com.itwill.domain;

import java.util.*;

import com.itwill.util.PageMaker;
import com.itwill.util.SPageMaker;

// 리스트 페이지에서 출력에 필요한 테이블 데이터 및 페이징 처리에 필요한 정보빈
public class SearchListPageMaker {
	public List<Search> bookList; 		// 리스트 데이터 콜렉션
	public SPageMaker pageMaker;
	public int totRecordCount;
}
