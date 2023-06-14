package com.itwill.domain;
//검색 기능
public class SearchSQL {

	//제목 검색
	public static final String BOOK_SELECT_BY_TITLE
	="select * from book where book_title like ?";
	
	public static final String BOOK_SELECT_BY_TITLE_LIST
	="select * from (select rownum idx, s.* from (select * from book where book_title like ? order by book_title) s) where idx >= ? and idx <= ?";
	
	
	//통합 검색(제목,저자,카테고리,출판사)
	public static final String BOOK_SELECT_ALL
	="select b.*,bc.category_name from book b left join  book_category bc on b.category_no=bc.category_no where book_title like ? or book_author like ? or bc.category_name like ? or book_publisher like ?";
	
	public static final String BOOK_SELECT_ALL_LIST
	="select b.*,bc.category_name from (select rownum idx, s.* from (select * from book b left join  book_category bc on b.category_no=bc.category_no where book_title like ? or b_author like ? or category_name like ? or b_publisher like ? order by book_title) s) where idx >= ? and idx <= ?";
	
	
	//저자 검색
	public static final String BOOK_SELECT_BY_AUTHOR
	="select * from book where book_author like ?";
	
	public static final String BOOK_SELECT_BY_AUTHOR_LIST
	="select * from (select rownum idx, s.* from (select * from book where book_author like ? order by book_title) s) where idx >= ? and idx <= ?";
	
	//출판사 검색
	public static final String BOOK_SELECT_BY_PUBLISHER
	="select * from book where book_publisher like ?";
	
	public static final String BOOK_SELECT_BY_PUBLISHER_LIST
	="select * from (select rownum idx, s.* from (select * from book where book_publisher like ? order by book_title) s) where idx >= ? and idx <= ?";
	
	
	//카테고리 검색_번호
	public static final String BOOK_SELECT_BY_CATEGORY_NO
	="select * from book where category_no like ?";
	
	public static final String BOOK_SELECT_BY_CATEGORY_NO_LIST
	="select * from (select rownum idx, s.* from (select * from book where category_no like ? order by book_title) s) where idx >= ? and idx <= ?";
	
	//카테고리 검색_분야명
	public static final String BOOK_SELECT_BY_CATEGORY_NAME
	="select b.*,bc.category_name from book b left join  book_category bc on b.category_no=bc.category_no  where bc.category_name like ?";
	
	public static final String BOOK_SELECT_BY_CATEGORY_NAME_LIST
	="select b.*,bc.category_name from (select rownum idx, s.* from (select b.*,bc.category_name from book b left join  book_category bc on b.category_no=bc.category_no where bc.category_name like ? order by book_title) s) where idx >= ? and idx <= ?";
	
	
	//도서 리스트
	public static final String BOOK_LIST
	= "select * from book";
	
	public final static String BOOK_LIST_PAGE 
	="select * from (select rownum idx, s.* from (select * from book order by book_title) s) where idx >= ? and idx <= ?";
	
	//번호 검색
	public static final String BOOK_SELECT_BY_NO
	="select * from book where book_no=?";
}
