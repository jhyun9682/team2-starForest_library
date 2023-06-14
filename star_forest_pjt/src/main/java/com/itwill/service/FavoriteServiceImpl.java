package com.itwill.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.domain.Favorite;
import com.itwill.repository.FavoriteDao;

@Service
public class FavoriteServiceImpl implements FavoriteService {
	@Autowired
	private FavoriteDao favoriteDao;
	
	//즐겨찾기추가
	@Override
	public int insert(Favorite favorite) throws Exception {
		return favoriteDao.insert(favorite);
		
		
	}

	//즐겨찾기 중복체크
	public int isExisted(String user_id,int book_no) throws Exception {
		boolean isExisted=favoriteDao.isExisted(user_id, book_no);
		int result=0;
		if(isExisted==false) {
			result= 0;
		}else if(isExisted==true) {
			result= 1;
		}
		return result;
	}
	
	//회원의 즐겨찾기 목록보기
	@Override
	public List<Favorite> selectById(String user_id) throws Exception {
		return favoriteDao.selectById(user_id);
	}

	//즐겨찾기 상세보기
	@Override
	public Favorite selectByNo(int favorite_no) throws Exception {
		return favoriteDao.selectByNo(favorite_no);
	}

	//즐겨찾기 일부삭제
	@Override
	public int deleteByNo(int favorite_no) throws Exception {
		return favoriteDao.deleteByNo(favorite_no);
	}

	//즐겨찾기 전체삭제
	@Override
	public int remove(String user_id) throws Exception {
		return favoriteDao.remove(user_id);
	}

	
}
