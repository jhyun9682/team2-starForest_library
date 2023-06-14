package com.itwill.domain;

public class Favorite {
	
	int favorite_no;
	String user_id;
	Book book;
	
	public Favorite() {
	}

	
	
	public Favorite(int favorite_no, String user_id, Book book) {
		super();
		this.favorite_no = favorite_no;
		this.user_id = user_id;
		this.book = book;
	}


	public int getFavorite_no() {
		return favorite_no;
	}

	public void setFavorite_no(int favorite_no) {
		this.favorite_no = favorite_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}



	public Book getBook() {
		return book;
	}



	public void setBook(Book book) {
		this.book = book;
	}



	@Override
	public String toString() {
		return "Favorite [favorite_no=" + favorite_no + ", user_id=" + user_id + ", book=" + book + "]";
	}

	

	
	
	

}
