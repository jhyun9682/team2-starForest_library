package com.itwill.service;

import java.util.List;
import java.util.Map;

import com.itwill.domain.Reservation;

public interface ReservationService {
	
	//책 수량이 0일 때 예약 리스트 추가하기
	int insertReservation(Reservation reservation);
	
	//예약이 대출로 변경되면 예약리스트 삭제
	int deleteReservation(String user_id, int book_no);
	
	//책에 대한 예약 리스트 출력
	List<Reservation> selectReservationList(int book_no); 

	//회원에 대한 예약 리스트 출력
	List<Map<String, Object>> selectReservationListById(String user_id);
	
	//회원이 책 예약 중복 확인
	int resCheckDupli(String user_id, int book_no);
	
	int selectReservationListCnt(int book_no);
	
	int resUpdateStatus(String user_id, int book_no);
}
