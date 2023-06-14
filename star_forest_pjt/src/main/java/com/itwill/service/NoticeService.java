package com.itwill.service;

import java.util.List;

import com.itwill.domain.Notice;
import com.itwill.domain.PageMakerDto;

public interface NoticeService {
	 
		PageMakerDto<Notice> selectAll(int currentPage) throws Exception;
		
		//공지사항 생성
		int create(Notice notice) throws Exception;
		
		//공지사항 수정
		int update(Notice notice) throws Exception;
		
		//공지사항 조회수
		int updateCount(int notice_no) throws Exception;
		
		//공지사항 삭제
		int delete(int notice_no) throws Exception;
		
		//공지사항 총 개수
		int noticeCount() throws Exception;
		
		Notice selectByNo(int notice_no) throws Exception;
		
}
