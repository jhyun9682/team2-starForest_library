desc request_board;

--게시물 생성

insert into request_board values(SEQ_REQUEST_BOARD_BOARD_NO.nextval,'지구인만큼 지구를 사랑할 순 없어 신청합니다',sysdate, 
'정세랑 작가님 신작 지구인만큼 지구를 사랑할 순 없어 책 신청해주세요',0,0,1,0,1,SEQ_REQUEST_BOARD_BOARD_NO.currval,700,'soyoon');

insert into request_board values(SEQ_REQUEST_BOARD_BOARD_NO.nextval,'명탐정 코난 86권 신청합니다',sysdate, 
'명탐정 코난이 없어요 신청합니다',0,0,1,0,1,SEQ_REQUEST_BOARD_BOARD_NO.currval,500,'hyeonjeong');

insert into request_board values(SEQ_REQUEST_BOARD_BOARD_NO.nextval,'개미란 무엇인가 신청합니다',sysdate, 
'개미가 어떤 곤충인지 너무 궁금해요 신청합니다',0,0,1,0,1,SEQ_REQUEST_BOARD_BOARD_NO.currval,400,'junghyun');

insert into request_board values(SEQ_REQUEST_BOARD_BOARD_NO.nextval,'나는 소망한 내게 금지된 것을 신청합니다',sysdate, 
'양귀자작가님 나는 소망한 내게 금지된 것을 책 보고싶어요',0,0,1,0,1,SEQ_REQUEST_BOARD_BOARD_NO.currval,700,'soyoon');

--4번 글에 대한 답글 생성
insert into request_board values(SEQ_REQUEST_BOARD_BOARD_NO.nextval,'신청완료',sysdate, 
'신청하신 해당 책 신청됐습니다.',0,0,2,0,2,21,700,'manager');

update request_board set board_step=board_step+1 where board_step>1 and groupno=21;

--soyoon이 쓴 신청 게시물 확인
select *
from request_board
where user_id = 'soyoon';

--게시물 존재 여부
SELECT count(*) cnt FROM request_board WHERE groupno = 8 AND board_depth >= 0 AND board_step >= 1 ORDER BY board_step,board_depth ASC;

--신청 게시물 삭제
--게시물번호
delete from request_board where board_no=8;
--게시물 그룹번호로 전체삭제
delete from request_board where group_no=8;

--신청 게시물 수정
update request_board set board_title='',board_content='' where board_no=8;


--8번 게시물 조회수 추가
update request_board set board_readcount=board_readcount+1 where board_no=8;

--모든 게시물 리스트
select * from
request_board
order by board_groupno desc, board_step asc;

select * from
( SELECT rownum idx, s.*  FROM
				( SELECT * FROM request_board
					ORDER BY board_type_no asc,board_groupno DESC,board_step ASC
				) s
		 );

--게시물 건수 확인
select count(*)
from request_board;

--8번 게시물 보기
select *
from request_board
where board_no=8;


SELECT * FROM
		( SELECT rownum idx, s.*  FROM
				( SELECT board_no, board_title, user_id,board_date,board_readcount,board_groupno,board_step, board_depth FROM request_board
					ORDER BY board_type_no asc,board_groupno DESC,board_step ASC
				) s
		 )
WHERE idx >=1 AND idx <= 10 ;



insert into request_board values(SEQ_REQUEST_BOARD_BOARD_NO.nextval,'안녕',sysdate,'ㅎㅇ',0,'신청접수',1,0,1,SEQ_REQUEST_BOARD_BOARD_NO.currval,'소설/시/희곡','yeji');
insert into request_board values(SEQ_REQUEST_BOARD_BOARD_NO.nextval,'안녕',sysdate,'ㅎㅇ',0,'신청접수',1,0,1,SEQ_REQUEST_BOARD_BOARD_NO.currval,'소설/시/희곡','yeji');
insert into request_board values(SEQ_REQUEST_BOARD_BOARD_NO.nextval,'안녕',sysdate,'ㅎㅇ',0,'신청접수',1,0,1,SEQ_REQUEST_BOARD_BOARD_NO.currval,'소설/시/희곡','yeji');
insert into request_board values(SEQ_REQUEST_BOARD_BOARD_NO.nextval,'안녕',sysdate,'ㅎㅇ',0,'신청접수',1,0,1,SEQ_REQUEST_BOARD_BOARD_NO.currval,'소설/시/희곡','yeji');
insert into request_board values(SEQ_REQUEST_BOARD_BOARD_NO.nextval,'안녕',sysdate,'ㅎㅇ',0,'신청접수',1,0,1,SEQ_REQUEST_BOARD_BOARD_NO.currval,'소설/시/희곡','yeji');
insert into request_board values(SEQ_REQUEST_BOARD_BOARD_NO.nextval,'안녕',sysdate,'ㅎㅇ',0,'신청접수',1,0,1,SEQ_REQUEST_BOARD_BOARD_NO.currval,'소설/시/희곡','yeji');
insert into request_board values(SEQ_REQUEST_BOARD_BOARD_NO.nextval,'안녕',sysdate,'ㅎㅇ',0,'신청접수',1,0,1,SEQ_REQUEST_BOARD_BOARD_NO.currval,'소설/시/희곡','yeji');
insert into request_board values(SEQ_REQUEST_BOARD_BOARD_NO.nextval,'안녕',sysdate,'ㅎㅇ',0,'신청접수',1,0,1,SEQ_REQUEST_BOARD_BOARD_NO.currval,'소설/시/희곡','yeji');
insert into request_board values(SEQ_REQUEST_BOARD_BOARD_NO.nextval,'안녕',sysdate,'ㅎㅇ',0,'신청접수',1,0,1,SEQ_REQUEST_BOARD_BOARD_NO.currval,'소설/시/희곡','yeji');
insert into request_board values(SEQ_REQUEST_BOARD_BOARD_NO.nextval,'안녕',sysdate,'ㅎㅇ',0,'신청접수',1,0,1,SEQ_REQUEST_BOARD_BOARD_NO.currval,'소설/시/희곡','yeji');
insert into request_board values(SEQ_REQUEST_BOARD_BOARD_NO.nextval,'안녕',sysdate,'ㅎㅇ',0,'신청접수',1,0,1,SEQ_REQUEST_BOARD_BOARD_NO.currval,'소설/시/희곡','yeji');
insert into request_board values(SEQ_REQUEST_BOARD_BOARD_NO.nextval,'안녕',sysdate,'ㅎㅇ',0,'신청접수',1,0,1,SEQ_REQUEST_BOARD_BOARD_NO.currval,'소설/시/희곡','yeji');
insert into request_board values(SEQ_REQUEST_BOARD_BOARD_NO.nextval,'안녕',sysdate,'ㅎㅇ',0,'신청접수',1,0,1,SEQ_REQUEST_BOARD_BOARD_NO.currval,'소설/시/희곡','yeji');
insert into request_board values(SEQ_REQUEST_BOARD_BOARD_NO.nextval,'안녕',sysdate,'ㅎㅇ',0,'신청접수',1,0,1,SEQ_REQUEST_BOARD_BOARD_NO.currval,'소설/시/희곡','yeji');
insert into request_board values(SEQ_REQUEST_BOARD_BOARD_NO.nextval,'안녕',sysdate,'ㅎㅇ',0,'신청접수',1,0,1,SEQ_REQUEST_BOARD_BOARD_NO.currval,'소설/시/희곡','yeji');
insert into request_board values(SEQ_REQUEST_BOARD_BOARD_NO.nextval,'안녕',sysdate,'ㅎㅇ',0,'신청접수',1,0,1,SEQ_REQUEST_BOARD_BOARD_NO.currval,'소설/시/희곡','yeji');





commit;


SELECT s.*  FROM
				( SELECT rownum as idx,board_no, board_title, user_id,board_date,board_readcount,board_groupno,board_step, board_status,board_depth,board_type_no FROM request_board
					ORDER BY board_type_no asc
				) s

		where idx>=1 and idx<=10;
        
        
        SELECT rownum as idx,board_no, board_title, user_id,board_date,board_readcount,board_groupno,board_step, board_status,board_depth,board_type_no FROM request_board
					ORDER BY board_type_no asc;
                    
      
SELECT * FROM

		( SELECT rownum idx, s.*  FROM
				( SELECT board_no, board_title, user_id,board_date,board_content,board_readcount,board_groupno,board_step, board_status,board_depth FROM request_board
					ORDER BY board_type_no asc,board_groupno DESC,board_step ASC
				) s
		 )

			where board_title like '%안녕%' or board_content like '%대출%'or user_id like '%soyoon%' ;              
