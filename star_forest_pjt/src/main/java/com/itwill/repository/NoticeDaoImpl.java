package com.itwill.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.domain.Notice;
import com.itwill.mapper.NoticeMapper;

@Repository
public class NoticeDaoImpl implements NoticeDao{
	
	@Autowired
	private NoticeMapper noticeMapper;
	
	public NoticeDaoImpl() {
	}
	
	public NoticeMapper getNoticeMapper() {
		return noticeMapper;
	}
	public void setNoticeMappper(NoticeMapper noticeMapper) {
		System.out.println(">>> noticeDaoImpl():setNoticeMappper()");
		this.noticeMapper = noticeMapper;
	}
	
	@Override
	public int create(Notice notice) throws Exception {
		System.out.println(">>>noticeDaoImpl:create()");
		return noticeMapper.create(notice);
	}

	@Override
	public List<Notice> selectAll(int pageStart, int pageEnd) throws Exception {
		System.out.println(">>>noticeDaoImpl:selectAll()");
		Map<String, Integer>map = new HashMap<>();
		map.put("pageStart", pageStart);
		map.put("pageEnd", pageEnd);
		return noticeMapper.selectAll(pageStart, pageEnd);
	}

	@Override
	public int update(Notice notice) throws Exception {
		System.out.println(">>>noticeDaoImpl:update()");
		return noticeMapper.update(notice);
	}

	@Override
	public int updateCount(int notice_no) throws Exception {
		System.out.println(">>>noticeDaoImpl:updateCount()");
		return noticeMapper.updateCount(notice_no);
	}

	@Override
	public int delete(int notice_no) throws Exception {
		System.out.println(">>>noticeDaoImpl:delete()");
		return noticeMapper.delete(notice_no);
	}

	@Override
	public int noticeCount() throws Exception {
		System.out.println(">>>noticeDaoImpl:noticeCount()");
		return noticeMapper.noticeCount();
	}

	@Override
	public Notice selectByNo(int notice_no) throws Exception {
		System.out.println(">>>noticeDaoImpl:selectByNo()");
		return noticeMapper.selectByNo(notice_no);
	}

	
	
	
	
	
}
