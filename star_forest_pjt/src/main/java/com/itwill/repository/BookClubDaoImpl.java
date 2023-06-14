package com.itwill.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.domain.BookClub;
import com.itwill.mapper.BookClubMapper;
import com.itwill.mapper.UserMapper;
import com.itwill.util.Criteria;

@Repository
public class BookClubDaoImpl implements BookClubDao {
	@Autowired
	private BookClubMapper bookClubMapper;
	

	@Override
	public int create(BookClub bookClub) throws Exception {
		return bookClubMapper.create(bookClub);
	}

	
	@Override
	public List<BookClub> selectByCategory(int category_no) throws Exception {
		return bookClubMapper.selectBycategory(category_no);
	}

	@Override
	public List<BookClub> selectById(String user_id) throws Exception {
		return bookClubMapper.selectById(user_id);
	}

	@Override
	public BookClub selectByNo(int club_no) throws Exception {
		return bookClubMapper.selectByNo(club_no);
	}
	
	@Override
	public int isDuplicate(String user_id,int club_no) throws Exception{
		return bookClubMapper.isDuplicate(user_id, club_no);
	}

	@Override
	public int update(BookClub bookClub) throws Exception {
		return bookClubMapper.update(bookClub);
		
	}
	@Override
	public int clubJoin(String user_id,int club_no) throws Exception {
		return bookClubMapper.clubJoin(user_id,club_no);
	}
	@Override
	public int addReadCount(int club_no) throws Exception{
		return bookClubMapper.addReadCount(club_no);
	}
	
	@Override
	public int remove(int club_no) throws Exception {
		return bookClubMapper.remove(club_no);
	}


	@Override
	public int clubCount(Criteria cri) throws Exception {
		return bookClubMapper.clubCount(cri);
	}

	@Override
	public List<BookClub> selectAll(Criteria cri) throws Exception {
		return bookClubMapper.selectAll(cri);
	}

	

	
	
}
