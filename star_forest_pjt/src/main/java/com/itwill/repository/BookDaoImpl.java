package com.itwill.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.domain.Book;
import com.itwill.mapper.BookMapper;

@Repository
public class BookDaoImpl implements BookDao {

	@Autowired
	private BookMapper bookMapper;

	@Override
	public int insertBook(Book book) throws Exception {
		return bookMapper.insertBook(book);
	}

	@Override
	public Book selectBookDetail(int book_no) throws Exception {
		return bookMapper.selectBookDetail(book_no);
	}

	@Override
	public int updateRentalBookQty(int book_no) throws Exception {
		return bookMapper.updateRentalBookQty(book_no);
	}

	@Override
	public int updateReturnBookQty(int book_no) throws Exception {
		return bookMapper.updateReturnBookQty(book_no);
	}

	@Override
	public int updateById(String user_id) throws Exception {
		return bookMapper.updateById(user_id);
	}

	@Override
	public int updateByIdNo(String user_id, int book_no) throws Exception {
		return bookMapper.updateByIdNo(user_id, book_no);
	}

	@Override
	public List<Book> selectAll() throws Exception {
		return bookMapper.selectAll();
	}
	@Override
	public int updateRentalCnt(int book_no) throws Exception {
		return bookMapper.updateRentalCnt(book_no);
	}
	
	@Override
	public int updateResCnt(int book_no) throws Exception {
		return bookMapper.updateResCnt(book_no);
	}

	@Override
	public List<Book> selectCategory(int category_no) throws Exception {
		return bookMapper.selectCategory(category_no);
	}

	@Override
	public List<Book> selectFavorite() throws Exception {
		return bookMapper.selectFavorite();
	}

	@Override
	public List<Book> selectRelateion(int category_no) throws Exception {
		return bookMapper.selectRelation();
	}

	@Override
	public List<Book> selectFavorite9() throws Exception {
		return bookMapper.selectFavorite9();
	}

	@Override
	public int bookCount() throws Exception {
		return bookMapper.bookCount();
	}

	@Override
	public int bookCategoryCount() throws Exception {
		return bookMapper.bookCategoryCount();
	}

	@Override
	public List<Book> selectCategoryNew(int category_no) throws Exception {
		return bookMapper.selectCategoryNew(category_no);
	}

	@Override
	public List<Book> selectNew() throws Exception {
		return bookMapper.selectNew();
	}

	@Override
	public List<Book> userBook(String usre_id) throws Exception {
		return bookMapper.userBook(usre_id);
	}

	@Override
	public int updateResCntM(int book_no) {
		return bookMapper.updateResCntM(book_no);
	}



}
