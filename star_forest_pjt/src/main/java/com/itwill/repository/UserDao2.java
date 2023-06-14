package com.itwill.repository;

import java.util.List;

import com.itwill.domain.User;



public interface UserDao2 {
	
	//회원가입
	int insertUser(User user) throws Exception;
	
	//회원 아이디 검색_내정보
	User selectByUserId(String user_id) throws Exception;
	
	//회원리스트
	List<User> selectAll() throws Exception;
	
	//정보수정
	int updateUser(User user) throws Exception;
	
	//회원탈퇴
	int deleteUser(String user_id,String user_password) throws Exception;
	
	
	//아이디중복
	boolean  existUserId(String user_id)throws Exception;
	
	//전화번호 중복
	boolean  existUserPhone(String user_phone)throws Exception;
	
	//이메일 중복
	boolean  existUserEmail(String user_email)throws Exception;
	
	//아이디 찾기 
	 String findId(String user_name, String user_phone)throws Exception;
	
	//비밀번호 찾기
	 String findPassword(String user_id,String user_email)throws Exception;
	
	//비밀번호 확인
	 boolean passwordCK(String user_id,String user_password) throws Exception;
		
	

}
