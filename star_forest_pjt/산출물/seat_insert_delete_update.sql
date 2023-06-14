desc seat_reservation;

--좌석 상태 업데이트
update seat_reservation set seat_date=sysdate,seat_start_time=to_char(sysdate, 'HH24:MI:SS'),seat_end_time=to_char(sysdate+5/24, 'HH24:MI:SS'),user_id= 'soyun',seat_status=1 where seat_no='A01';
update seat_reservation set seat_date=sysdate,seat_start_time=to_char(sysdate, 'HH24:MI:SS'),seat_end_time=to_char(sysdate+5/24, 'HH24:MI:SS'),user_id= 'hyeonjeong',seat_status=1 where seat_no='C01';
update seat_reservation set seat_date=sysdate,seat_start_time=to_char(sysdate, 'HH24:MI:SS'),seat_end_time='17:30:01',user_id= 'junghyun',seat_status=1 where seat_no='B01';
update seat_reservation set seat_date=sysdate,seat_start_time=to_char(sysdate, 'HH24:MI:SS'),seat_end_time=to_char(sysdate+5/24, 'HH24:MI:SS'),user_id= 'jeonghyun',seat_status=1 where seat_no='B01';


update seat_reservation set seat_date=sysdate,seat_start_time=to_char(sysdate, 'HH24:MI:SS'),seat_end_time=to_char(sysdate+5/24, 'HH24:MI:SS'),user_id= 'soyoon',seat_status=1 where seat_no='A01';
update seat_reservation set seat_date=sysdate,seat_start_time=to_char(sysdate, 'HH24:MI:SS'),seat_end_time=to_char(sysdate+5/24, 'HH24:MI:SS'),user_id= 'woohyuk',seat_status=1 where seat_no='B01';
update seat_reservation set seat_date=sysdate,seat_start_time=to_char(sysdate, 'HH24:MI:SS'),seat_end_time=to_char(sysdate+5/24, 'HH24:MI:SS'),user_id= 'junghyun',seat_status=1 where seat_no='B02';
update seat_reservation set seat_date=sysdate,seat_start_time=to_char(sysdate, 'HH24:MI:SS'),seat_end_time=to_char(sysdate+5/24, 'HH24:MI:SS'),user_id= 'yeji',seat_status=1 where seat_no='D02';
commit;
--반납
update seat_reservation set seat_date=null,seat_start_time=null,seat_end_time=null,user_id=null,seat_status=0 where seat_no='B01'and user_id='jeonghyun';


--시간 지나서 자동으로 반납
update seat_reservation set seat_date=null,seat_start_time=null,seat_end_time=null,user_id=null,seat_status=0 where seat_no='B01' and seat_end_time<to_char(sysdate,'HH24:MI:SS');
update seat_reservation set seat_date=null,seat_start_time=null,seat_end_time=null,user_id=null,seat_status=0 where seat_date<sysdate;

update seat_reservation set seat_date=
                                            case when seat_end_time<to_char(sysdate,'HH24:MI:SS') then null else seat_date end,
                            seat_start_time=case when seat_end_time<to_char(sysdate,'HH24:MI:SS') then null else seat_start_time end,
                            seat_end_time=case when seat_end_time<to_char(sysdate,'HH24:MI:SS') then null else seat_end_time end,
                            user_id=case when seat_end_time<to_char(sysdate,'HH24:MI:SS') then null else user_id end,
                            seat_status=case when seat_end_time<to_char(sysdate,'HH24:MI:SS') then 0 else seat_status end 
where seat_no='B01';

--사용 가능한 좌석 목록리스트 뽑기
select seat_no from seat_reservation where seat_status=0;


--사용 가능한 좌석 카운트
select count(*) from seat_reservation where seat_status=0;


--전체리스트 기록 뽑기
select * from seat_reservation order by seat_no asc;

select *
from seat_reservation
where seat_no='A01';

--사용하고 있는 좌석에 대한 정보 뽑기(시작한 시간, 종료될 시간)
select seat_no, to_char(seat_date,'YYYY-MM-DD'),seat_start_time, seat_end_time,seat_status
from seat_reservation
where seat_no='B01';

--시간연장
update seat_reservation set seat_end_time=case when to_char(sysdate,'HH24:MI:SS')>=to_char(to_date(seat_end_time,'HH24:MI:SS')-30/(24*60),'HH24:MI:SS')
then to_char(to_date(seat_end_time,'HH24:MI:SS')+2/24,'HH24:MI:SS') else seat_end_time end where user_id='jeonghyun';


update seat_reservation set seat_end_time=to_char(to_date(seat_end_time,'HH24:MI:SS')+2/24,'HH24:MI:SS') 
where user_id='jeonghyun' and to_char(sysdate,'HH24:MI:SS')>=to_char(to_date(seat_end_time,'HH24:MI:SS')-30/(24*60),'HH24:MI:SS');




--사용하고 있는 좌석 목록 뽑기
select seat_no from seat_reservation where seat_status=1;


--내정보에서 열람실 정보 확인하기
select *
from seat_reservation sr
join user_info ui
on sr.user_id = ui.user_id
where ui.user_id = 'soyun';








select seat_no, to_date(seat_date,'YY-MM-DD'), seat_start_time, seat_end_time, user_id,seat_status
from seat_reservation
where seat_no='B01';










--좌석상태가 0이면 1, 1이면 0으로 바뀌(혹시 몰라서 냅두는거임)
update seat set seat_status=1 where seat_no='A01' and seat_status=(select seat_status "좌석상태"
                                                                        from seat_reservation sr
                                                                        join seat s
                                                                        on sr.seat_no=s.seat_no
                                                                        where s.seat_no='A01');

update seat set seat_status=0 where seat_no='A01' and seat_status=(select seat_status "좌석상태"
                                                                        from seat_reservation sr
                                                                        join seat s
                                                                        on sr.seat_no=s.seat_no
                                                                        where s.seat_no='A01');


