
drop table member
create table member(
	member_id varchar2(50) primary key,
	member_password varchar2(50) not null,
	member_name varchar2(50) not null,
	member_email varchar2(50) not null,
	member_phone varchar2(50) not null,
	member_point number default 2000,
	member_level varchar2(50) default 1,
	member_birth_date varchar2(50) not null
)
select * from member
insert into member(member_id, member_password, member_name, member_email, member_phone, member_birth_date)
values ('java', '1234', '한효주', 'skghero@naver.com', '01020636416','19870222' )
drop table driving_license;
create table driving_license(
	license_no varchar2(50) primary key,
	member_id varchar2(50),
	license_type varchar2(50) not null,
	license_renewal_term varchar2(50) not null,
	license_issue_date varchar2(50) not null,
	gender varchar2(50) not null,
	constraint fk_member_id foreign key(member_id) references member
)
select * from driving_license
insert into driving_license (license_no, member_id, license_type, license_renewal_term, license_issue_date, gender)
values ('1', 'java', '1종보통', '20150410','20100222', '여')

drop table card
create table card(
	card_no varchar2(50) primary key,
	member_id varchar2(50),
	card_type varchar2(50) not null,
	card_expiration_date varchar2(50) not null,
	card_password varchar2(50) not null,
	constraint fk_card_id foreign key(member_id) references member	
)
select * from card
insert into card(card_no, member_id, card_type,card_expiration_date, card_password) values ('1', 'java', '개인', '202002','1234')

drop table car_model_info
CREATE TABLE CAR_MODEL_INFO (
		CAR_MODEL VARCHAR2(50) primary key,
		RENTAL_FEE NUMBER NOT NULL,
		DRIVING_FEE NUMBER NOT NULL,
		CAR_PHOTO VARCHAR2(200) NOT NULL,
		OIL_TYPE VARCHAR2(50) NOT NULL
	)
	
select * from CAR_MODEL_INFO
insert into CAR_MODEL_INFO(CAR_MODEL, RENTAL_FEE, DRIVING_FEE, CAR_PHOTO, OIL_TYPE) 
values('티코', 100, 100, '우왕', '경유')

	
	create sequence car_seq nocache
CREATE TABLE CAR (
		CAR_NO NUMBER primary key,
		CAR_MODEL VARCHAR2(50),
		CAR_TYPE VARCHAR2(50) NOT NULL,
		UCAR_ZONE_NAME VARCHAR2(50) NOT NULL,
		UCAR_ZONE_ADDRESS VARCHAR2(100) NOT NULL,
		CAR_NICK_NAME VARCHAR2(50) NOT NULL,
		constraint fk_car foreign key(CAR_MODEL) references CAR_MODEL_INFO	
	);	
	select * from CAR
	insert into car(CAR_NO, CAR_MODEL, CAR_TYPE, UCAR_ZONE_NAME, UCAR_ZONE_ADDRESS, CAR_NICK_NAME)
	values(car_seq.nextval, '티코', '경차', '주차장', '판교', '꼬맹이')
	
	create sequence car_option_seq nocache
	CREATE TABLE CAR_OPTION (
		OPTION_NUMBER number primary key,
		CAR_MODEL VARCHAR2(50),
		OPTION_INFO VARCHAR2(50) NOT NULL,
		constraint fk_car_option foreign key(CAR_MODEL) references CAR_MODEL_INFO	
	);
	select * from car_option
	insert into CAR_OPTION(OPTION_NUMBER, CAR_MODEL, OPTION_INFO)
	values (car_option_seq.nextval, '티코', '하이패스')
	
	drop table SHARING_RESERVATION;
	create sequence SHARING_RESERVATION_seq nocache
	drop sequence SHARING_RESERVATION_seq
	CREATE TABLE SHARING_RESERVATION (
		RESERVATION_NO VARCHAR2(50) NOT NULL,
		CAR_NO NUMBER,
		MEMBER_ID VARCHAR2(50),
		RENTAL_PRICE number NOT NULL,
		RETURN_CHECK VARCHAR2(50) NOT NULL,
		RENTAL_DATE DATE NOT NULL,
		RETURN_DATE DATE NOT NULL,
		DRIVING_PRICE NUMBER NOT NULL, 
		constraint FK_RESERVATION_CAR_NO foreign key(CAR_NO) references car,
		constraint FK_RESERVATION_MEMBER_ID foreign key(MEMBER_ID) references member
	);
	select * from SHARING_RESERVATION
	insert into SHARING_RESERVATION(RESERVATION_NO, CAR_NO, MEMBER_ID, RENTAL_PRICE, RETURN_CHECK, RENTAL_DATE, RETURN_DATE, DRIVING_PRICE)
	values(SHARING_RESERVATION_seq.nextval, '1', 'java', 100, '예약', sysdate, sysdate, 100)
	
	create sequence faq_seq nocache
	drop sequence faq_seq
	drop table faq
	CREATE TABLE FAQ (
		FAQ_NO number primary key,
		FAQ_CATEGORY VARCHAR2(200) NOT NULL,
		FAQ_TITLE VARCHAR2(200) NOT NULL,
		FAQ_MEMBER_ID VARCHAR2(50),
		FAQ_CONTENT CLOB NOT NULL,
		constraint FK_FAQ_MEMBER_ID foreign key(FAQ_MEMBER_ID) references member
	);
drop sequence qna_board_reply_seq;
	drop table qna_board_reply
create table qna_board_reply(
   qna_no number primary key,
   qna_category varchar2(50) not null,
   qna_member_id varchar2(50) not null,
   qna_title varchar2(100) not null,
   qna_content clob not null,
   qna_time_posted date not null,
   qna_ref number not null,
   qna_restep number default 0,
   qna_relevel number default 0,
   constraint fk_qna_reply_member_id foreign key(qna_member_id) references member
)
create sequence qna_board_reply_seq nocache;
select * from qna_board_reply
insert into qna_board_reply (qna_no, qna_category, qna_member_id, qna_title, qna_content, qna_time_posted, qna_ref)
values (qna_board_reply_seq.nextval, '예약', 'java', '예약문의', '예약어떻게하죠?', sysdate, '0')
create sequence qna_board_seq nocache;
drop sequence qna_board_seq
select * from qna_board
insert into qna_board (qna_no, qna_category, qna_member_id, qna_title, qna_content, qna_time_posted, qna_ref)
values (qna_board_seq.nextval, '예약', 'java', '예약문의', '예약어떻게하죠?', sysdate, '0')
	
drop table notice_board
drop sequence notice_board_seq
create sequence notice_board_seq nocache;
create table notice_board(
 notice_no number primary key,
    notice_title varchar2(100) not null,
   notice_member_id varchar2(50) not null,
   notice_content clob not null,
   notice_time_posted date not null,
   constraint fk_notice_member_id foreign key(notice_member_id) references member
)
select * from notice_board
insert into notice_board(notice_no, notice_title, notice_member_id, notice_content, notice_time_posted)
values (notice_board_seq.nextval, '주차', 'java','어떻게하죠?', sysdate)

