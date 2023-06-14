package com.itwill.service;

import java.util.List;
import java.util.Map;

import com.itwill.domain.Book;
import com.itwill.domain.Rental;

public interface RentalService {

	/** 대여 시 insert */

	int insertRental(Rental rental) throws Exception;

	/** 대여 기간 연장 */
	int updateDate(String user_id, int book_no) throws Exception;
	
	//연장은 한 번 만 가능
	public int onceExtend(String user_id, int book_no);

	/** user_id로 대출중인 리스트 뽑기 */
	List<Rental> selectById(String user_id) throws Exception;
	
	/**user_id로 총 대출 리스트 뽑기*/
	List<Rental> selectByIdTotalList(String user_id) throws Exception;
	
	//도서관 총 대출 리스트
	List<Rental> selectNowLental() throws Exception;
	
	/**책대여는 아이디당 1개만 대여 가능 중복체크*/
	int bookCheckDupli(String user_id, int book_no) throws Exception;

	/** book_no로 대출유저 리스트 */
	List<Map<String, Object>> selectByNo(int book_no) throws Exception;

	/** 반납했을 때 렌탈테이블 업데이트 (admin) */
	int updateRentalStatus(String user_id, int book_no) throws Exception;

	/** 연체중일 때 status 2(연체)로 변경*/
	int updateRentalStatusOverdue(int rental_no) throws Exception;
	
	/** 3권 모두 대여중일 시 가장 빠른 반납예정일 출력*/
	String selectMostReturn_duedate(int book_no)throws Exception;

	int rentalFiveLimit(String user_id)throws Exception;

	//user_id로 검색기능 
	List<Rental> searchSelectById(String keyword) throws Exception;
}
