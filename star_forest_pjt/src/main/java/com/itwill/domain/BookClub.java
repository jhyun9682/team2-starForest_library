package com.itwill.domain;

public class BookClub {
	private int club_no;
	private String club_name;
	private int club_count;
	private String club_person;
	private String club_time;
	private String club_place;
	private String club_content;
	private int club_readcount;
	private int category_no;
	private String user_id;
	
	
	public BookClub() {
		// TODO Auto-generated constructor stub
	}


	public BookClub(int club_no, String club_name, int club_count, String club_person, String club_time,
			String club_place, String club_content, int club_readcount, int category_no, String user_id) {
		super();
		this.club_no = club_no;
		this.club_name = club_name;
		this.club_count = club_count;
		this.club_person = club_person;
		this.club_time = club_time;
		this.club_place = club_place;
		this.club_content = club_content;
		this.club_readcount = club_readcount;
		this.category_no = category_no;
		this.user_id = user_id;
	}


	public int getClub_no() {
		return club_no;
	}


	public void setClub_no(int club_no) {
		this.club_no = club_no;
	}


	public String getClub_name() {
		return club_name;
	}


	public void setClub_name(String club_name) {
		this.club_name = club_name;
	}


	public int getClub_count() {
		return club_count;
	}


	public void setClub_count(int club_count) {
		this.club_count = club_count;
	}


	public String getClub_person() {
		return club_person;
	}


	public void setClub_person(String club_person) {
		this.club_person = club_person;
	}


	public String getClub_time() {
		return club_time;
	}


	public void setClub_time(String club_time) {
		this.club_time = club_time;
	}


	public String getClub_place() {
		return club_place;
	}


	public void setClub_place(String club_place) {
		this.club_place = club_place;
	}


	public String getClub_content() {
		return club_content;
	}


	public void setClub_content(String club_content) {
		this.club_content = club_content;
	}


	public int getClub_readcount() {
		return club_readcount;
	}


	public void setClub_readcount(int club_readcount) {
		this.club_readcount = club_readcount;
	}


	public int getCategory_no() {
		return category_no;
	}


	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	@Override
	public String toString() {
		return "BookClub [club_no=" + club_no + ", club_name=" + club_name + ", club_count=" + club_count
				+ ", club_person=" + club_person + ", club_time=" + club_time + ", club_place=" + club_place
				+ ", club_content=" + club_content + ", club_readcount=" + club_readcount + ", category_no="
				+ category_no + ", user_id=" + user_id + "]";
	}


	
	
}
