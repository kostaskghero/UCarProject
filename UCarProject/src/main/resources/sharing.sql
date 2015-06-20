-- 예약테이블
create sequence SHARING_RESERVATION_seq nocache
drop sequence SHARING_RESERVATION_seq
drop table SHARING_RESERVATION
CREATE TABLE SHARING_RESERVATION (
	RESERVATION_NO number primary key,
	sharing_type varchar2(50) not null,
	CAR_NO NUMBER,
	MEMBER_ID VARCHAR2(50),
	rental_price number not null,
	RENTAL_DATE DATE NOT NULL,
	rental_ucar_zone_name varchar2(50),
	RETURN_DATE DATE NOT NULL,
	return_ucar_zone_name varchar2(50),
	reservation_date date not null,
	constraint FK_RESERVATION_CAR_NO foreign key(CAR_NO) references car,
	constraint FK_RESERVATION_MEMBER_ID foreign key(MEMBER_ID) references member
)

select RESERVATION_NO, CAR_NO, MEMBER_ID, to_char(RENTAL_DATE, 'YYYY/MM/DD HH24:MI') as rental_date, to_char(RETURN_DATE, 'YYYY/MM/DD HH24:MI') as return_date from SHARING_RESERVATION order by reservation_no
-- 예약
insert into SHARING_RESERVATION(RESERVATION_NO, CAR_NO, MEMBER_ID, RENTAL_DATE, RETURN_DATE)
	values(SHARING_RESERVATION_seq.nextval, '1', 'java', to_date('2015/04/10 15:30','YYYY/MM/DD HH24:MI'), to_date('2015/04/10 18:00','YYYY/MM/DD HH24:MI'));
insert into SHARING_RESERVATION(RESERVATION_NO, CAR_NO, MEMBER_ID, RENTAL_DATE, RETURN_DATE)
	values(SHARING_RESERVATION_seq.nextval, '2', 'java', to_date('2015/04/10 15:30','YYYY/MM/DD HH24:MI'), to_date('2015/04/10 18:00','YYYY/MM/DD HH24:MI'));
insert into SHARING_RESERVATION(RESERVATION_NO, CAR_NO, MEMBER_ID, RENTAL_DATE, RETURN_DATE)
	values(SHARING_RESERVATION_seq.nextval, '1', 'java', to_date('2015/04/10 12:00','YYYY/MM/DD HH24:MI'), to_date('2015/04/10 14:00','YYYY/MM/DD HH24:MI'));
insert into SHARING_RESERVATION(RESERVATION_NO, CAR_NO, MEMBER_ID, RENTAL_DATE, RETURN_DATE)
	values(SHARING_RESERVATION_seq.nextval, '3', 'java', to_date('2015/04/10 9:30','YYYY/MM/DD HH24:MI'), to_date('2015/04/10 10:00','YYYY/MM/DD HH24:MI'));
insert into SHARING_RESERVATION(RESERVATION_NO, CAR_NO, MEMBER_ID, RENTAL_DATE, RETURN_DATE)
	values(SHARING_RESERVATION_seq.nextval, '4', 'java', to_date('2015/04/10 15:30','YYYY/MM/DD HH24:MI'), to_date('2015/04/10 18:00','YYYY/MM/DD HH24:MI'));
insert into SHARING_RESERVATION(RESERVATION_NO, CAR_NO, MEMBER_ID, RENTAL_DATE, RETURN_DATE)
	values(SHARING_RESERVATION_seq.nextval, '5', 'java', to_date('2015/04/10 12:00','YYYY/MM/DD HH24:MI'), to_date('2015/04/10 14:00','YYYY/MM/DD HH24:MI'));
insert into SHARING_RESERVATION(RESERVATION_NO, CAR_NO, MEMBER_ID, RENTAL_DATE, RETURN_DATE)
	values(SHARING_RESERVATION_seq.nextval, '2', 'java', to_date('2015/04/10 9:30','YYYY/MM/DD HH24:MI'), to_date('2015/04/10 10:00','YYYY/MM/DD HH24:MI'));
	
-- 예약여부
-- 해당시간에 예약상태인 차번호를 조회
select distinct(car_no) from (select r.car_no, r.rental_date, r.return_date from car c, sharing_reservation r where c.ucar_zone_name='신천역' and c.car_no=r.car_no)
				--예약(렌트시간)							--리턴
where to_date('2015/04/10 12:00','YYYY/MM/DD HH24:MI')<(return_date+numtodsinterval(10,'minute'))
				--예약(리턴시간)							--렌탈
	and to_date('2015/04/10 18:30','YYYY/MM/DD HH24:MI')>(rental_date-numtodsinterval(10,'minute'))

-- 결제테이블
create sequence payment_no_seq nocache;
drop sequence payment_no_seq;
drop table sharing_payment;
create table sharing_payment(
	payment_no number primary key,
	reservation_no number,
	payment_price number not null,
	payment_card_no varchar2(50),
	using_point number default 0,
	payment_type varchar2(50) not null,
	payment_status VARCHAR2(50) NOT NULL,
	constraint fk_payment_reservation_no foreign key(reservation_no) references sharing_reservation
)
select * from sharing_payment;

-- 반납테이블
drop table sharing_return;
create table sharing_return(
	reservation_no number,
	driving_price number not null,
	mileage number not null,
	return_ucar_zone_name varchar2(50) not null,
	real_return_date date not null,
	constraint fk_return_reservation_no foreign key(reservation_no) references sharing_reservation
)

-- 예약상태테이블
drop table sharing_status;
create table sharing_status(
	reservation_no number,
	status varchar2(50) not null,
	constraint fk_reservation_no foreign key(reservation_no) references sharing_reservation
)