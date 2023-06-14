package com.itwill.domain;

import java.util.Date;

public class Reservation {
	
	int res_no;
	Date res_date;
	int res_status;
	int book_no;
	String user_id;
	
	public Reservation() {
	}
	
	public Reservation(int res_no, Date res_date, int res_status, int book_no, String user_id) {
		super();
		this.res_no = res_no;
		this.res_date = res_date;
		this.res_status = res_status;
		this.book_no = book_no;
		this.user_id = user_id;
	}
	public int getRes_no() {
		return res_no;
	}
	public void setRes_no(int res_no) {
		this.res_no = res_no;
	}
	public Date getRes_date() {
		return res_date;
	}
	public void setRes_date(Date res_date) {
		this.res_date = res_date;
	}
	public int getRes_status() {
		return res_status;
	}
	public void setRes_status(int res_status) {
		this.res_status = res_status;
	}
	public int getBook_no() {
		return book_no;
	}
	public void setBook_no(int book_no) {
		this.book_no = book_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	
	@Override
	public String toString() {
		return "Reservation [res_no=" + res_no + ", res_date=" + res_date + ", res_status=" + res_status + ", book_no="
				+ book_no + ", user_id=" + user_id + "]";
	}
	
	
	

}
