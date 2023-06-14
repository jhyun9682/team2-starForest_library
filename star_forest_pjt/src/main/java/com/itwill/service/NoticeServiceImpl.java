package com.itwill.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.domain.PageMaker;
import com.itwill.domain.Notice;
import com.itwill.domain.PageMakerDto;
import com.itwill.repository.NoticeDao;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDao noticeDao;

	@Override
	public int create(Notice notice) throws Exception {
		return noticeDao.create(notice);
	}

	@Override
	public PageMakerDto<Notice> selectAll(int currentPage) throws Exception {
		int totNoticeCount = noticeDao.noticeCount();
		PageMaker pageMaker = new PageMaker(totNoticeCount, currentPage, 10, 5);
		List<Notice> noticeList = noticeDao.selectAll(pageMaker.getPageBegin(), pageMaker.getPageEnd());
		PageMakerDto<Notice> pageMakerNoticeList = new PageMakerDto<Notice>(noticeList, pageMaker, totNoticeCount);
		
		return pageMakerNoticeList;
	}

	@Override
	public int update(Notice notice) throws Exception {
		return noticeDao.update(notice);
	}

	@Override
	public int delete(int notice_no) throws Exception {
		return noticeDao.delete(notice_no);
	}

	@Override
	public int noticeCount() throws Exception {
		return noticeDao.noticeCount();
	}

	@Override
	public int updateCount(int notice_no) throws Exception {
		return noticeDao.updateCount(notice_no);
	}

	@Override
	public Notice selectByNo(int notice_no) throws Exception {
		return noticeDao.selectByNo(notice_no);
	}
	
	
}
