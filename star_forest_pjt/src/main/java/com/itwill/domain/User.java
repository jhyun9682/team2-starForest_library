package com.itwill.domain;


public class User {
	private String user_id;
	private String user_name;
	private String user_password;
	private String user_email;
	private String user_birth;
	private String user_gender;
	private String user_phone;
	private String user_address;
	private String user_qr;
	private String user_rental_status;
	private int user_book_cnt_limit;
	private int user_book_weight;
	private int category_no; 
	
	public User() {
		// TODO Auto-generated constructor stub
	}
	//로그인
	public User(String user_id,String user_password) {
		this.user_id=user_id;
		this.user_password=user_password;
	}
	//가입,수정
	public User(String user_id, String user_name, String user_password, String user_email, String user_birth,
			String user_gender, String user_phone, String user_address, int category_no) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_password = user_password;
		this.user_email = user_email;
		this.user_birth = user_birth;
		this.user_gender = user_gender;
		this.user_phone = user_phone;
		this.user_address = user_address;
		this.category_no = category_no;
	}
	
	public User(String user_id, String user_name, String user_password, String user_email, String user_birth,
			String user_gender, String user_phone, String user_address, String user_qr,
			String user_rental_status, int user_book_cnt_limit, int user_book_weight, int category_no) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_password = user_password;
		this.user_email = user_email;
		this.user_birth = user_birth;
		this.user_gender = user_gender;
		this.user_phone = user_phone;
		this.user_address = user_address;
		this.user_qr = user_qr;
		this.user_rental_status = user_rental_status;
		this.user_book_cnt_limit = user_book_cnt_limit;
		this.user_book_weight = user_book_weight;
		this.category_no = category_no;
	}
	

	
	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_birth() {
		return user_birth;
	}

	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}

	public String getUser_gender() {
		return user_gender;
	}

	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_address() {
		return user_address;
	}

	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}

	public String getUser_qr() {
		return user_qr;
	}

	public void setUser_qr(String user_qr) {
		this.user_qr = user_qr;
	}

	public String getUser_rental_status() {
		return user_rental_status;
	}

	public void setUser_rental_status(String user_rental_status) {
		this.user_rental_status = user_rental_status;
	}

	public int getUser_book_cnt_limit() {
		return user_book_cnt_limit;
	}

	public void setUser_book_cnt_limit(int user_book_cnt_limit) {
		this.user_book_cnt_limit = user_book_cnt_limit;
	}

	public int getUser_book_weight() {
		return user_book_weight;
	}

	public void setUser_book_weight(int user_book_weight) {
		this.user_book_weight = user_book_weight;
	}

	public int getCategory_no() {
		return category_no;
	}

	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}
	
	

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", user_name=" + user_name + ", user_password=" + user_password
				+ ", user_email=" + user_email + ", user_birth=" + user_birth + ", user_gender=" + user_gender
				+ ", user_phone=" + user_phone + ", user_address=" + user_address + ", user_qr=" + user_qr
				+ ", user_rental_status=" + user_rental_status
				+ ", user_book_cnt_limit=" + user_book_cnt_limit + ", user_book_weight=" + user_book_weight
				+ ", category_no=" + category_no + "]";
	}

	// 비밀번호 일치 확인
	public boolean isMatchPassword(String password) {
		boolean isMatch = false;
		if (this.user_password.equals(password)) {
			isMatch = true;
		}
		return isMatch;
	}

	
}
