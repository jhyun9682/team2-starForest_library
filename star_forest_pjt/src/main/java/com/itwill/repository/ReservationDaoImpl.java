package com.itwill.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.domain.Reservation;
import com.itwill.mapper.ReservationMapper;

@Repository
public class ReservationDaoImpl implements ReservationDao {
	
	@Autowired
	private ReservationMapper reservationMapper;

	@Override
	public int insertReservation(Reservation reservation) {
		return reservationMapper.insertReservation(reservation);
	}

	@Override
	public int deleteReservation(String user_id, int book_no) {
		return reservationMapper.deleteReservation(user_id, book_no);
	}

	@Override
	public List<Reservation> selectReservationList(int book_no) {
		return reservationMapper.selectReservationList(book_no);
	}

	@Override
	public List<Map<String, Object>> selectReservationListById(String user_id) {
		return reservationMapper.selectReservationListById(user_id);
	}

	@Override
	public int resCheckDupli(String user_id, int book_no) {
		return reservationMapper.resCheckDupli(user_id, book_no);
	}

	@Override
	public int selectReservationListCnt(int book_no) {
		return reservationMapper.selectReservationListCnt(book_no);
	}

	@Override
	public int resUpdateStatus(String user_id, int book_no) {
		return reservationMapper.resUpdateStatus(user_id, book_no);
	}

}
