package com.itwill.domain;

public class GoodSQL {
	public static final String SELECT_BY_CATEGORYNO 
	= "select * from (select b.book_no, b.isbn, b.book_title,b.book_author,b.book_publisher,b.book_image, bc.category_no,bc.category_name from book b join book_category bc on b.category_no =bc.category_no where bc.category_no=? order by dbms_random.value) where rownum < 11";
/*
 * 
 *분야 랜덤 추출 수량고정 조건추가*
select * from 
(select b.book_no, b.isbn, b.book_title,b.book_author,b.book_publisher,b.book_image, bc.category_no,bc.category_name 
from book b join book_category bc
on b.category_no =bc.category_no
where bc.category_no=100
order by dbms_random.value)
where rownum < 11;

select * from (select b.book_no, b.isbn, b.book_title,b.book_author,b.book_publisher,b.book_image, bc.category_no,bc.category_name from book b join book_category bc on b.category_no =bc.category_no where bc.category_no=? order by dbms_random.value) where rownum < 11;

 **분야 번호 검색*
select *
from book b join book_category bc
on b.category_no =bc.category_no
where bc.category_no=100;

select  b.book_no, b.isbn, b.book_title,b.book_author,b.book_publisher,b.book_image, bc.category_no,bc.category_name 
from book b join book_category bc
on b.category_no =bc.category_no
where bc.category_no=100;

*분야 랜덤 추출*
select * from book sample(10) where category_no=100;

*분야 랜덤 추출 수량고정*
select * from (select * from book where category_no=100
order by dbms_random.value) where rownum < 11;
 *
 */
}
