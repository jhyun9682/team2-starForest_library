package com.itwill.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.itwill.domain.Book;
import com.itwill.domain.Rental;

@Mapper
public interface RentalMapper {
	
	// 대여 시 insert
	@Insert("insert into rental (rental_no,rental_date,return_duedate,"
							  + "return_date,rental_status,book_no,user_id) "
			+ "values(seq_rental_rental_no.nextval,sysdate,sysdate+7,null,"
			+ "#{rental_status},#{book_no},#{user_id})")
	public int insertRental(Rental rental);
	
	// 대여 기간 연장
	@Update("update rental set return_duedate = return_duedate+7"
				+ "where user_id=#{user_id} and book_no=#{book_no}")
	public int updateDate(String user_id, int book_no );
	
	//대여는 한 번 만 가능
	@Select("select count(*) from rental where return_duedate - rental_date > 7 "
		  + "and user_id=#{user_id} and book_no=#{book_no}")
	public int onceExtend(String user_id, int book_no);
	
	// user_id로 대출 리스트 뽑기
	public List<Rental> selectById(String user_id);  
	
	/**user_id로 총 대출 리스트 뽑기*/
	public List<Rental> selectByIdTotalList(String user_id);
	
	//현재 도서관 총 렌탈 리스트
		public List<Rental> selectNowLental();
	
	//중복대출 불가 
	@Select("select count(r.book_no) from rental r inner join book b on r.book_no = b.book_no "
		  + "where r.user_id = #{user_id} and r.book_no=#{book_no} and r.rental_status!=0 "
		  + "order by r.rental_date asc")
	public int bookCheckDupli(String user_id, int book_no);
	
	// 반납했을 때 status 0으로 업데이트 (admin)
	@Update("update rental set rental_status = 0 , return_date=sysdate "
			+ "where user_id = #{user_id} and book_no = #{book_no}")
	public int updateRentalStatus(String user_id, int book_no);
	
	
	/** 연체중일 때 status 2(연체)로 변경 자동으로 구현할 수 있을까?*/
	@Update("update rental set rental_status=2"
			+ "where rental_no=#{rental_no}")
	public int updateRentalStatusOverdue(int rental_no);

	// 제일 빠른 반납예정일
	@Select("select return_duedate from "
			+ "(select * from rental order by return_duedate asc)"
			+ "where book_no=#{book_no} and rental_status=1 and ROWNUM= 1")
	public String selectMostReturn_duedate(int book_no);

	//1인당 3권이상 대여x
	@Select("select count(r.book_no) from rental r "
			+ "inner join book b on r.book_no=b.book_no "
			+ "where r.user_id=#{user_id} "
			+ "and r.rental_status=1")
	public int rentalFiveLimit(String user_id);
	
	/** book_no로 대출유저 리스트*/
	@Select("select u.user_id, u.user_name, u.user_rental_status, "
				 + "u.user_book_cnt_limit, r.rental_date "
			+ "from rental r left join user_info u on r.user_id = u.user_id "
			+ "inner join book b on r.book_no = b.book_no "
			+ "where b.book_no = #{book_no} and r.rental_status!=0 and u.user_id is not null "
			+ "order by r.rental_date asc")
	public List<Map<String, Object>> selectByNo(int book_no);


	//검색 기능 id 조회 시 대출리스트 뽑기
	public List<Rental> searchSelectById(String keyword);
	

}
