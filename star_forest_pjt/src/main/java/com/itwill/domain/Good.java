package com.itwill.domain;
//추천 도서

public class Good {
private int book_no;
private int isbn; //필요?
private String book_title;
private String book_author;
private String book_publisher;
private String book_image;
//private String book_image_src; 필요?
private int category_no; //
private String category_name; // no, name 둘중하나 없애도 될듯?

public Good() {
	// TODO Auto-generated constructor stub
}

public Good(int book_no, int isbn, String book_title, String book_author, String book_publisher, String book_image,
		int category_no, String category_name) {
	super();
	this.book_no = book_no;
	this.isbn = isbn;
	this.book_title = book_title;
	this.book_author = book_author;
	this.book_publisher = book_publisher;
	this.book_image = book_image;
	this.category_no = category_no;
	this.category_name=category_name;
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

public String getBook_image() {
	return book_image;
}

public void setBook_image(String book_image) {
	this.book_image = book_image;
}

public int getCategory_no() {
	return category_no;
}

public void setCategory_no(int category_no) {
	this.category_no = category_no;
}

public String getCategory_name() {
	return category_name;
}

public void setCategory_name(String category_name) {
	this.category_name = category_name;
}

@Override
public String toString() {
	return "Good [book_no=" + book_no + ", isbn=" + isbn + ", book_title=" + book_title + ", book_author=" + book_author
			+ ", book_publisher=" + book_publisher + ", book_image=" + book_image + ", category_no=" + category_no
			+ ", category_name=" + category_name + "]";
}


}
