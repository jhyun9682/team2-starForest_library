package com.itwill.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itwill.domain.Book;
import com.itwill.repository.BookDao;

public interface BookService {

	/** admin 새책 추가하기 */
	int insertBook(Book book) throws Exception;

	/** 북 상세 페이지 */
	Book selectBookDetail(int bookd_no) throws Exception;

	/** 대여시 책재고 감소 */
	int updateRentalBookQty(int book_no) throws Exception;

	/** 반납시 책재고 증가 */
	int updateReturnBookQty(int book_no) throws Exception;

	/** 회원이 대여한 도서 전체 반납시 수량변경 (admin) */
	int updateById(String user_id) throws Exception;

	/** 각각 반납시 책 수량변경 (admin) */
	int updateByIdNo(String user_id, int book_no)throws Exception;

	/** 도서 전체 출력 */
	List<Book> selectAll() throws Exception;

	/** 대여시 대여횟수 증가 */
	int updateRentalCnt(int book_no) throws Exception;

	/** 예약시 예약카운트 증가 최대 5명 */
	int updateResCnt(int book_no) throws Exception;
	
	//예약 후 렌탈 시 예약카운트 감소
	int updateResCntM(int book_no) throws Exception;

	/** 카테고리별 출력 */
	List<Book> selectCategory(int category_no) throws Exception;

	/** 인기도서 출력 */
	List<Book> selectFavorite() throws Exception;

	/** 인기도서 출력 */
	List<Book> selectFavorite9() throws Exception;

	/** 관련분야 인기도서 출력 */
	List<Book> selectRelateion(int category_no) throws Exception;

	/** 관련분야 신간도서 출력 */
	List<Book> selectCategoryNew(int category_no) throws Exception;
	
	List<Book> selectNew() throws Exception;
	
	int bookCount() throws Exception;
	
	int bookCategoryCount() throws Exception;
	
	List<Book> userBook(String user_id) throws Exception;
}