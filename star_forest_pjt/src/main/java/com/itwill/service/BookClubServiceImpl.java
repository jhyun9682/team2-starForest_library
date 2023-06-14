package com.itwill.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.domain.BookClub;
import com.itwill.repository.BookClubDao;
import com.itwill.util.Criteria;

@Service
public class BookClubServiceImpl implements BookClubService {
	@Autowired
	private BookClubDao bookClubDao;
	
	//동아리 개설
	@Override
	public int create(BookClub bookClub) throws Exception {
		return bookClubDao.create(bookClub);
	}


	//카테고리별 동아리리스트 조회
	@Override
	public List<BookClub> selectByCategory(int category_no) throws Exception {
		return bookClubDao.selectByCategory(category_no);
	}

	//내가 신청한 동아리 리스트
	@Override
	public List<BookClub> selectById(String user_id) throws Exception {
		return bookClubDao.selectById(user_id);
	}

	//동아리 상세보기
	@Override
	public BookClub selectByNo(int club_no) throws Exception {
		return bookClubDao.selectByNo(club_no);
	}
	
	//가입된 동아리 중복체크
	@Override
	public int isDuplicate(String user_id,int club_no) throws Exception{
		return bookClubDao.isDuplicate(user_id, club_no);
	}
	
	//동아리 내용 수정
	@Override
	public int update(BookClub bookClub) throws Exception {
		return bookClubDao.update(bookClub);
	}

	//동아리 가입 (동시에 인원수 카운트)
	@Override
	public int clubJoin(String user_id,int club_no) throws Exception {
		return bookClubDao.clubJoin(user_id,club_no);
	}
	
	//동아리 조회수 증가
	@Override
	public int addReadCount(int club_no) throws Exception {
		return bookClubDao.addReadCount(club_no);
	}

	//동아리 삭제
	@Override
	public int remove(int club_no) throws Exception {
		return bookClubDao.remove(club_no);
	}


	@Override
	public int clubCount(Criteria cri) throws Exception {
		return bookClubDao.clubCount(cri);
	}

	@Override
	public List<BookClub> selectAll(Criteria cri) throws Exception {
		return bookClubDao.selectAll(cri);
	}

	
	
	
}
