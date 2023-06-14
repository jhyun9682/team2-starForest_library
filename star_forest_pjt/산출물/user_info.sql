/***********User***********
이름                  널?       유형            
------------------- -------- ------------- 
USER_ID             NOT NULL VARCHAR2(100) 
USER_NAME                    VARCHAR2(50)  
USER_PASSWORD                VARCHAR2(20)  
USER_EMAIL                   VARCHAR2(100) 
USER_BIRTH                   DATE          
USER_GENDER                  VARCHAR2(50)  
USER_PHONE                   VARCHAR2(30)  
USER_ADDRESS                 VARCHAR2(50)  
USER_QR                      VARCHAR2(50)  
USER_RENTAL_STATUS           VARCHAR2(100) 
USER_BOOK_CNT_LIMIT          NUMBER        
USER_BOOK_WEIGHT             NUMBER        
CATEGORY_NO         NOT NULL NUMBER      
*/

desc user_info;
desc book_category;
--category--
insert into book_category values(100,'건강/취미/레저');
insert into book_category values(200,'경제경영');
insert into book_category values(300,'고전');
insert into book_category values(400,'과학');
insert into book_category values(500,'만화');
insert into book_category values(600,'사회과학');
insert into book_category values(700,'소설/시/희곡');

--user_info insert--
insert into user_info values('yeji','한예지','1111','yeji@naver.com','1995-01-30','F','01012345678','경기도 김포시',null,'대출가능(미연체)',3,15,100);
insert into user_info values('soyoon','장소윤','2222','soyun@naver.com','1994-08-04','F','01012345678','경기도 김포시',null,'대출가능(미연체)',3,80,200);
insert into user_info values('hyeonjeong','임현정','3333','hyeonjeong@naver.com','1994-06-12','F','01012345678','경기도 김포시',null,'대출불가(연체)',3,56,300);
insert into user_info values('junghyun','이정현','4444','jeonghyun@naver.com','1996-08-09','F','01012345678','경기도 김포시',null,'대출불가(연체)',3,45,400);
insert into user_info values('woohyuk','이우혁','5555','woohyuk@naver.com','1997-03-23','F','01012345678','경기도 김포시',null,'대출불가(연체)',3,88,600);
insert into user_info values('admin','관리자','0000','admin@naver.com','1980-03-23','M','01012345678','경기도 김포시',null,'대출가능(미연체)',0,0,100);

--select--
/*모든 회원의 정보 출력*/
select user_id,user_name,user_password,user_email,user_birth,user_gender,user_phone,user_address,user_rental_status,user_book_cnt_limit from user_info;
select u.user_id,u.user_name,u.user_password,u.user_email,u.user_birth,u.user_gender,u.user_phone,u.user_address,u.user_rental_status,u.user_book_cnt_limit,c.category_name from user_info u join book_category c on u.category_no=c.category_no;
/*'yeji'회원의 정보 출력*/
select * from user_info u join book_category c on u.category_no=c.category_no where user_id='yeji';
/*아이디 중복체크*/
select count(*) cnt from user_info where user_id='soyoon';
/*비밀번호 체크*/
select count(*) cnt from user_info where user_id='yeji' and user_password='1111';
/*대출 정지기간(0이상이면 그 수만큼 대출정지,0미만은 대출가능)*/
select min(r.return_date)-min(r.return_duedate) period from user_info u join rental r on u.user_id=r.user_id where u.user_id='yeji';


--update--
/*회원 비밀번호변경*/
update user_info set user_password='1234' where user_id='yeji';
/*'yeji' 회원 정보 수정 - 이름,성별,아이디,qr,대출가능여부 변경 불가 */
update user_info set user_password='2222',user_email='ddo@naver.com',user_birth='1994-01-01',user_phone='01022223333',user_address='경기도 부천시',category_no=200 where user_id='soyoon';
/*yeji 대출권수 카운트*/
update user_info set user_book_cnt_limit=user_book_cnt_limit-1 where user_book_cnt_limit>0 and user_id='soyoon';
/*대출가능상태여부*/
update user_info set user_rental_status='대출불가(연체)' where  user_id='yeji' and (select min(r.return_date)-min(r.return_duedate) from user_info u join rental r on u.user_id=r.user_id  where u.user_id='woohyuk')>0;
/*정지기간지나면 대출가능*/
update user_info set user_rental_status='대출가능(미연체)' where user_id='woohyuk' and (select min(r.return_date)-min(r.return_duedate) from user_info u join rental r on u.user_id=r.user_id where u.user_id='woohyuk')<0;

--delete--
/*회원탈퇴*/
delete from user_info where user_id='yeji';

commit;