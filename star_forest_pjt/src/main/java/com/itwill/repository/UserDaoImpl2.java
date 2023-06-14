package com.itwill.repository;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.domain.User;
import com.itwill.mapper.UserMapper2;


@Repository
public class UserDaoImpl2 implements UserDao2{
	@Autowired
	private UserMapper2 userMapper2;
	
	
	
	
	//회원가입
	@Override
	public int insertUser(User user) throws Exception {
		return userMapper2.insertUser(user);
	}
	
	//회원 아이디 검색_내정보
	@Override
	public User selectByUserId(String user_id) throws Exception {
		return userMapper2.selectByUserId(user_id);
	}
	
	//회원리스트
	@Override
	public List<User> selectAll() throws Exception {
		return userMapper2.selectAll();
		
	}
	
	//회원수정
	@Override
	public int updateUser(User user) throws Exception {
		return userMapper2.updateUser(user);
	}
	
	//회원탈퇴
	@Override
	public int deleteUser(String user_id,String user_password) throws Exception {
		return userMapper2.deleteUser(user_id,user_password);
	}
	
	//아이디중복
	@Override
	public boolean existUserId(String user_id)throws Exception {
		int count = userMapper2.existUserId(user_id);
		if (count > 0) {
			return true; //존재하면 true
		} else {
			return false; //존재하지 않으면 false
		}
	
	}
	//전화번호 중복
	@Override
	public boolean existUserPhone(String user_phone) throws Exception {
		int count = userMapper2.existUserPhone(user_phone);
		if (count > 0) {
			return true; //존재하면 true
		} else {
			return false; //존재하지 않으면 false
		}
		
	}
	//이메일 중복
	@Override
	public boolean existUserEmail(String user_email) throws Exception {
		int count = userMapper2.existUserEmail(user_email);
		if (count > 0) {
			return true; //존재하면 true
		} else {
			return false; //존재하지 않으면 false
		}
		
	}
	
	//아이디찾기
	@Override
	public String findId(String user_name, String user_phone) throws Exception {
		return userMapper2.findId(user_name, user_phone);
	}
	
	//비밀번호찾기
	@Override
	public String findPassword(String user_id, String user_email) throws Exception {
		return userMapper2.findPassword(user_id, user_email);
	
	}

	//비밀번호 확인
	@Override
	public boolean passwordCK(String user_id, String user_password) throws Exception {
		int count = userMapper2.passwordCK(user_id, user_password);
		if (count == 1 ) {
			return true;
		} else {
			return false;
		}
	}
	
	
	
	
	
}