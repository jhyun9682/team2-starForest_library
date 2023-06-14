/******Book-club******
이름             널?       유형            
-------------- -------- ------------- 
CLUB_NO        NOT NULL NUMBER        
CLUB_NAME               VARCHAR2(50)  
CLUB_COUNT              NUMBER  
CLUB_PERSON             VARCHAR2(100) 
CLUB_TIME               VARCHAR2(100) 
CLUB_PLACE              VARCHAR2(100) 
CLUB_CONTENT            VARCHAR2(500) 
CLUB_READCOUNT          NUMBER        
CATEGORY_NO    NOT NULL NUMBER        
USER_ID        NOT NULL VARCHAR2(100)     
*/
desc book_club;
select * from book_category;

--insert--
insert into book_club values(SEQ_book_club_club_no.nextval,'백세인생',8,'건강에 관심있는 성인분들','매주 일요일 오전 10시','국립도서관 광장 앞','건강에 관련된 지식쌓으며 백세인생 준비해요~',2,100,'yeji');
insert into book_club values(SEQ_book_club_club_no.nextval,'다양한 레저를 좋아하는 모임',8,'레저활동에 관심있는 성인분들','매주 일요일 오전 10시','국립도서관 광장 앞','몸으로 즐기는 레저도 좋지만 지식도 쌓아보아요!',2,100,'soyoon');
insert into book_club values(SEQ_book_club_club_no.nextval,'취미부자들의 부자인생',8,'다양한 분야에 관심있는 성인분들','매주 일요일 오전 10시','국립도서관 광장 앞','세상에 있는 모든 취미를 깊이있게 공부해보아요:)',2,100,'junghyun');
insert into book_club values(SEQ_book_club_club_no.nextval,'내 건강은 내가 챙기자',8,'병원생활이 지겨우신 성인분들','매주 일요일 오전 10시','강남세브란스병원 공원','서로의 아픔을 공유하며 멋진 앞날을 위해 같이 지식을 쌓으며 공부합시다!',2,100,'junghyun');


insert into book_club values(SEQ_book_club_club_no.nextval,'미스터실록',8,'경제에 관심있는 성인분들','매주 일요일 오전 10시','국립도서관 광장 앞','경제경영 토론 및 주제 분석 등 경제경영에 대해 심도있게 공부하실 분들 환영합니다!',2,200,'yeji');
insert into book_club values(SEQ_book_club_club_no.nextval,'똑소리나는 경제경영',8,'경제/경영 활동이 필요한 성인분들','매주 일요일 오전 10시','국립도서관 광장 앞','경제/경영 책들을 읽으며 서로에게 도움되는 정보들 공유해요!',2,200,'woohyuk');
insert into book_club values(SEQ_book_club_club_no.nextval,'티끌모아 태산',8,'경제에 관심있는 성인분들','매주 일요일 오전 10시','국립도서관 광장 앞','빈털털이라고 좌절하지마세요! 함께 공부하며 부자됩시다~',2,200,'soyoon');

insert into book_club values(SEQ_book_club_club_no.nextval,'나를 살리는 한마디',8,'고전도서 좋아하는 성인분들','매주 일요일 오전 10시','국립도서관 광장 앞','<나를 살리는 논어한마디> 같이 읽으며 힐링해요~',2,300,'woohyuk');
insert into book_club values(SEQ_book_club_club_no.nextval,'역사읽기',8,'역사에 관심있는 성인분들','매주 일요일 오전 10시','국립도서관 광장 앞','고려시대 위주의 도서들 읽으며 정보교환하고 이야기나누어요!',2,300,'yeji');

insert into book_club values(SEQ_book_club_club_no.nextval,'중학생들 다 모여',10,'정보교류를 좋아하는 중학생','매주 토요일 오전 11시','평화의 광장','책정보 교류 및 토론하며 지식 쌓아가요:)',5,400,'hyeonjeong');
insert into book_club values(SEQ_book_club_club_no.nextval,'물리학을 사랑하는 모임',8,'물리에 관심있는 성인분들','매주 일요일 오전 10시','국립도서관 광장 앞','물리현상에 대해 이론적으로 알아가보아요~',2,400,'soyoon');

insert into book_club values(SEQ_book_club_club_no.nextval,'만화를 사랑하는 모임',8,'만화에 관심있는 성인분들','매주 일요일 오전 10시','국립도서관 광장 앞','모여서 만화읽으며 여유로운 시간보내요~',2,500,'woohyuk');
insert into book_club values(SEQ_book_club_club_no.nextval,'로맨스',8,'로맨스 만화에 관심있는 성인분들','매주 일요일 오전 10시','국립도서관 광장 앞','로맨스만화보며 대리만족해여!',2,500,'yeji');
insert into book_club values(SEQ_book_club_club_no.nextval,'웹툰보다 종이만화책',8,'웹툰보다 종이만화책을 더 좋아하는 성인분들','매주 일요일 오전 10시','국립도서관 광장 앞','웹툰도 좋지만 옛날 감성의 만화책 좋아하시는 분들 환영합니다.',2,500,'hyeonjeong');

insert into book_club values(SEQ_book_club_club_no.nextval,'고딩의 반란',8,'사회과학면에 관심있는 고등학생들','매주 일요일 오전 10시','국립도서관 광장 앞','모여서 사회과학 책들 추천하며 지식쌓아가요~',2,600,'woohyuk');


insert into book_club values(SEQ_book_club_club_no.nextval,'시조를 사랑하는 모임',8,'시에 관심있는 성인분들','매주 일요일 오전 10시','국립도서관 광장 앞','시조 창작,낭독 및 감상하며 여유로운 시간보내요~',2,700,'yeji');
insert into book_club values(SEQ_book_club_club_no.nextval,'추리좋아 제비추리말고',5,'명탐정이신 성인분들','둘째주, 넷째주 토요일 오후 5시','서울시 강남구 카페','스릴러, 추리소설을 좋아한다면 얼른 신청해주세요!',5,700,'soyoon');
insert into book_club values(SEQ_book_club_club_no.nextval,'허구에서의 삶',5,'소설을 읽으며 힐링하시는 성인분들','둘째주, 넷째주 토요일 오후 5시','서울시 강남구 카페','허구속에서의 삶도 가끔은 마음의 힐링이 될 때가 있지않나요? 다들 빠져봅시당~',5,700,'hyeonjeong');
insert into book_club values(SEQ_book_club_club_no.nextval,'낭독회',5,'낭독에 관심있는 성인분들','둘째주, 넷째주 토요일 오후 5시','서울시 강남구 카페','대본들을 보며 낭독연습 및 토론해보아요~',5,700,'soyoon');
insert into book_club values(SEQ_book_club_club_no.nextval,'다독다독',5,'따뜻한 마음을 가진 성인','매주 금요일 오후 8시','서울시 강남구','좋은 글들 공유하며 서로 다독해주는 힐링 모임입니다~',6,700,'junghyun');

--select--
/*모든 동아리 출력*/
select * from book_club;
/*카테고리별 동아리 출력*/
select club_name,club_count,club_person,club_time,club_place,club_content from book_club where category_no=700;
/*동아리 상세보기*/
select club_name,club_count,club_person,club_time,club_place,club_content from book_club where club_no=1;
/*'yeji'가 가입한 동아리내역*/
select club_name,club_person,club_time,club_place,club_content from book_club where user_id='yeji';

--update--
/*동아리 내용(조회수변경불가) 수정*/
update book_club set club_name='코난들 모여라',club_count=6,club_person='추리에 관심많은 성인분들',club_time='매주 토요일 오후 5시',club_place='서울시 강남구 어디든',club_content='전국코난들 환영합니다.' where club_no=2;
/*동아리 인원수 카운트*/
update book_club set club_count=club_count-1 where club_count>0 and club_no=4;

--delete--
/*게시물 삭제*/
delete from book_club where club_no=1;

