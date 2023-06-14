package com.itwill.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.itwill.domain.User;
import com.itwill.repository.UserDao;

public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;

	// 회원가입

	@Override
	public int create(User user) throws Exception {

		/*
		 * 회원가입
		 * 
		 * -1:아이디중복 
		 * 1:회원가입성공
		 */
		if (userDao.existedUser(user.getUser_id())) {
			// 중복될 경우 -1 반환
			return -1;
		} else {
			// 회원가입성공
			int rowCount = userDao.create(user);
			return rowCount;
		}
	}

	// 로그인
	@Override
	public int login(String user_id,String user_password) throws Exception {
		
		/*
		 * 회원로그인
		 * 
		 * 0:아이디존재안함 
		 * 1:패쓰워드 불일치 
		 * 2:로그인성공
		 */
		User user=userDao.findUser(user_id);
		if(user==null) {
			return 0; //아이디존재안함
		}else {
			if (user_password.equals(user.getUser_password())) {
				// 패스워드일치(로그인성공)
				return 2;
			} else {
				// 패스워드불일치
				return 1;
			}
		}
		
	}

	// 비밀번호변경
	@Override
	public int updatePassword(User user) throws Exception {
		return userDao.updatePassword(user);
	}

	// 회원정보수정
	@Override
	public int update(User user) throws Exception {
		return userDao.update(user);
	}

	// 회원탈퇴
	@Override
	public int remove(String user_id) throws Exception {
		return userDao.remove(user_id);
	}

	// 회원전체리스트
	@Override
	public List<User> userList() throws Exception {
		return userDao.userList();
	}

	// 회원상세보기
	@Override
	public User findUser(String user_id) throws Exception {
		return userDao.findUser(user_id);
	}

	// 아이디중복체크
	@Override
	public boolean existedUser(String user_id) throws Exception {
		boolean isExist = userDao.existedUser(user_id);
		if (isExist) {
			return true;  //아이디 중복
		} else {
			return false; //아이디 중복X
		}
	}

	// 비밀번호체크
	@Override
	public int PWcheck(String user_id,String user_password) throws Exception {
		boolean isExist=userDao.PWcheck(user_id, user_password);
		if(isExist) {
			return 1; //비밀번호 체크성공
		}else {
			return 0; //비밀번호 불일치
		}
	}
	
	// 회원당 대출권수카운트
	@Override
	public int userRentalCount(String user_id) throws Exception {
		return userDao.userRentalCount(user_id);
	}

	//연체에 따른 대출정지기간
	@Override
	public int rentalStopPeriod(String user_id) throws Exception {
		return userDao.rentalStopPeriod(user_id);
	}

	@Override
	public int userReturnCount(String user_id) throws Exception {
		return userDao.userReturnCount(user_id);
	}

	//대출가능여부
	@Override
	public int userRentalStatus(String user_id) throws Exception {
		return userDao.userRentalStatus(user_id);
	}

	@Override
	public int selectUserRentalStatus(String user_id) {
		return userDao.selectUserRentalStatus(user_id);
	}
	
	
	
	

}
