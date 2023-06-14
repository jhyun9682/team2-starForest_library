package com.itwill.service;

import java.security.interfaces.RSAMultiPrimePrivateCrtKey;
import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.domain.BookCategory;
import com.itwill.domain.RequestBoard;
import com.itwill.domain.RequestBoardListPageMaker;
import com.itwill.repository.RequestBoardDao;
import com.itwill.util.Criteria;
import com.itwill.util.PageMaker;
@Service
public class RequestBoardServiceImpl implements RequestBoardService{
	@Autowired
	private RequestBoardDao requestBoardDao;
	
	@Override
	public int create(RequestBoard requestBoard) throws Exception {
		return requestBoardDao.create(requestBoard);
	}
	
	@Override
	public int create_notice(RequestBoard requestBoard) throws Exception {
		return requestBoardDao.create_notice(requestBoard);
	}
	/*
	 * 답글생성
	 */
	@Override
	public int createReply(RequestBoard requestBoard) throws Exception {
				requestBoardDao.addStep(requestBoard);
		return requestBoardDao.createReply(requestBoard);
	}

	@Override
	public List<RequestBoard> findUserBoard(String user_id) throws Exception {
		return requestBoardDao.findUserBoard(user_id);
	}

	@Override
	public boolean isExisted(int board_groupno) throws Exception {
		return requestBoardDao.isExisted(board_groupno);
	}

	@Override
	public int delete(int board_no) throws Exception {
		return requestBoardDao.delete(board_no);
	}

	@Override
	public int deleteByGroupno(int board_groupno) throws Exception {
		/*
		 * 답글이 있으면 삭제 불가능:0
		 * 답글 없으면 삭제 가능:1
		 */
		int rowCount = -999;
		if(requestBoardDao.isExisted(board_groupno)==true) {
			rowCount = 0;
		}else if(requestBoardDao.isExisted(board_groupno)==false) {
			rowCount =requestBoardDao.deleteByGroupno(board_groupno);
		}
		return rowCount;
	}

	@Override
	public int update(RequestBoard requestBoard) throws Exception {
		return requestBoardDao.update(requestBoard);
	}
	
	public int addStep(RequestBoard requestBoard) throws Exception{
		return requestBoardDao.addStep(requestBoard);
	}
	@Override
	public int addReadCount(int board_no) throws Exception {
		return requestBoardDao.addReadCount(board_no);
	}


	
	
	@Override
	public int countAll(Criteria cri) throws Exception {
		return requestBoardDao.countAll(cri);
	}

	@Override
	public RequestBoard selectOne(int board_no) throws Exception {
		return requestBoardDao.selectOne(board_no);
	}

	@Override
	public RequestBoardListPageMaker list(Criteria cri) throws Exception {
		
		
		RequestBoardListPageMaker boardListPageMaker=new RequestBoardListPageMaker();
		int totCount=requestBoardDao.countAll(cri);
		System.out.println("totCount==>"+totCount);
		PageMaker pageMaker=new PageMaker(cri, totCount);
		
		
		List<RequestBoard> boardList= requestBoardDao.list(pageMaker.getPageBegin(),pageMaker.getPageEnd(),cri);
		
		boardListPageMaker.boardList=boardList;
		boardListPageMaker.pageMaker=pageMaker;
		boardListPageMaker.totRecordCount=totCount;
		return boardListPageMaker;
	}

	@Override
	public RequestBoard selectBygroupNo(int board_groupno) throws Exception {
		
		return requestBoardDao.selectBygroupNo(board_groupno);
	}

}