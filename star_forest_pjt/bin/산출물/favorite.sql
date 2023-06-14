/*******favorite*******
이름          널?       유형     
----------- -------- ------ 
FAVORITE_NO NOT NULL NUMBER 
USER_NO     NOT NULL NUMBER 
BOOK_NO     NOT NULL NUMBER


이름                널?       유형            
----------------- -------- ------------- 
BOOK_NO           NOT NULL NUMBER        
BOOK_TITLE        NOT NULL VARCHAR2(100) 
BOOK_AUTHOR                VARCHAR2(100) 
BOOK_PUBLISHER             VARCHAR2(100) 
BOOK_SUMMARY               VARCHAR2(500) 
BOOK_PUBLISH_DATE          DATE          
BOOK_INPUT_DATE            DATE          
BOOK_IMAGE                 VARCHAR2(500) 
BOOK_PAGE                  NUMBER        
BOOK_QTY                   NUMBER        
BOOK_RES_COUNT             NUMBER        
BOOK_GROUPNO               NUMBER        
CATEGORY_NO       NOT NULL NUMBER   
*/

desc favorite;
desc book;

insert into book values(SEQ_book_book_no.nextval,'가','가','가','가',sysdate,sysdate,'1.png',89,3,3,1,1);
insert into book values(SEQ_book_book_no.nextval,'나','나','나','나',sysdate,sysdate,'1.png',89,3,3,1,1);
insert into book values(SEQ_book_book_no.nextval,'다','작가','출판사','요약',sysdate,sysdate,'1.png',89,3,3,1,1);

--insert--
insert into favorite values(SEQ_favorite_favorite_no.nextval,1,1);
insert into favorite values(SEQ_favorite_favorite_no.nextval,1,2);
insert into favorite values(SEQ_favorite_favorite_no.nextval,1,3);
insert into favorite values(SEQ_favorite_favorite_no.nextval,2,4);
insert into favorite values(SEQ_favorite_favorite_no.nextval,3,2);
insert into favorite values(SEQ_favorite_favorite_no.nextval,3,3);

--select--
/*즐겨찾기목록에 이미 있는지확인*/
select count(*) from favorite where user_no=1 and book_no=1;
/*즐겨찾기 상세보기*/
select * from favorite f join book b on f.book_no=b.book_no where favorite_no=1;   
/*'user_no=3'의 즐겨찾기 목록*/
select * from favorite f join book b on f.book_no=b.book_no where user_no=3;

--delete--
/*즐겨찾기 일부삭제*/
delete from favorite where favorite_no=1;
/*즐겨찾기 전체삭제*/
delete from favorite where user_no=1;
