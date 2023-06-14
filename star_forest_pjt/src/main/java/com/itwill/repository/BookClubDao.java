package com.itwill.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.itwill.domain.BookClub;
import com.itwill.util.Criteria;


public interface BookClubDao {

	//동아리생성
	int create(BookClub bookClub) throws Exception;	
	 
	//동아리 총 카운트
	int clubCount(Criteria cri) throws Exception;
	
	//동아리 전체리스트
	List<BookClub> selectAll(Criteria cri) throws Exception;
	
	//카테고리별 동아리조회
	List<BookClub> selectByCategory(int category_no) throws Exception;
	
	//회원이 가입한 동아리조회
	List<BookClub> selectById(String user_id) throws Exception;
	
	//동아리상세보기
	BookClub selectByNo(int club_no) throws Exception;
	
	//가입된 동아리 중복체크
	int isDuplicate(String user_id,int club_no) throws Exception;
	
	//동아리수정
	int update(BookClub bookClub) throws Exception;
	
	//동아리 가입되면서 인원수 카운트
	int clubJoin(String user_id,int club_no) throws Exception;
	
	//동아리 조회수 증가
	int addReadCount(int club_no) throws Exception;
	
	//동아리삭제
	int remove(int club_no) throws Exception;
	
	
}
