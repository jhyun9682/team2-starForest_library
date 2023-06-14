package com.itwill.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.itwill.domain.User;


@Mapper
public interface UserMapper2 {
	
	//회원가입
	@Insert("insert into user_info(user_id, user_name,user_password,user_email,user_birth,user_gender,user_phone,user_address,category_no)"
			+ "			values(#{user_id},#{user_name},#{user_password},#{user_email},#{user_birth},#{user_gender},#{user_phone},#{user_address},#{category_no})")
	public int insertUser(User user);
	
	//회원 아이디 검색_내정보
	@Select("select * from user_info where user_id=#{user_id}")
	public User selectByUserId(String user_id);
	
	//회원리스트
	@Select("select * from user_info")
	public List<User> selectAll();
	
	//정보수정
	@Update("update user_info set user_password=#{user_password}, user_phone=#{user_phone}, user_email=#{user_email}, user_address=#{user_address} where user_id=#{user_id}")
	public int updateUser(User user);
	
	//회원탈퇴
	@Delete("delete from user_info where user_id=#{user_id} and user_password=#{user_password}")
	public int deleteUser(String user_id,String user_password);
	
	//로그인체크
	@Select("select * from user_info where user_id=#{user_id}")
	public int login(String user_Id, String user_password);
	
	//아이디중복
	@Select("select count(*) from user_info where user_id=#{user_id}")
	public int existUserId(String user_id);
	
	//전화번호 중복
	@Select("select count(*) from user_info where user_phone=#{user_phone}")
	
	public int existUserPhone(String user_phone);
	
	//이메일중복
	@Select("select count(*) from user_info where user_email=#{user_email}")
	public int existUserEmail(String user_email);
	
	//아이디찾기
	@Select("select user_id from user_info where user_name=#{user_name} and user_phone=#{user_phone}")
	public String findId(String user_name, String user_phone);
	
	//비밀번호찾기
	@Select("select user_password from user_info where user_id=#{user_id} and user_email=#{user_email}")
	public String findPassword(String user_id, String user_email);
	
	//비밀번호 확인
	@Select("select count(*) from user_info where user_id=#{user_id} and user_password=#{user_password}")
	public int passwordCK(String user_id,String user_password);
	
}