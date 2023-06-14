package com.itwill.mapper;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.itwill.domain.SeatReservation;
@Mapper
public interface SeatReservationMapper {
	@Update("update seat_reservation set seat_date=to_char(sysdate,'YYYY/MM/DD'), seat_start_time=to_char(sysdate,'HH24:MI:SS'),\r\n"
			+ "								seat_end_time=to_char(sysdate+5/24,'HH24:MI:SS'),\r\n"
			+ "								user_id=#{user_id}, seat_status=1 where seat_no=#{seat_no}")
	public int reservation(SeatReservation seatReservation);
	
	@Update("update seat_reservation set seat_date=null, seat_start_time=null,\r\n"
			+ "								seat_end_time=null,user_id=null,\r\n"
			+ "								seat_status=0\r\n"
			+ "								where seat_no=#{seat_no}")
	public int returnByUser(SeatReservation seatReservation);
	
	@Update("update seat_reservation set seat_date=null,seat_start_time=null,seat_end_time=null,user_id=null,seat_status=0 \r\n"
			+ "	where seat_no=#{seat_no} and seat_end_time<to_char(sysdate,'HH24:MI:SS')")
	public int returnByAuto(SeatReservation seatReservation);
	
	@Update("update seat_reservation set seat_date=null,seat_start_time=null,seat_end_time=null,user_id=null,seat_status=0 \r\n"
			+ "	where seat_date<to_char(sysdate,'YYYY/MM/DD')")
	public int resetAll();
	
	@Update("update seat_reservation set seat_end_time=to_char(to_date(seat_end_time,'HH24:MI:SS')+2/24,'HH24:MI:SS') \r\n"
			+ "where user_id=#{user_id} and to_char(sysdate,'HH24:MI:SS')>=to_char(to_date(seat_end_time,'HH24:MI:SS')-30/(24*60),'HH24:MI:SS')")
	public int continueSeat(String user_id);
	
	@Select("select * from seat_reservation order by seat_sno asc")
	public List<SeatReservation> selectAll();
	
	@Select("select seat_no from seat_reservation where seat_status=0")
	public List<SeatReservation> selectAvailableSeat(int seat_status);
	
	@Select("select count(*) from seat_reservation where user_id=#{user_id}")
	public int findByUser (String user_id);
	
	@Select("select seat_no, seat_date, seat_start_time, seat_end_time, user_id,seat_status\r\n"
			+ "	from seat_reservation\r\n"
			+ "	where user_id=#{user_id}")
	public SeatReservation findSeat(String user_id);
	
	@Select("select count(*) from seat_reservation where seat_status=0")
	public int countAvailableSeat(int seat_status);
	
	@Select("select count(*) from seat_reservation")
	public int countAll();
	
	@Select("select seat_no, seat_date, seat_start_time, seat_end_time, user_id,seat_status\r\n"
			+ "	from seat_reservation\r\n"
			+ "	where seat_no=#{seat_no}")
	public SeatReservation selectTimeUsingSeat(String seat_no);
}
