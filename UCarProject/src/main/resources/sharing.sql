-- 예약테이블
create sequence SHARING_RESERVATION_seq nocache;
drop sequence SHARING_RESERVATION_seq;
drop table SHARING_RESERVATION;
CREATE TABLE SHARING_RESERVATION (
	RESERVATION_NO number primary key,
	CAR_NO NUMBER,
	MEMBER_ID VARCHAR2(50),
	rental_price number not null,
	RENTAL_DATE DATE NOT NULL,
	rental_ucar_zone_name varchar2(50),
	RETURN_DATE DATE NOT NULL,
	reservation_date date not null,
	extension_date date default null,
	extension_price number default 0,
	late_fee number default 0,
	late_time number default 0,
	constraint FK_RESERVATION_CAR_NO foreign key (CAR_NO) references car on DELETE CASCADE,
	constraint FK_RESERVATION_MEMBER_ID foreign key(MEMBER_ID) references member(member_id) on DELETE CASCADE
)
select * from SHARING_RESERVATION;

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
	constraint fk_payment_reservation_no foreign key(reservation_no) references sharing_reservation(reservation_no) on DELETE CASCADE
)
select * from sharing_payment;

-- 반납테이블
drop table sharing_return;
create table sharing_return(
	reservation_no number,
	driving_price number not null,
	mileage number not null,
	real_return_date date not null,
	constraint fk_return_reservation_no foreign key(reservation_no) references sharing_reservation(reservation_no) on DELETE CASCADE
)

-- 예약상태테이블
drop table sharing_status;
create table sharing_status(
	reservation_no number,
	status varchar2(50) not null,
	constraint fk_reservation_no foreign key(reservation_no) references sharing_reservation(reservation_no) on DELETE CASCADE
)
select * from sharing_status;