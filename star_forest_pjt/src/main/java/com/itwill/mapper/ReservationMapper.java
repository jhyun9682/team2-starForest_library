package com.itwill.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.itwill.domain.Rental;
import com.itwill.domain.Reservation;

@Mapper
public interface ReservationMapper {
	
	//책 수량이 0일 때 예약 리스트 추가하기
	@Insert("insert into reservation "
		  + "values (seq_reservation_res_no.nextval,sysdate, #{res_status}, #{book_no}, #{user_id})")
	public int insertReservation(Reservation reservation);
	
	
	//예약이 대출로 변경되면 예약리스트 삭제
	@Delete("delete from reservation where user_id=#{user_id} and book_no=#{book_no}")
	public int deleteReservation(String user_id, int book_no);
	
	//책에 대한 예약 리스트 출력
	@Select("select * from reservation where book_no=#{book_no} order by res_date asc")
	public List<Reservation> selectReservationList(int book_no);
	
	//책에 대한 예약 리스트 출력
	@Select("select count(*) from reservation where book_no=#{book_no} order by res_date asc")
	public int selectReservationListCnt(int book_no);

	//회원에 대한 예약 리스트 출력
	@Select("select r.*, b.book_title, b.book_author, b.isbn from reservation r "
			+ "inner join book b on r.book_no=b.book_no where r.user_id=#{user_id}"
			+ "order by r.res_date asc")
	public List<Map<String, Object>> selectReservationListById(String user_id);
	
	@Update("update reservation set res_status=0 where user_id in (select user_id from rental where rental_status=1 and book_no=#{book_no})and book_no=#{book_no}")
	public int resUpdateStatus(String user_id, int book_no);
		
	//예약 중복 방지
	@Select("select count(r.book_no) from reservation r inner join book b on r.book_no=b.book_no "
			 + "where r.user_id=#{user_id} and r.book_no=#{book_no}")
	public int resCheckDupli(String user_id, int book_no);
		
		

}
