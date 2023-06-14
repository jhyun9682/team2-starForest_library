package com.itwill.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.itwill.domain.User;



@Mapper
public interface UserDao3 {
	
	/*
	 * 아이디
비밀번호
이름
주소
성별
생일
이메일
전화번호
분야
	 */
		
		// 일반 member 추가
	@Insert("insert into user_info(user_id, user_password, user_name, user_address, user_gender, user_birth, user_email, user_phone, category_no)"
			+ "			values(#{user_id},#{user_password},#{user_name},#{user_address},#{user_gender},#{user_birth},#{user_email},#{user_phone},#{category_no})")
	int insertU(User user);
		
		
		
		// 전체 member 가져오기
		@Select("select * from user_info")
		List<User> getAll();
		
		// member 한명만 가져오기 TEST
		
		@Select("select * from user_info where user_id=#{user_id}")
		User getOne(@Param("user_id")String user_id);
		
		
		
		// 일반 유저 아이디 중복 검사
		@Select("select user_id from user_info where user_id=#{user_id}")
		String checkIdUser(@Param("user_id")String user_id);
		
		/*
		@Select("select user_email from user_info where user_email=#{user_email}")
		String checkIdCom(@Param("user_email")String user_email);
		*/
		
		
		// 일반 회원 아이디 찾기
		//@Select("select user_id from user_info where user_name=#{user_name} and user_phone=#{user_phone}")
		@Select("select RPAD(substr(user_id , 1, 3), lengthb(user_id), '*') user_id from user_info where user_name=#{user_name} and user_phone=#{user_phone}")
		String findUId(@Param("user_name")String user_name, @Param("user_phone")String user_phone);

		// 일반 회원 패스워드 찾기
		//@Select("SELECT * FROM member WHERE MID=#{mid} and MNAME=#{mname} and MPHONE=#{mphone}")
		//@Select("select user_password from user_info where user_id=#{user_id} and user_email=#{user_email}")
		@Select("select RPAD(substr(user_password, 1, 2), lengthb(user_password ), '*') user_password from user_info where user_id=#{user_id} and user_email=#{user_email}")
		String findUPwd(@Param("user_id")String user_id, @Param("user_email")String user_email);
		
		
		// 일반 회원 패스워드 계정정보 확인 후 임시 패스워드로 변경
		@Update("UPDATE user_info set user_password = #{user_password} WHERE user_id = #{user_id}")
		int updateTempPw(@Param("user_password")String user_password, @Param("user_id")String user_id);
		
		
		//일반회원 정보수정
		@Update("update user_info set user_password=#{user_password}, user_phone=#{user_phone}, user_email=#{user_email}, user_address=#{user_address} where user_id=#{user_id}")
		int modifyUser(User user);
		
		@Select(" select user_password,user_email,user_birth,user_gender,user_phone,user_address,category_no from user_info where user_id = #{user_id} ")
		List<User> myPageUModify(String user_id);
		
		//관심분야
		@Select(" select category_name from book_category where category_no in(select category_no from user_info user_id = #{user_id}) ")
		String interest(String user_id);
		
		
		
/*
		// 유저 삭제
		@Update("update member set isNonExpired = 'false' where mno = #{mno}")
		int deleteMember(@Param("mno")int mno);
		
		
		
		//마이페이지 이미지 업로드
		@Update("UPDATE member SET mimg = #{mimg} WHERE mno = #{mno}")
		void uploadImg(@Param("mimg")String mimg, @Param("mno")int mno);
		
		
		
		*/
		
	






}
