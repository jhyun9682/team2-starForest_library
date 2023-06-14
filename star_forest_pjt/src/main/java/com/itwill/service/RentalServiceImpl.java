package com.itwill.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.domain.Book;
import com.itwill.domain.Rental;
import com.itwill.repository.RentalDao;

@Service
public class RentalServiceImpl implements RentalService{
	
	@Autowired
	private RentalDao rentalDao;

	/** 대여 시 insert*/
	@Override
	public int insertRental(Rental rental)  throws Exception{
		return rentalDao.insertRental(rental);
	}
	
	/** 대여 기간 연장*/
	@Override
	public int updateDate(String user_id, int book_no)  throws Exception{
		return rentalDao.updateDate(user_id, book_no);
	}
	
	//연장은 한 번 만 가능
	@Override
	public int onceExtend(String user_id, int book_no) {
		return rentalDao.onceExtend(user_id, book_no);
	}

	/** user_id로 대출중인 리스트 뽑기*/
	@Override
	public List<Rental> selectById(String user_id)  throws Exception{
		return rentalDao.selectById(user_id);
	}

	/**user_id로 총 대출 리스트 뽑기*/
	@Override
	public List<Rental> selectByIdTotalList(String user_id) throws Exception {
		return rentalDao.selectByIdTotalList(user_id);
	}
	
	/** book_no로 대출유저 리스트*/
	@Override
	public List<Map<String, Object>> selectByNo(int book_no) throws Exception {
		return rentalDao.selectByNo(book_no);
	}

	/** 반납했을 때 0으로 상태 업데이트 (admin)*/
	@Override
	public int updateRentalStatus(String user_id, int book_no)  throws Exception{
		return rentalDao.updateRentalStatus(user_id, book_no);
	}
	/**연체시 2로 상태 변경*/
	@Override
	public int updateRentalStatusOverdue(int rental_no)  throws Exception{
		return rentalDao.updateRentalStatusOverdue(rental_no);
	}
	/**대출 중인 책 제일 빠른 반납 일정 출력*/
	@Override
	public String selectMostReturn_duedate(int book_no) throws Exception {
		return rentalDao.selectMostReturn_duedate(book_no);
	}

	@Override
	public int bookCheckDupli(String user_id, int book_no) throws Exception {
		return rentalDao.bookCheckDupli(user_id, book_no);
	}

	@Override
	public int rentalFiveLimit(String user_id) throws Exception {
		return rentalDao.rentalFiveLimit(user_id);
	}

	@Override
	public List<Rental> selectNowLental() throws Exception {
		return rentalDao.selectNowLental();
	}

	@Override
	public List<Rental> searchSelectById(String keyword) throws Exception {
		return rentalDao.searchSelectById(keyword);
	}

	



	
}
