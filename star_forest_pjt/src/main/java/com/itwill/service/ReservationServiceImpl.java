package com.itwill.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.domain.Reservation;
import com.itwill.repository.ReservationDao;
@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationDao reservationDao;

	//책 수량이 0일 때 예약 리스트 추가하기
	@Override
	public int insertReservation(Reservation reservation) {
		return reservationDao.insertReservation(reservation);
	}

	//예약이 대출로 변경되면 예약리스트 삭제
	@Override
	public int deleteReservation(String user_id, int book_no) {
		return reservationDao.deleteReservation(user_id, book_no);
	}

	//책에 대한 예약 리스트 출력
	@Override
	public List<Reservation> selectReservationList(int book_no) {
		return reservationDao.selectReservationList(book_no);
	}

	@Override
	public List<Map<String, Object>> selectReservationListById(String user_id) {
		return reservationDao.selectReservationListById(user_id);
	}

	@Override
	public int resCheckDupli(String user_id, int book_no) {
		return reservationDao.resCheckDupli(user_id, book_no);
	}

	@Override
	public int selectReservationListCnt(int book_no) {
		return reservationDao.selectReservationListCnt(book_no);
	}

	@Override
	public int resUpdateStatus(String user_id, int book_no) {
		return reservationDao.resUpdateStatus(user_id, book_no);
	}

	
	
	
}
