package com.itwill.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.itwill.domain.BookClub;
import com.itwill.util.Criteria;
@Mapper
public interface BookClubMapper {
  
	@Insert("insert into book_club values(SEQ_book_club_club_no.nextval,#{club_name},#{club_count},"
			+ "							 #{club_person},#{club_time},#{club_place},#{club_content},"
			+ "							 0,#{category_no},#{user_id})")
	public int create(BookClub bookClub);
	
	@Select("select count(*) cnt from book_club")
	public int clubCount(Criteria cri);
	
	public List<BookClub> selectAll(Criteria cri);
	
	@Select("select club_no,club_name,club_count,club_person,club_readcount,club_time,club_place,club_content,category_no from book_club"
			+ "			where category_no=#{category_no} order by club_no desc")
	public List<BookClub> selectBycategory(int category_no);
	
	@Select("select club_no,club_name,club_person,club_time,club_place,club_content from book_club where user_id=#{user_id} ")
	public List<BookClub> selectById(String user_id);
	
	@Select("select club_no,club_name,club_count,club_person,club_time,club_place,club_content from book_club"
			+ "			where club_no=#{club_no}")
	public BookClub selectByNo(int club_no);
	
	@Select("select count(*) cnt from book_club where user_id=#{user_id} and club_no=#{club_no}")
	public int isDuplicate(String user_id,int club_no);
	
	@Update("update book_club set club_name=#{club_name},club_person=#{club_person},club_count=#{club_count},"
			+ "							 club_place=#{club_place},club_time=#{club_time},club_content=#{club_content}"
			+ "							 where club_no=#{club_no}")
	public int update(BookClub bookClub);
	
	@Update("update book_club set user_id=#{user_id},club_count=club_count-1 where club_count>0 and club_no=#{club_no}")
	public int clubJoin(String user_id,int club_no);
	
	@Update("update book_club set club_readcount=club_readcount+1 where club_no=#{club_no}")
	public int addReadCount(int club_no);
	
	@Delete("delete from book_club where club_no=#{club_no}")
	public int remove(int club_no);
	
	
	
	
}
