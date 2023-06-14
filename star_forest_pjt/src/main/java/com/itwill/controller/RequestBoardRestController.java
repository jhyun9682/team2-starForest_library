package com.itwill.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.controller.interceptor.LoginCheck;
import com.itwill.domain.RequestBoard;
import com.itwill.domain.RequestBoardListPageMaker;
import com.itwill.service.RequestBoardService;
import com.itwill.util.Criteria;
import com.itwill.util.PageMaker;


@RestController
public class RequestBoardRestController {
	@Autowired
	private RequestBoardService requestBoardService;
	
	
	@RequestMapping(value="/request_list_json", produces = "application/json;charset=UTF-8")
	public Map request_list_json(Criteria cri,Model model) {
		
		Map resultMap = new HashMap();
		int code=1;
		String url="";
		String msg="";
		//Log.info("boardListGET");
        System.out.println("Controller:"+cri);
        RequestBoardListPageMaker requestBoardListPageMaker=null;
        List<PageMaker> pageMakerList =null;
		try {
			
			requestBoardListPageMaker = requestBoardService.list(cri);
			pageMakerList = new ArrayList<>();
			pageMakerList.add(requestBoardListPageMaker.pageMaker);
		
			code=1;
			url="";
			msg="성공";
			
		
			//model.addAttribute("list",requestList);
			//model.addAttribute("pageMaker",pageMaker);
			
		}catch (Exception e) {
			code=2;
			msg="에러";
			e.printStackTrace();
		}
		
		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", requestBoardListPageMaker.boardList);
		resultMap.put("pageMaker", pageMakerList);
		System.out.println(requestBoardListPageMaker.boardList);
		//resultMap.put("keyword", key);
		
		return resultMap;
	}
	/*
	 * @RequestMapping(value="/request_list", produces =
	 * "application/json;charset=UTF-8") public Map request_list(Criteria cri,Model
	 * model) {
	 * 
	 * System.out.println(cri); Map resultMap = new HashMap(); int code=1; String
	 * url=""; String msg=""; //Log.info("boardListGET"); int startPage =-999; int
	 * endPage =-999; List<RequestBoard> resultList = new ArrayList<RequestBoard>();
	 * List<PageMaker> pageMakerList = new ArrayList<PageMaker>(); try {
	 * //List<RequestBoard> requestList = requestBoardService.selectAll();
	 * List<RequestBoard> requestList = requestBoardService.list(cri); int total =
	 * requestBoardService.countAll(); PageMaker pageMaker = new PageMaker(cri,
	 * total); cri.setKeyword(""); pageMakerList.add(pageMaker); startPage =
	 * pageMaker.getStartPage(); endPage = pageMaker.getEndPage(); code=1; url="";
	 * msg="성공"; resultList = requestList; //model.addAttribute("list",requestList);
	 * //model.addAttribute("pageMaker",pageMaker); }catch (Exception e) { code=2;
	 * msg="에러"; e.printStackTrace(); } resultMap.put("code", code);
	 * resultMap.put("url", url); resultMap.put("msg", msg); resultMap.put("data",
	 * resultList); resultMap.put("pageMaker", pageMakerList);
	 * resultMap.put("startPage", startPage); resultMap.put("endPage", endPage);
	 * return resultMap; }
	 */
	
	@RequestMapping(value = "/request_view_json", produces = "application/json;charset=UTF-8")
	public Map request_view_json(@RequestParam int board_no) {
		Map resultMap = new HashMap();
		int code=1;
		String msg="";
		List<RequestBoard> resultList = new ArrayList<RequestBoard>();
		
		try {
			requestBoardService.addReadCount(board_no);
			RequestBoard requestBoard = requestBoardService.selectOne(board_no);
			code=1;
			resultList.add(requestBoard);
			
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
	@LoginCheck
	@PostMapping(value="/request_write_action_json",produces = "application/json;charset=UTF-8")
	public Map request_write_action_json(@ModelAttribute RequestBoard requestBoard,HttpSession session) {
		Map resultMap = new HashMap();
		int code=1;
		String url="";
		String msg="";
		List<RequestBoard> resultList = new ArrayList<RequestBoard>();
		int rowCount=-999;
		try {
			String sUserId = (String)session.getAttribute("sUserId");
			requestBoard.setUser_id(sUserId);
			/*
			 * String board_status, int board_type_no, int board_depth, int board_step, int groupno, String category_name, String user_id
			 */
			if(sUserId=="admin") {
			//rowCount = requestBoardService.create(new RequestBoard(0, requestBoard.getBoard_title(), requestBoard.getBoard_date(), requestBoard.getBoard_content(), 0, requestBoard.getBoard_status(), 0, 0, 0, 0, requestBoard.getCategory_name(), sUserId));
			}else {
			rowCount = requestBoardService.create(new RequestBoard(0, requestBoard.getBoard_title(), requestBoard.getBoard_date(), requestBoard.getBoard_content(), 0, null, 1, 0, 0, 0, requestBoard.getCategory_name(), sUserId));
			code=1;
			msg="글쓰기가 완료되었습니다";
			resultList.add(requestBoard);
			}
		}catch (Exception e) {
			e.printStackTrace();
			msg="로그인 후 이용해주세요";
		}
		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);
		return resultMap;
	}
	/*
	 * 관리자 공지사항 쓰기
	 */
	@LoginCheck
	@PostMapping(value="/request_write_notice_action",produces = "application/json;charset=UTF-8")
	public Map request_write_notice_action(@ModelAttribute RequestBoard requestBoard,HttpSession session) {
		Map resultMap = new HashMap();
		int code=1;
		String url="";
		String msg="";
		List<RequestBoard> resultList = new ArrayList<RequestBoard>();
		int rowCount=-999;
		try {
			String sUserId = (String)session.getAttribute("sUserId");
			requestBoard.setUser_id(sUserId);
			/*
			 * String board_status, int board_type_no, int board_depth, int board_step, int groupno, String category_name, String user_id
			 */
			rowCount = requestBoardService.create_notice(new RequestBoard(0, requestBoard.getBoard_title(), requestBoard.getBoard_date(), requestBoard.getBoard_content(), 0, "공지사항", 0, 0, 0, 0, null, sUserId));
			msg="글쓰기가 완료되었습니다";
			resultList.add(requestBoard);
			code=1;
		}catch (Exception e) {
			e.printStackTrace();
			msg="로그인 후 이용해주세요";
		}
		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);
		return resultMap;
	}
	
	
	@PostMapping(value="/request_modify_form",produces = "application/json;charset=UTF-8")
	public Map request_modify_form(@RequestParam int board_no,HttpSession session) {
		Map resultMap = new HashMap();
		int code = 1;
		String msg="";
		List<RequestBoard> resultList = new ArrayList<RequestBoard>();
		
		try {
			String sUserId = (String)session.getAttribute("sUserId");
			String admin = "admin";
			RequestBoard requestBoard = requestBoardService.selectOne(board_no);
			if(requestBoard.getUser_id().equals(sUserId)||sUserId.equals(admin)) {
				//requestBoard.setUser_id(sUserId);
				code = 1;
				resultList.add(requestBoard);
			}else {
				code=2;
				msg="작성자만 수정가능합니다.";
			}
		}catch (Exception e) {
			code=0;
			e.printStackTrace();
			msg="로그인 후 사용해주세요.";
		}
		
		resultMap.put("msg", msg);
		resultMap.put("code", code);
		resultMap.put("data", resultList);
		
		return resultMap;
	}
	
	/*
	 * admin계정 답글쓰기
	 */
	@PostMapping(value="/request_reply_form",produces = "application/json;charset=UTF-8")
	public Map request_reply_form(@RequestParam int board_no,HttpSession session) {
		Map resultMap = new HashMap();
		int code = 1;
		String msg="";
		List<RequestBoard> resultList = new ArrayList<RequestBoard>();
		
		try {
			String sUserId = (String)session.getAttribute("sUserId");
			RequestBoard requestBoard = requestBoardService.selectOne(board_no);
			resultList.add(requestBoard);
		}catch (Exception e) {
			e.printStackTrace();
			msg="답글쓰기수정폼에러";
		}
		
		resultMap.put("msg", msg);
		resultMap.put("code", code);
		resultMap.put("data", resultList);
		
		return resultMap;
	}
	
	@PostMapping(value="/request_reply_action", produces = "application/json;charset=UTF-8")
	public Map request_reply_action(@ModelAttribute RequestBoard requestBoard,HttpSession session) {
		System.out.println(requestBoard);
		Map resultMap = new HashMap();
		int code = 1;
		String msg="";
		List<RequestBoard> resultList = new ArrayList<RequestBoard>();
		
		try {
			RequestBoard originalrequestBoard=requestBoardService.selectOne(requestBoard.board_no);
			requestBoard.setBoard_step(originalrequestBoard.getBoard_step());
			requestBoard.setBoardGroupno(originalrequestBoard.getBoard_Groupno());
			requestBoard.setBoard_depth(originalrequestBoard.getBoard_depth());
			requestBoard.setUser_id((String)session.getAttribute("sUserId"));
			
			
			int rowCount = requestBoardService.createReply(requestBoard);
			
			if(rowCount==1) {
				code=1;
				msg="답글이 완료되었습니다.";
			}else {
				code=2;
				msg="답글쓰기가 잘못되었습니다.";
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			code=0;
			msg="답글에서 뭔가가 잘못됨";
		}
		resultMap.put("msg", msg);
		resultMap.put("code", code);
		resultMap.put("data", resultList);
		return resultMap;
	}
	
	@PostMapping(value="/request_modify_action", produces = "application/json;charset=UTF-8")
	public Map request_modify_action(@ModelAttribute RequestBoard requestBoard) {
		Map resultMap = new HashMap();
		int code = 1;
		String msg="";
		List<RequestBoard> resultList = new ArrayList<RequestBoard>();
		
		try {
			int rowCount = requestBoardService.update(requestBoard);
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
		resultMap.put("data", resultList);
		return resultMap;
	}
	
	@PostMapping(value="/request_remove_action", produces = "application/json;charset=UTF-8")
	public Map request_remove_action(int board_groupno,HttpSession session) {
		Map resultMap = new HashMap();
		int code = 1;
		String msg="";
		String sUserId = (String)session.getAttribute("sUserId");
		String admin="admin";
		List<RequestBoard> resultList = new ArrayList<RequestBoard>();
		try {
			RequestBoard requestBoard = requestBoardService.selectBygroupNo(board_groupno);
			if(requestBoard.getUser_id().equals(sUserId)||sUserId.equals(admin)) {
			int rowCount = requestBoardService.deleteByGroupno(board_groupno);
			if(rowCount==1) {
				code=1;
				msg="삭제가 완료되었습니다.";
				
			}else if(rowCount==0){
				code=2;
				msg="답글이 달려있는 글은 삭제가 불가능합니다.";
			}
			}else {
				code=3;
				msg="작성자만 삭제 가능합니다.";
			}
		}catch (Exception e) {
			e.printStackTrace();
			code=0;
			msg="관리자만 삭제 가능합니다.";
		}
		resultMap.put("msg", msg);
		resultMap.put("code", code);
		resultMap.put("data", resultList);
		return resultMap;
	}
	/*
	 * admin 삭제
	 */
	@PostMapping(value="/request_remove_admin_action", produces = "application/json;charset=UTF-8")
	public Map request_remove_admin_action(@RequestParam int board_no,HttpSession session) {
		Map resultMap = new HashMap();
		String msg="";
		int code=-999;
		String sUserId = (String)session.getAttribute("sUserId");
		String admin = "admin";
		try {
			if(sUserId.equals(admin)) {
			int rowCount = requestBoardService.delete(board_no);
			msg="삭제가 완료되었습니다";
			code=1;
			}
		} catch (Exception e) {
			code=2;
			msg="삭제에서 에러났네";
		}
		resultMap.put("msg", msg);
		resultMap.put("code", code);
		return resultMap;
	}
	
	
	
	
	@PostMapping("/user_request_list")
	public Map user_request_list(HttpServletRequest request) {
		Map resultMap = new HashMap();
		int code = 1;
		String msg="";
		List<RequestBoard> resultList = new ArrayList<RequestBoard>();
		
		try {
			String sUserId=(String)request.getSession().getAttribute("sUserId");
			List<RequestBoard> userList= requestBoardService.findUserBoard(sUserId);
			code=1;
			msg="성공";
			resultList.addAll(userList);
		}catch (Exception e) {
			e.printStackTrace();
			code=0;
			msg="로그인 후 이용해주세요.";
		}
		
		resultMap.put("msg", msg);
		resultMap.put("code", code);
		resultMap.put("data", resultList);
		return resultMap;
	}
}
