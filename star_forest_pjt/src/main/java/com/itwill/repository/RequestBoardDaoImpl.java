package com.itwill.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.itwill.domain.RequestBoard;
import com.itwill.mapper.RequestBoardMapper;
import com.itwill.util.Criteria;

public class RequestBoardDaoImpl implements RequestBoardDao{
	@Autowired
	private RequestBoardMapper requestBoardMapper;
	
	@Override
	public int create(RequestBoard requestBoard) throws Exception {
		return requestBoardMapper.create(requestBoard);
	}
	
	@Override
	public int create_notice(RequestBoard requestBoard) throws Exception {
		return requestBoardMapper.create_notice(requestBoard);
	}

	@Override
	public int createReply(RequestBoard requestBoard) throws Exception {
		//RequestBoard temp = requestBoardMapper.selectOne(requestBoard.getBoard_no());
		return requestBoardMapper.createReply(requestBoard);
	}

	@Override
	public List<RequestBoard> findUserBoard(String user_id) throws Exception {
		return requestBoardMapper.findUserBoard(user_id);
	}

	@Override
	public boolean isExisted(int board_groupno) throws Exception {
		boolean isExisted=false;
		if(requestBoardMapper.isExisted(board_groupno)==true) {
			isExisted=true;
		}else {
			isExisted=false;
		}
		return isExisted;
	}

	@Override
	public int delete(int board_no) throws Exception {
		return requestBoardMapper.delete(board_no);
	}

	@Override
	public int deleteByGroupno(int board_groupno) throws Exception {
		return requestBoardMapper.deleteByGroupno(board_groupno);
	}

	@Override
	public int update(RequestBoard requestBoard) throws Exception {
		return requestBoardMapper.update(requestBoard);
	}
	
	@Override
	public int addStep(RequestBoard requestBoard) throws Exception{
		return requestBoardMapper.addStep(requestBoard);
	}
	@Override
	public int addReadCount(int board_no) throws Exception {
		return requestBoardMapper.addReadCount(board_no);
	}
	
	

	@Override
	public int countAll(Criteria cri) throws Exception {
		return requestBoardMapper.countAll(cri);
	}

	@Override
	public RequestBoard selectOne(int board_no) throws Exception {
		return requestBoardMapper.selectOne(board_no);
	}

	@Override
	public List<RequestBoard> list(int pageBegin,int pageEnd,Criteria cri) throws Exception {
		
		System.out.println("3.Dao-->"+cri);
		Map map=new HashMap();
		map.put("pageBegin",pageBegin);
		map.put("pageEnd",pageEnd);
		map.put("cri",cri);
		System.out.println(">>>>>"+map);
		return requestBoardMapper.list(map);
	}

	@Override
	public RequestBoard selectBygroupNo(int board_groupno) throws Exception {
		return requestBoardMapper.selectBygroupNo(board_groupno);
	}

}