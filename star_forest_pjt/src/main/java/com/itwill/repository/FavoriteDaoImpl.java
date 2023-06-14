package com.itwill.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.domain.Book;
import com.itwill.domain.Favorite;
import com.itwill.mapper.FavoriteMapper;

@Repository
public class FavoriteDaoImpl implements FavoriteDao {
	@Autowired
	private FavoriteMapper favoriteMapper;
	
	@Override
	public int insert(Favorite favorite) throws Exception {
		return favoriteMapper.insert(favorite.getUser_id(),favorite.getBook().getBook_no());
	}

	@Override
	public boolean isExisted(String user_id,int book_no) throws Exception {
		Favorite favorite=new Favorite(0, user_id, new Book(book_no, 0, null, null, null, null, null));
		boolean isExisted=false;
		int count=favoriteMapper.isExisted(favorite.getUser_id(),favorite.getBook().getBook_no());
		if(count==0) {
			isExisted=false;
		}else if(count>=1) {
			isExisted=true;
		}
		return isExisted;
	}

	@Override
	public List<Favorite> selectById(String user_id) throws Exception {
		return favoriteMapper.selectById(user_id);
	}

	@Override
	public Favorite selectByNo(int favorite_no) throws Exception {
		return favoriteMapper.selectByNo(favorite_no);
	}

	@Override
	public int deleteByNo(int favorite_no) throws Exception {
		return favoriteMapper.deleteByNo(favorite_no);
	}

	@Override
	public int remove(String user_id) throws Exception {
		return favoriteMapper.remove(user_id);
	}

	

}
