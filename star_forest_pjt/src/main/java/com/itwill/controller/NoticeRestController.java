package com.itwill.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.domain.Notice;
import com.itwill.domain.PageMakerDto;
import com.itwill.domain.RequestBoard;
import com.itwill.service.NoticeService;

@RestController
public class NoticeRestController {
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/notice_list_rest")
	public Map<String, Object> notice_list_rest(@RequestParam(required = false, defaultValue ="1") Integer pageno){
		System.out.println(pageno);
		Map<String, Object> resultMap = new HashMap<>();
		PageMakerDto<Notice> notice = null;
		try {
			notice = noticeService.selectAll(pageno);
			resultMap.put("errorCode", 1);
			resultMap.put("errorMsg", "성공");
			resultMap.put("data", notice);
		}catch (Exception e) {
			e.printStackTrace();
			resultMap.put("errorCode", -1);
			resultMap.put("errorMsg", "error");
		}
		System.out.println(notice);
		return resultMap;
	}
	
	
	@RequestMapping(value = "/notice_detail_rest", produces = "application/json;charset=UTF-8")
	public Map notice_detail_rest(@RequestParam int notice_no) {
		Map resultMap = new HashMap();
		int code=1;
		String msg="";
		List<Notice> resultList = new ArrayList<Notice>();
		
		try {
			noticeService.updateCount(notice_no);
			Notice notice= noticeService.selectByNo(notice_no);
			code=1;
			resultList.add(notice);
			System.out.println(notice);
		}catch (Exception e) {
			e.printStackTrace();
			code=2;
			msg="상세보기가 잘못된듯";
		}
		resultMap.put("msg",msg);
		resultMap.put("code",code);
		resultMap.put("data",resultList);
		return resultMap;
	}
	
	@PostMapping(value="/notice_modify_form",produces = "application/json;charset=UTF-8")
	public Map notice_modify_form(@RequestParam int notice_no,HttpSession session) {
		Map resultMap = new HashMap();
		int code = 1;
		String msg="";
		List<Notice> resultList = new ArrayList<Notice>();
		
		try {
			System.out.println("modify_form");
			String sUserId = (String)session.getAttribute("sUserId");
			String admin = "admin";
			Notice notice = noticeService.selectByNo(notice_no);
			System.out.println(notice);
		}catch (Exception e) {
			e.printStackTrace();
			msg="글쓰기수정폼에러";
		}
		
		resultMap.put("msg", msg);
		resultMap.put("code", code);
		resultMap.put("data", resultList);
		
		return resultMap;
	}
	
	@PostMapping(value="/notice_modify_action", produces = "application/json;charset=UTF-8")
	public Map notice_modify_action(@ModelAttribute Notice notice) {
		Map resultMap = new HashMap();
		int code = 1;
		String msg="";
		List<Notice> resultList = new ArrayList<Notice>();
		int rowCount = 0;
		try {
			System.out.println("modify_action start");
			rowCount = noticeService.update(notice);
			System.out.println(rowCount);
			if(rowCount==1) {
				code=1;
				msg="수정이 완료되었습니다.";
			}else {
				code=2;
				msg="수정에서 에러남";
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			code=0;
			msg="수정에서 뭔가가 잘못됨";
		}
		resultMap.put("msg", msg);
		resultMap.put("code", code);
		resultMap.put("data", notice.getNotice_no());
		return resultMap;
	}
	
	@PostMapping(value="/notice_delete_action", produces = "application/json;charset=UTF-8")
	public Map notice_delete_action(@RequestParam int notice_no) {
		Map resultMap = new HashMap();
		int code = 1;
		String msg="";
		List<Notice> resultList = new ArrayList<Notice>();
		System.out.println("delete_action start");
		try {
			int rowCount = noticeService.delete(notice_no);
			if(rowCount==1) {
				code=1;
				msg="삭제가 완료되었습니다.";
				System.out.println(rowCount);
			}else if(rowCount==0){
				code=2;
				msg="답글이 달려있는 글은 삭제가 불가능합니다.";
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			code=0;
			msg="삭제에서 뭔가가 잘못됨";
		}
		resultMap.put("msg", msg);
		resultMap.put("code", code);
		resultMap.put("data", resultList);
		return resultMap;
	}
	
	@PostMapping(value="/notice_write_action", produces = "application/json;charset=UTF-8")
	public Map notice_write_action(@ModelAttribute Notice notice) {
		Map resultMap = new HashMap();
		System.out.println(notice);
		int code = 1;
		String msg="";
		System.out.println("write_action start");
		List<Notice> resultList = new ArrayList<Notice>();
		System.out.println("write222");
		int rowCount = 0;
		try { 
			rowCount = noticeService.create(notice);
			System.out.println(notice);
			if(rowCount==1) {
				System.out.println("code111");
				System.out.println(rowCount);
				code=1;
				msg="등록이 완료되었습니다.";
			}else {
				code=2;
				msg="error";
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			code=0;
			msg="error";
		}
		resultMap.put("msg", msg);
		resultMap.put("code", code);
		resultMap.put("data", notice.getNotice_no());
		return resultMap;
	}
}
