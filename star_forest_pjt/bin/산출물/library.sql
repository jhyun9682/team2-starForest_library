
/* Drop Tables */

DROP TABLE favorite CASCADE CONSTRAINTS;
DROP TABLE Rental CASCADE CONSTRAINTS;
DROP TABLE Reservation CASCADE CONSTRAINTS;
DROP TABLE Book CASCADE CONSTRAINTS;
DROP TABLE Book_club CASCADE CONSTRAINTS;
DROP TABLE Request_board CASCADE CONSTRAINTS;
DROP TABLE Seat_reservation CASCADE CONSTRAINTS;
DROP TABLE User_info CASCADE CONSTRAINTS;
DROP TABLE Book_category CASCADE CONSTRAINTS;
DROP TABLE Notice CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_Books_detail_books_no;
DROP SEQUENCE SEQ_Book_book_no;
DROP SEQUENCE SEQ_Book_club_club_no;
DROP SEQUENCE SEQ_favorite_favorite_no;
DROP SEQUENCE SEQ_Notice_notice_no;
DROP SEQUENCE SEQ_Request_board_board_no;
DROP SEQUENCE SEQ_Reservation_res_no;
DROP SEQUENCE SEQ_Seat_seat_no;




/* Create Sequences */

CREATE SEQUENCE SEQ_Books_detail_books_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Book_book_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Book_club_club_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_favorite_favorite_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Notice_notice_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Request_board_board_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Reservation_res_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_Seat_seat_no INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE Book
(
	book_no number NOT NULL,
	isbn number NOT NULL,
	book_title varchar2(500 char) NOT NULL,
	book_author varchar2(500 char),
	book_publisher varchar2(500),
	book_summary varchar2(600),
	book_publish_date varchar2(200 char),
	book_input_date date,
	book_image varchar2(500),
	book_image_src varchar2(500 char),
	book_page number,
	book_qty number,
	book_res_cnt number,
	book_rental_cnt number,
	category_no number NOT NULL,
	PRIMARY KEY (book_no)
);


CREATE TABLE Book_category
(
	category_no number NOT NULL,
	category_name varchar2(50),
	PRIMARY KEY (category_no)
);


CREATE TABLE Book_club
(
	club_no number NOT NULL,
	club_name varchar2(50),
	club_count number,
	club_person varchar2(100 char),
	club_time varchar2(100),
	club_place varchar2(100),
	club_content varchar2(500),
	club_readcount number,
	category_no number NOT NULL,
	user_id varchar2(100) NOT NULL UNIQUE,
	PRIMARY KEY (club_no)
);


CREATE TABLE favorite
(
	favorite_no number NOT NULL,
	book_no number NOT NULL,
	user_id varchar2(100) NOT NULL UNIQUE,
	PRIMARY KEY (favorite_no)
);


CREATE TABLE Notice
(
	notice_no number NOT NULL,
	notice_title varchar2(100),
	notice_date date,
	notice_content varchar2(600),
	notice_image varchar2(100),
	notice_readcount number,
	PRIMARY KEY (notice_no)
);


CREATE TABLE Rental
(
	rental_no number NOT NULL,
	rental_date date,
	return_date date,
	rental_status number DEFAULT 1 NOT NULL,
	book_no number NOT NULL,
	user_id varchar2(100) NOT NULL,
	PRIMARY KEY (rental_no)
);


CREATE TABLE Request_board
(
	board_no number NOT NULL,
	board_title varchar2(50),
	board_date date,
	board_content varchar2(50),
	board_readcount number DEFAULT 0,
	board_status varchar2(100) DEFAULT '0',
	board_type_no number,
	board_depth number,
	board_step number,
	board_groupno number,
	category_no number NOT NULL,
	user_id varchar2(100) NOT NULL UNIQUE,
	PRIMARY KEY (board_no)
);


CREATE TABLE Reservation
(
	res_no number NOT NULL,
	res_date date,
	res_status number DEFAULT 1,
	book_no number NOT NULL,
	user_id varchar2(100) NOT NULL UNIQUE,
	PRIMARY KEY (res_no)
);


CREATE TABLE Seat_reservation
(
	seat_no varchar2(50 char) NOT NULL,
	seat_date date,
	seat_start_time varchar2(50),
	seat_end_time varchar2(50),
	seat_status number DEFAULT 0,
	user_id varchar2(100),
	PRIMARY KEY (seat_no)
);


CREATE TABLE User_info
(
	user_id varchar2(100) NOT NULL,
	user_name varchar2(50) NOT NULL,
	user_password varchar2(20),
	user_email varchar2(100),
	user_birth date,
	user_gender varchar2(50),
	user_phone varchar2(30),
	user_address varchar2(50),
	user_qr varchar2(50),
	user_rental_status varchar2(100 char),
	user_book_cnt_limit number,
	user_book_weight number,
	category_no number NOT NULL,
	PRIMARY KEY (user_id)
);



/* Create Foreign Keys */

ALTER TABLE favorite
	ADD FOREIGN KEY (book_no)
	REFERENCES Book (book_no)
;


ALTER TABLE Rental
	ADD FOREIGN KEY (book_no)
	REFERENCES Book (book_no)
;


ALTER TABLE Reservation
	ADD FOREIGN KEY (book_no)
	REFERENCES Book (book_no)
;


ALTER TABLE Book
	ADD FOREIGN KEY (category_no)
	REFERENCES Book_category (category_no)
;


ALTER TABLE Book_club
	ADD FOREIGN KEY (category_no)
	REFERENCES Book_category (category_no)
;


ALTER TABLE Request_board
	ADD FOREIGN KEY (category_no)
	REFERENCES Book_category (category_no)
;


ALTER TABLE User_info
	ADD FOREIGN KEY (category_no)
	REFERENCES Book_category (category_no)
;


ALTER TABLE Book_club
	ADD FOREIGN KEY (user_id)
	REFERENCES User_info (user_id)
;


ALTER TABLE favorite
	ADD FOREIGN KEY (user_id)
	REFERENCES User_info (user_id)
;


ALTER TABLE Rental
	ADD FOREIGN KEY (user_id)
	REFERENCES User_info (user_id)
;


ALTER TABLE Request_board
	ADD FOREIGN KEY (user_id)
	REFERENCES User_info (user_id)
;


ALTER TABLE Reservation
	ADD FOREIGN KEY (user_id)
	REFERENCES User_info (user_id)
;


ALTER TABLE Seat_reservation
	ADD FOREIGN KEY (user_id)
	REFERENCES User_info (user_id)
;



