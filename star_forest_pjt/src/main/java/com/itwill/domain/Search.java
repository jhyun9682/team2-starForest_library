package com.itwill.domain;
//검색기능

public class Search {
	
	private int book_no;
	private String book_title;
	private String book_author;
	private String book_image;
	private String book_image_src;
	private String book_publisher;
	Book book;
	
	private int category_no;
	private String category_name;

	private int cateno;//참조 번호
	private int level;//상위 하위
	
	
	//검색 필터
		private String type;//검색 타입
		private String Keyword; //검색 내용
	
	
	public Search(int book_no, String book_title, String book_author, String book_image, String book_image_src,
			String book_publisher, Book book, int category_no, String category_name, int cateno, int level, String type,
			String keyword) {
		super();
		this.book_no = book_no;
		this.book_title = book_title;
		this.book_author = book_author;
		this.book_image = book_image;
		this.book_image_src = book_image_src;
		this.book_publisher = book_publisher;
		this.book = book;
		this.category_no = category_no;
		this.category_name = category_name;
		this.cateno = cateno;
		this.level = level;
		this.type = type;
		Keyword = keyword;
	}

	@Override
	public String toString() {
		return "Search [book_no=" + book_no + ", book_title=" + book_title + ", book_author=" + book_author
				+ ", book_image=" + book_image + ", book_image_src=" + book_image_src + ", book_publisher="
				+ book_publisher + ", book=" + book + ", category_no=" + category_no + ", category_name="
				+ category_name + ", cateno=" + cateno + ", level=" + level + ", type=" + type + ", Keyword=" + Keyword
				+ "]";
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public String getBook_publisher() {
		return book_publisher;
	}

	public void setBook_publisher(String book_publisher) {
		this.book_publisher = book_publisher;
	}


	
	
	
	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getCateno() {
		return cateno;
	}

	public void setCateno(int cateno) {
		this.cateno = cateno;
	}

	
	
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKeyword() {
		return Keyword;
	}

	public void setKeyword(String keyword) {
		Keyword = keyword;
	}

	public Search() {
		// TODO Auto-generated constructor stub
	}
	

	

	//검색 리스트_분야
	public Search(int category_no) {
		super();
		this.category_no = category_no;
		
	}
	
	//검색 리스트_성공
	public Search(int book_no, String book_title, String book_author,
			String book_image, String book_image_src
			) {
		super();
		this.book_no = book_no;
		this.book_title = book_title;
		this.book_author = book_author;
		this.book_image = book_image;
		this.book_image_src = book_image_src;//필요?
	}
	
	//검색 리스트_성공
	public Search(int book_no, String book_title, String book_author, String book_image, String book_image_src,
			String book_publisher, String category_name) {
		super();
		this.book_no = book_no;
		this.book_title = book_title;
		this.book_author = book_author;
		this.book_image = book_image;
		this.book_image_src = book_image_src;
		this.book_publisher = book_publisher;
		this.category_name = category_name;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	public int getBook_no() {
		return book_no;
	}

	public void setBook_no(int book_no) {
		this.book_no = book_no;
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

	

	public int getCategory_no() {
		return category_no;
	}

	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}


	

	
	
}