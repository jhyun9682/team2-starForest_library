package com.itwill.repository;

import java.util.List;

import com.itwill.domain.User;


public interface UserDao {
	// 회원가입
	int create(User user) throws Exception;

	// 회원비밀번호변경
	int updatePassword(User user) throws Exception;

	// 회원정보 수정
	int update(User user) throws Exception;

	// 회원 삭제
	int remove(String user_id) throws Exception;

	// 회원리스트
	List<User> userList() throws Exception;

	// 회원정보조회
	User findUser(String user_id) throws Exception;

	// 아이디 중복체크
	boolean existedUser(String user_id) throws Exception;

	// 비밀번호 체크
	boolean PWcheck(String user_id,String user_password) throws Exception;
	
	// 대출권수 카운트
	int userRentalCount(String user_id) throws Exception;
	
	// 대출정지기간
	int rentalStopPeriod(String user_id) throws Exception;
	
	//반납시 카운트
	int userReturnCount(String user_id) throws Exception;
	
	//대출상태
	int userRentalStatus(String user_id) throws Exception;
	
	//대출 할 때 유저렌탈상태 확인하기
	public int selectUserRentalStatus(String user_id);
	
}
