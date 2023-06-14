package com.itwill.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.itwill.domain.User;


public interface UserService {
	// 회원가입
	int create(User user) throws Exception;

	// 회원로그인
	int login(String user_id,String user_password) throws Exception;

	// 회원비밀번호 변경
	int updatePassword(User user) throws Exception;

	// 회원정보수정
	int update(User user) throws Exception;

	// 회원탈퇴
	int remove(String user_id) throws Exception;

	// 전체회원리스트
	List<User> userList() throws Exception;

	// 회원상세보기
	User findUser(String user_id) throws Exception;

	// 아이디 중복체크
	boolean existedUser(String user_id) throws Exception;
	
	// 비밀번호 체크
	int PWcheck(String user_id,String user_password) throws Exception;

	// 회원당 대출권수 카운트
	int userRentalCount(String user_id) throws Exception;
	
	//연체에 따른 대출정지기간
	int rentalStopPeriod(String user_id) throws Exception;
	
	//반납시 카운트
	int userReturnCount(String user_id) throws Exception;
		
	//대출가능여부
	int userRentalStatus(String user_id) throws Exception;
	
	//대출 할 때 유저렌탈상태 확인하기
	public int selectUserRentalStatus(String user_id);
}
