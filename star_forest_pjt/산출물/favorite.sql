/*******favorite*******
이름          널?       유형            
----------- -------- ------------- 
FAVORITE_NO NOT NULL NUMBER        
USER_ID     NOT NULL VARCHAR2(100) 
BOOK_NO     NOT NULL NUMBER  
*/

desc favorite;
desc book;


--insert--
insert into favorite values(SEQ_favorite_favorite_no.nextval,'yeji',1);
insert into favorite values(SEQ_favorite_favorite_no.nextval,'soyoon',1);
insert into favorite values(SEQ_favorite_favorite_no.nextval,'hyeonjeong',3);
insert into favorite values(SEQ_favorite_favorite_no.nextval,'junghyun',4);
insert into favorite values(SEQ_favorite_favorite_no.nextval,'woohyuk',5);


--select--
/*즐겨찾기 중복체크*/
select count(*) from favorite where user_id='yeji' and book_no=3;
/*즐겨찾기 상세보기*/
select b.isbn,b.book_title,b.book_author,b.book_publisher from favorite f join book b on f.book_no=b.book_no where favorite_no=3;   
/*'yeji'의 즐겨찾기 목록*/
select f.favorite_no,b.isbn,b.book_title,b.book_author,b.book_publisher from favorite f join book b on f.book_no=b.book_no where user_id='yeji';

--delete--
/*즐겨찾기 일부삭제*/
delete from favorite where favorite_no=1;
/*즐겨찾기 전체삭제*/
delete from favorite where user_id='yeji';
