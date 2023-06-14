package com.itwill.repository;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.itwill.domain.SeatReservation;


public interface SeatReservationDao {
	
	 //좌석 예약
	 int reservation(SeatReservation seatReservation)throws Exception;
	 
	 //사용자가 직접 반납
	 int returnByUser(SeatReservation seatReservation)throws Exception;
	 
	 //시간 지나면 자동으로 반납
	 int returnByAuto(SeatReservation seatReservation)throws Exception;
	 
	 //날짜 지나면 전체 자동으로 리셋
	 public int resetAll()throws Exception;
	 
	 //자리 연장
	 int continueSeat(String user_id)throws Exception;
	 
	 //좌석 전체 리스트
	 List<SeatReservation> selectAll()throws Exception;
	 
	 //사용 가능한 좌석 리스트
	 List<SeatReservation> selectAvailableSeat(int seat_status)throws Exception;
	 
	 //아이디로 사용하고 있는 좌석이 있는지 카운트
	 int findByUser (String user_id) throws Exception;
	 
	 //아이디로 사용하고 있는 좌석 정보
	 SeatReservation findSeat(String user_id)throws Exception;
	 
	 //사용 가능한 좌석 카운트
	 int countAvailableSeat(int seat_status)throws Exception;
	 
	 //전체 좌석 카운트
	 int countAll()throws Exception;
	 
	 //사용하고 있는 좌석 시작시간,종료시간 보기
	 SeatReservation selectTimeUsingSeat(String seat_no)throws Exception;
	 
}
