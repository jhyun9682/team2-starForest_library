package com.itwill.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.itwill.domain.User;
import com.itwill.repository.UserDao2;

public class UserServiceImpl2 implements UserService2{
	@Autowired
	private UserDao2 userDao2;
	
	public UserServiceImpl2() {
		
	}
	/*
	public UserServiceImpl2(UserDao2 userDao2) {
		this.userDao2=userDao2;
	}
	public void setUserDao2(UserDao2 userDao2) {
		this.userDao2=userDao2;
	}
	*/
	
	//회원가입
	@Override
	public int insertUser(User user) throws Exception {

		/*
		 * 회원가입
		 * 
		 * -1:아이디중복 
		 * 1:회원가입성공
		 */
		if (userDao2.existUserId(user.getUser_id())) {
			// 중복될 경우 -1 반환
			return -1;
		} else {
			// 회원가입성공
			int rowCount = userDao2.insertUser(user);
			return rowCount;
		}
		
	}

	//회원 아이디 검색_내정보
	@Override
	public User selectByUserId(String user_id) throws Exception {
		return userDao2.selectByUserId(user_id);
	}

	//회원리스트
	@Override
	public List<User> selectAll() throws Exception {
		return userDao2.selectAll();
	}

	//정보수정
	@Override
	public int updateUser(User user) throws Exception {
		return userDao2.updateUser(user);
	}

	//회원탈퇴
	@Override
	public int deleteUser(String user_id,String user_password) throws Exception {
		return userDao2.deleteUser(user_id,user_password);
	}

	
	
	
	//아이디중복
	@Override
	public boolean existUserId(String user_id) throws Exception {
		boolean isExist = userDao2.existUserId(user_id);
		if (isExist) {
			return true;
		} else {
			return false;
		}
	}
	
	//전화번호 중복
	@Override
	public boolean existUserPhone(String user_phone) throws Exception {
		boolean isExist = userDao2.existUserPhone(user_phone);
		if (isExist) {
			return true;
		} else {
			return false;
		}
	}
	
	//이메일중복
	@Override
	public boolean existUserEmail(String user_email) throws Exception {
		boolean isExist = userDao2.existUserEmail(user_email);
		if (isExist) {
			return true;
		} else {
			return false;
		}
	}
	
	//아이디찾기
	@Override
	public String findId(String user_name, String user_phone) throws Exception {
		return userDao2.findId(user_name, user_phone);
	}
	
	//비밀번호찾기
	@Override
	public String findPassword(String user_id, String user_email) throws Exception {
		return userDao2.findPassword(user_id, user_email);
	}

	
	//비밀번호 확인
	@Override
	public int passwordCK(String user_id, String user_password) throws Exception {
		boolean isExist=userDao2.passwordCK(user_id, user_password);
		if(isExist) {
			return 1; //비밀번호 체크성공
		}else {
			return 0; //비밀번호 불일치
		}
	}
	
	
	

}