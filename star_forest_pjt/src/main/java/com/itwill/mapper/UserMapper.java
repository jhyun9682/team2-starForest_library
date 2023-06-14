package com.itwill.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.itwill.domain.User;

@Mapper
public interface UserMapper {

	@Insert("insert into user_info values(#{user_id},#{user_name},#{user_password},#{user_email},"
			+ "									 #{user_birth},#{user_gender},#{user_phone},#{user_address},"
			+ "									 #{user_qr},#{user_rental_status},#{user_book_cnt_limit},"
			+ "									 #{user_book_weight},#{category_no})")
	public int create(User user);

	@Update("update user_info set user_password=#{user_password} where user_id=#{user_id}")
	public int updatePassword(User user);

	@Update("update user_info set user_password=#{user_password},user_email=#{user_email},user_birth=#{user_birth},"
			+ "		user_phone=#{user_phone} where user_id=#{user_id}")
	public int update(User user);

	@Delete("delete from user_info where user_id=#{user_id}")
	public int remove(String user_id);

	@Select("select user_id,user_name,user_password,user_email,user_birth,user_gender,user_phone,user_address,user_rental_status,user_book_cnt_limit from user_info")
	public List<User> userList();

	@Select("select * from user_info u join book_category c on u.category_no=c.category_no where user_id=#{user_id}")
	public User findUser(String user_id);

	@Select("select count(*) from user_info where user_id=#{user_id}")
	public int existedUser(String user_id);
	
	@Select("select count(*) from user_info where user_id=#{user_id} and user_password=#{user_password}")
	public int PWcheck(String user_id,String user_password);
	
	@Select("select min(r.return_date)-min(r.return_duedate) from user_info u join rental r on u.user_id=r.user_id where u.user_id=#{user_id}")
	public int rentalStopPeriod(String user_id);
	
	@Update("update user_info set user_book_cnt_limit=user_book_cnt_limit-1"
			+ "		where user_book_cnt_limit>0 and user_id=#{user_id}")
	public int userRentalCount(String user_id);

	@Update("update user_info set user_book_cnt_limit=user_book_cnt_limit+1"
			+ "		where user_book_cnt_limit>=0 and user_id=#{user_id}")
	public int userReturnCount(String user_id);
	
	@Update("update user_info set user_rental_status='대출불가(연체)' where  user_id=#{user_id} and (select min(r.return_date)-min(r.return_duedate) from user_info u join rental r on u.user_id=r.user_id  where u.user_id=#{user_id})>0")
	public int userRentalStatus(String user_id);
	
	@Select("select count(user_rental_status) from user_info "
			+ "where user_id=#{user_id} "
			+ "and user_rental_status='대출가능(미연체)'")
	public int selectUserRentalStatus(String user_id);

}
