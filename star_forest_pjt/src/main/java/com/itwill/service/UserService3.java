package com.itwill.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.domain.User;
import com.itwill.repository.UserDao3;

@Service
public class UserService3 {
	@Autowired
	private UserDao3 dao3;

	
	

	
		
		// 전체 조회
		public List<User> getAll(){
			return dao3.getAll();
		}
		
		// 아이디 중복 검사
		public String checkID(String user_id,String type) { 
				   if(type.equals("user")) {
				      return dao3.checkIdUser(user_id);
				   }
				   
				   return null;
				
		}
		
		// 일반 유저 추가
		public int addUser(User user) {
			
			if(dao3.insertU(user) != 1) {
			return 0;
			}
			
			return 1;
		}
		
		// 
		
		public User getOne(String user_id) {
			return dao3.getOne(user_id);
		}

		// 일반 회원 아이디 찾기
		public String findUId(String user_name, String user_phone) {
			return dao3.findUId(user_name, user_phone);
		}
		
		// 일반 회원 패스워드 찾기 
		public String findUPwd(String user_id, String user_email) {
			return dao3.findUPwd(user_id, user_email);
		}
		
		// 일반 회원 계정 정보 확인 후 임시 패스워드로 변경
		public int changeTempPw(String tempPwd, String user_id) {
			return dao3.updateTempPw(tempPwd, user_id);
		}
		
		
		//일반회원 마이페이지 수정
		public List<User> myPageUModify(String user_id){
			return dao3.myPageUModify(user_id);
		}
		
		//일반회원 개인정보 수정
		public int modifyBasicU(User user) {
			if(dao3.modifyUser(user) != 1 ) {
				return 0;
			}
			return 1;
		}
		
		
		//관심분야 가져오기
		public String interest(String user_id) {
			return dao3.interest(user_id);
		}
		
		/*
		// 멤버 탈퇴
		public int delMember(int mno) {
			return dao3.deleteMember(mno);
		}
	*/
}