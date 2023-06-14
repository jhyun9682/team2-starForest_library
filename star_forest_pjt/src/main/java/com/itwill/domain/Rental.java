package com.itwill.domain;

import java.util.Date;

public class Rental {
	
	int rental_no;
	Date rental_date;
	Date return_duedate;
	Date return_date;
	int rental_status;
	int book_no;
	String user_id;
	
	private String keyword;
	
	public Rental() {
	}
	
	
	public Rental(int rental_no, Date rental_date, Date return_duedate, Date return_date, int rental_status,
			int book_no, String user_id) {
		super();
		this.rental_no = rental_no;
		this.rental_date = rental_date;
		this.return_duedate = return_duedate;
		this.return_date = return_date;
		this.rental_status = rental_status;
		this.book_no = book_no;
		this.user_id = user_id;
	}


	public int getRental_no() {
		return rental_no;
	}


	public void setRental_no(int rental_no) {
		this.rental_no = rental_no;
	}


	public Date getRental_date() {
		return rental_date;
	}


	public void setRental_date(Date rental_date) {
		this.rental_date = rental_date;
	}


	public Date getReturn_duedate() {
		return return_duedate;
	}


	public void setReturn_duedate(Date rental_duedate) {
		this.return_duedate = rental_duedate;
	}


	public Date getReturn_date() {
		return return_date;
	}


	public void setReturn_date(Date return_date) {
		this.return_date = return_date;
	}


	public int getRental_status() {
		return rental_status;
	}


	public void setRental_status(int rental_status) {
		this.rental_status = rental_status;
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
	
	
	public String getKeyword() {
		return keyword;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}


	@Override
	public String toString() {
		return "Rental [rental_no=" + rental_no + ", rental_date=" + rental_date + ", rental_duedate=" + return_duedate
				+ ", return_date=" + return_date + ", rental_status=" + rental_status + ", book_no=" + book_no
				+ ", user_id=" + user_id + "]";
	}

	
	
}
