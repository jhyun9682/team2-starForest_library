package com.itwill.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.itwill.domain.Reservation;


public interface ReservationDao {
	
	int insertReservation(Reservation reservation);
	
	int deleteReservation(String user_id, int book_no);
	
	List<Reservation> selectReservationList(int book_no); 

	List<Map<String, Object>> selectReservationListById(String user_id); 
	
	int resCheckDupli(String user_id, int book_no);
	
	int selectReservationListCnt(int book_no);
	
	int resUpdateStatus(String user_id, int book_no);

}
