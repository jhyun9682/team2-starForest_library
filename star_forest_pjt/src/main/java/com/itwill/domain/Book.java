package com.itwill.domain;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;
@Alias("Book")
public class Book {
	
	int book_no;
	int isbn;
	String book_title;
	String book_author;
	String book_publisher;
	String book_summary;
	String book_publish_date;
	Date book_input_date;
	String book_image;
	String book_image_src;
	int book_page;
	int book_qty;
	int book_res_cnt;
	int book_rental_cnt;
	int category_no;
	Rental rental; //생성자랑 toString에서 rental 지움 만약 렌탈부분 오류가 난다면 여기를 확인해보자,,, insert 때문에 지웠는데 다시 추가해야겠지,,?
	
	
	public Book() {
	}

	//favorite에서 사용
	public Book(int book_no, int isbn, String book_title, String book_author, String book_publisher, String book_image,
			String book_image_src) {
		super();
		this.book_no = book_no;
		this.isbn = isbn;
		this.book_title = book_title;
		this.book_author = book_author;
		this.book_publisher = book_publisher;
		this.book_image = book_image;
		this.book_image_src = book_image_src;
	}



	public Book(int book_no, int isbn, String book_title, String book_author, String book_publisher,
			String book_summary, String book_publish_date, Date book_input_date, String book_image,
			String book_image_src, int book_page, int book_qty, int book_res_cnt, int book_rental_cnt, int category_no) {
		super();
		this.book_no = book_no;
		this.isbn = isbn;
		this.book_title = book_title;
		this.book_author = book_author;
		this.book_publisher = book_publisher;
		this.book_summary = book_summary;
		this.book_publish_date = book_publish_date;
		this.book_input_date = book_input_date;
		this.book_image = book_image;
		this.book_image_src = book_image_src;
		this.book_page = book_page;
		this.book_qty = book_qty;
		this.book_res_cnt = book_res_cnt;
		this.book_rental_cnt = book_rental_cnt;
		this.category_no = category_no;
	}

	public int getBook_no() {
		return book_no;
	}

	public void setBook_no(int book_no) {
		this.book_no = book_no;
	}

	public int getIsbn() {
		return isbn;
	}

	public void setIsbn(int isbn) {
		this.isbn = isbn;
	}

	public String getBook_title() {
		return book_title;
	}

	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}

	public String getBook_author() {
		return book_author;
	}

	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}

	public String getBook_publisher() {
		return book_publisher;
	}

	public void setBook_publisher(String book_publisher) {
		this.book_publisher = book_publisher;
	}

	public String getBook_summary() {
		return book_summary;
	}

	public void setBook_summary(String book_summary) {
		this.book_summary = book_summary;
	}

	public String getBook_publish_date() {
		return book_publish_date;
	}

	public void setBook_publish_date(String book_publish_date) {
		this.book_publish_date = book_publish_date;
	}


	public Date getBook_input_date() {
		return book_input_date;
	}

	public void setBook_input_date(Date book_input_date) {
		this.book_input_date = book_input_date;
	}

	public String getBook_image() {
		return book_image;
	}
	
	public void setBook_image(String book_image) {
		this.book_image = book_image;
	}
	
	public String getBook_image_src() {
		return book_image_src;
	}

	public void setBook_image_src(String book_image_src) {
		this.book_image_src = book_image_src;
	}

	public int getBook_page() {
		return book_page;
	}

	public void setBook_page(int book_page) {
		this.book_page = book_page;
	}

	public int getBook_qty() {
		return book_qty;
	}

	public void setBook_qty(int book_qty) {
		this.book_qty = book_qty;
	}

	public int getBook_res_cnt() {
		return book_res_cnt;
	}

	public void setBook_res_cnt(int book_res_cnt) {
		this.book_res_cnt = book_res_cnt;
	}

	public int getBook_rental_cnt() {
		return book_rental_cnt;
	}

	public void setBook_rental_cnt(int book_rental_cnt) {
		this.book_rental_cnt = book_rental_cnt;
	}

	public int getCategory_no() {
		return category_no;
	}

	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}

	public Rental getRental() {
		return rental;
	}

	public void setRental(Rental rental) {
		this.rental = rental;
	}


	@Override
	public String toString() {
		return "Book [book_no=" + book_no + ", isbn=" + isbn + ", book_title=" + book_title + ", book_author="
				+ book_author + ", book_publisher=" + book_publisher + ", book_summary=" + book_summary
				+ ", book_publish_date=" + book_publish_date + ", book_input_date=" + book_input_date + ", book_image="
				+ book_image + ", book_image_src=" + book_image_src + ", book_page=" + book_page + ", book_qty="
				+ book_qty + ", book_res_cnt=" + book_res_cnt + ", book_rental_cnt=" + book_rental_cnt
				+ ", category_no=" + category_no + "]"; //렌탈빼봄 insert할때문제됨 ㅡㅡ
	}



}




