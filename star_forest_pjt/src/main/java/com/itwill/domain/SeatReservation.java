package com.itwill.domain;
/*
 이름              널?       유형                
--------------- -------- ----------------- 
SEAT_NO         NOT NULL VARCHAR2(50 CHAR) 
SEAT_DATE                DATE              
SEAT_START_TIME          VARCHAR2(50)      
SEAT_END_TIME            VARCHAR2(50)      
SEAT_STATUS              NUMBER            
USER_ID                  VARCHAR2(100)     
 */

import java.util.Date;

public class SeatReservation {
	public String seat_no;
	public Date seat_date;
	public String seat_start_time;
	public String seat_end_time;
	public int seat_status;
	public String user_id;
	
	public SeatReservation() {
		// TODO Auto-generated constructor stub
	}
	
	
	public SeatReservation(String seat_no, Date seat_date, String seat_start_time, String seat_end_time,
			int seat_status, String user_id) {
		super();
		this.seat_no = seat_no;
		this.seat_date = seat_date;
		this.seat_start_time = seat_start_time;
		this.seat_end_time = seat_end_time;
		this.seat_status = seat_status;
		this.user_id = user_id;
	}





	public String getSeat_no() {
		return seat_no;
	}
	public void setSeat_no(String seat_no) {
		this.seat_no = seat_no;
	}
	public Date getSeat_date() {
		return seat_date;
	}
	public void setSeat_date(Date seat_date) {
		this.seat_date = seat_date;
	}
	public String getSeat_start_time() {
		return seat_start_time;
	}
	public void setSeat_start_time(String seat_start_time) {
		this.seat_start_time = seat_start_time;
	}
	public String getSeat_end_time() {
		return seat_end_time;
	}
	public void setSeat_end_time(String seat_end_time) {
		this.seat_end_time = seat_end_time;
	}
	public int getSeat_status() {
		return seat_status;
	}
	public void setSeat_status(int seat_status) {
		this.seat_status = seat_status;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	@Override
	public String toString() {
		return "SeatReservation [seat_no=" + seat_no + ", seat_date=" + seat_date + ", seat_start_time="
				+ seat_start_time + ", seat_end_time=" + seat_end_time + ", seat_status=" + seat_status + ", user_id="
				+ user_id + "]";
	}
	
	
}
