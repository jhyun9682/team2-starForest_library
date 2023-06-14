package com.itwill.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.itwill.domain.Book;
import com.itwill.domain.Rental;


public interface RentalDao {
	
	int insertRental(Rental rental) throws Exception;
	
	int updateDate(String user_id, int book_no) throws Exception;
	
	List<Rental> selectById(String user_id) throws Exception;
	
	List<Rental> selectByIdTotalList(String user_id) throws Exception;
	
	int bookCheckDupli(String user_id, int book_no) throws Exception;
	
	List<Map<String, Object>> selectByNo(int book_no) throws Exception;
	
	int updateRentalStatus(String user_id, int book_no) throws Exception;
	
	int updateRentalStatusOverdue(int rental_no) throws Exception;
	
	String selectMostReturn_duedate(int book_no) throws Exception;
	
	int rentalFiveLimit(String user_id) throws Exception;

	List<Rental> selectNowLental() throws Exception;
	
	List<Rental> searchSelectById(String keyword) throws Exception;
	
	public int onceExtend(String user_id, int book_no);

}
