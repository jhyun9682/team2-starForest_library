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
'신청하신 해당 책 신청됐습니다.',0,0,2,0,2,4,700,'manager');

update request_board set board_step=board_step+1 where board_step>1 and groupno=4;

--soyoon이 쓴 신청 게시물 확인
select *
from request_board
where user_id = 'soyoon';

--신청 게시물 삭제
delete from request_board where board_no=8;

--신청 게시물 수정
update request_board set board_title='',board_content='' where board_no=8;

