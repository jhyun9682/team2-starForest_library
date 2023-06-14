package com.itwill.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itwill.domain.Book;
import com.itwill.mapper.BookMapper;
import com.itwill.repository.BookDao;


@Service
@Transactional
public class BookServiceImpl implements BookService {
	@Autowired(required=true) //해당 타입의 빈 객체가 존재하지 않는 경우 예외 처리
	private BookDao bookDao;
	
	public BookServiceImpl() {
		
	}


	@Override
	public int insertBook(Book book) throws Exception {
		return bookDao.insertBook(book);
	}

	@Override
	public Book selectBookDetail(int bookd_no) throws Exception {
		return bookDao.selectBookDetail(bookd_no);
	}

	@Override
	public int updateRentalBookQty(int book_no) throws Exception {
		return bookDao.updateRentalBookQty(book_no);
	}

	@Override
	public int updateReturnBookQty(int book_no) throws Exception {
		return bookDao.updateReturnBookQty(book_no);
	}

	@Override
	public int updateById(String user_id) throws Exception {
		return bookDao.updateById(user_id);
	}

	@Override
	public int updateByIdNo(String user_id, int book_no) throws Exception {
		return bookDao.updateByIdNo(user_id, book_no);
	}
	
	@Override
	public List<Book> selectAll()throws Exception{
		return bookDao.selectAll();
	}

	@Override
	public List<Book> selectCategory(int category_no) throws Exception {
		return bookDao.selectCategory(category_no);
	}

	@Override
	public List<Book> selectFavorite() throws Exception {
		return bookDao.selectFavorite();
	}

	@Override
	public List<Book> selectRelateion(int category_no) throws Exception {
		return bookDao.selectRelateion(category_no);
	}

	@Override
	public List<Book> selectFavorite9() throws Exception {
		return bookDao.selectFavorite9();
	}

	@Override
	public int updateRentalCnt(int book_no) throws Exception {
		return bookDao.updateRentalCnt(book_no);
	}

	@Override
	public int updateResCnt(int book_no) throws Exception {
		return bookDao.updateResCnt(book_no);
	}


	@Override
	public int bookCount() throws Exception {
		return bookDao.bookCount();
	}


	@Override
	public int bookCategoryCount() throws Exception {
		return bookDao.bookCategoryCount();
	}


	@Override
	public List<Book> selectCategoryNew(int category_no) throws Exception {
		return bookDao.selectCategoryNew(category_no);
	}


	@Override
	public List<Book> selectNew() throws Exception {
		return bookDao.selectNew();
	}


	@Override
	public List<Book> userBook(String user_id) throws Exception {
		return bookDao.userBook(user_id);
	}


	@Override
	public int updateResCntM(int book_no) throws Exception {
		return bookDao.updateResCntM(book_no);
	}

}