package com.itwill.domain;
	/*
  이름              널?       유형            
--------------- -------- ------------- 
BOARD_NO        NOT NULL NUMBER        
BOARD_TITLE              VARCHAR2(100) 
BOARD_DATE               DATE          
BOARD_CONTENT            VARCHAR2(100) 
BOARD_READCOUNT          NUMBER        
BOARD_STATUS             VARCHAR2(100) 
BOARD_TYPE_NO            NUMBER        
BOARD_DEPTH              NUMBER        
BOARD_STEP               NUMBER        
GROUPNO                  NUMBER        
CATEGORY_NO     NOT NULL NUMBER        
USER_ID         NOT NULL VARCHAR2(100) 
	 */
import java.util.Date;

public class RequestBoard {
	public int board_no;
	public String board_title;
	public Date board_date;
	public String board_content;
	public int board_readcount;
	public String board_status;
	public int board_type_no;
	public int board_depth;
	public int board_step;
	public int board_groupno;
	public String category_name;
	public String user_id;
	
	public RequestBoard() {
		// TODO Auto-generated constructor stub
	}

	public RequestBoard(int board_no, String board_title, Date board_date, String board_content, int board_readcount,
			String board_status, int board_type_no, int board_depth, int board_step, int board_groupno, String category_name,
			String user_id) {
		super();
		this.board_no = board_no;
		this.board_title = board_title;
		this.board_date = board_date;
		this.board_content = board_content;
		this.board_readcount = board_readcount;
		this.board_status = board_status;
		this.board_type_no = board_type_no;
		this.board_depth = board_depth;
		this.board_step = board_step;
		this.board_groupno = board_groupno;
		this.category_name = category_name;
		this.user_id = user_id;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public Date getBoard_date() {
		return board_date;
	}

	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public int getBoard_Readcount() {
		return board_readcount;
	}

	public void setBoard_Readcount(int board_readcount) {
		this.board_readcount = board_readcount;
	}

	public String getBoard_status() {
		return board_status;
	}

	public void setBoard_status(String board_status) {
		this.board_status = board_status;
	}

	public int getBoard_type_no() {
		return board_type_no;
	}

	public void setBoard_type_no(int board_type_no) {
		this.board_type_no = board_type_no;
	}

	public int getBoard_depth() {
		return board_depth;
	}

	public void setBoard_depth(int board_depth) {
		this.board_depth = board_depth;
	}

	public int getBoard_step() {
		return board_step;
	}

	public void setBoard_step(int board_step) {
		this.board_step = board_step;
	}

	public int getBoard_Groupno() {
		return board_groupno;
	}

	public void setBoardGroupno(int board_groupno) {
		this.board_groupno = board_groupno;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "RequestBoard [board_no=" + board_no + ", board_title=" + board_title + ", board_date=" + board_date
				+ ", board_content=" + board_content + ", board_readcount=" + board_readcount + ", board_status=" + board_status
				+ ", board_type_no=" + board_type_no + ", board_depth=" + board_depth + ", board_step=" + board_step
				+ ", board_groupno=" + board_groupno + ", category_name=" + category_name + ", user_id=" + user_id + "]";
	}
	
	
}