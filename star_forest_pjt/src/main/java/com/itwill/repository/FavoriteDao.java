package com.itwill.repository;

import java.util.List;

import com.itwill.domain.Favorite;

public interface FavoriteDao {
	
	//즐겨찾기 추가
	int insert(Favorite favorite) throws Exception;
	
	//즐겨찾기 중복체크(목록에 이미있는지확인)
	boolean isExisted(String user_id,int book_no) throws Exception;
	
	//회원의 즐겨찾기 목록
	List<Favorite> selectById(String user_id) throws Exception;
	
	//즐겨찾기 상세보기
	Favorite selectByNo(int favorite_no) throws Exception;
	
	//즐겨찾기 일부삭제
	int deleteByNo(int favorite_no) throws Exception;
	
	//즐겨찾기 전체삭제
	int remove(String user_id) throws Exception;

	

}
