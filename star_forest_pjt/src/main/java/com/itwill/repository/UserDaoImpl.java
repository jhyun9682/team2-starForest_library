package com.itwill.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.domain.User;
import com.itwill.mapper.UserMapper;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired
	private UserMapper userMapper;

	@Override
	public int create(User user) throws Exception {
		return userMapper.create(user);
	}

	@Override
	public int updatePassword(User user) throws Exception {
		return userMapper.updatePassword(user);
	}

	@Override
	public int update(User user) throws Exception {
		return userMapper.update(user);
	}

	@Override
	public int remove(String user_id) throws Exception {
		return userMapper.remove(user_id);
	}

	@Override
	public List<User> userList() throws Exception {
		return userMapper.userList();
	}

	@Override
	public User findUser(String user_id) throws Exception {
		return userMapper.findUser(user_id);
	}

	@Override
	public boolean existedUser(String user_id) throws Exception {
		int count = userMapper.existedUser(user_id);
		if (count > 0) {
			return true; //존재하면 true
		} else {
			return false; //존재하지 않으면 false
		}
	}

	@Override
	public boolean PWcheck(String user_id, String user_password) throws Exception {
		int count = userMapper.PWcheck(user_id, user_password);
		if (count == 1 ) {
			return true;
		} else {
			return false;
		}

	}

	@Override
	public int userRentalCount(String user_id) throws Exception {
		return userMapper.userRentalCount(user_id);
	}

	@Override
	public int rentalStopPeriod(String user_id) throws Exception {
		return userMapper.rentalStopPeriod(user_id);
	}

	@Override
	public int userReturnCount(String user_id) throws Exception {
		return userMapper.userReturnCount(user_id);
	}

	@Override
	public int userRentalStatus(String user_id) throws Exception {
		return userMapper.userRentalStatus(user_id);
	}

	@Override
	public int selectUserRentalStatus(String user_id) {
		return userMapper.selectUserRentalStatus(user_id);
	}


}
