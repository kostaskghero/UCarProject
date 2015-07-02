-- member
drop table member;
create table member(
	member_id varchar2(50) primary key,
	member_password varchar2(50) not null,
	member_name varchar2(50) not null,
	member_email varchar2(50) not null,
	member_phone varchar2(50) not null,
	member_point number default 0 not null,
	member_level varchar2(50) default 1 not null,
	member_register_date date not null
)
select * from member;
delete from member where member_id='java'
-- admin
insert into member(member_id, member_password, member_name, member_email, member_phone, member_level, member_register_date)
values('admin','1234','관리자','ucar@gamil.com','01000000000', 2, sysdate);
-- member
-- 카드1개등록
insert into member(member_id, member_password, member_name, member_email, member_phone, member_register_date)
values('java', '1234', '박서준', 'java@ucar.com', '01000000000', sysdate);
-- 면허등록
insert into member(member_id, member_password, member_name, member_email, member_phone, member_register_date)
values('hee', '1234', '유경희', 'hee@giveticon.com', '01000000000', sysdate);
-- 카드3개등록
insert into member(member_id, member_password, member_name, member_email, member_phone, member_register_date)
values('minions', '1234', '케빈', 'banana@mini.com', '01000000000', sysdate);
-- 면허등록, 카드2개등록
insert into member(member_id, member_password, member_name, member_email, member_phone, member_register_date)
values('bobbob', '1234', '밥', 'bobbob@mini.com', '01000000000', sysdate);
	
-- 면허정보
drop table driving_license;
create table driving_license(
	member_id varchar2(50),
	license_no varchar2(50) unique,
	license_type varchar2(50) not null,
	license_renewal_term date not null,
	license_issue_date date not null,
	gender varchar2(50) not null,
	license_birth date not null,
	constraint fk_member_id foreign key(member_id) references member(member_id) on DELETE CASCADE,
	constraint pk_member_id primary key(member_id)
)
select * from driving_license;

insert into driving_license(license_no, member_id, license_type, license_renewal_term, license_issue_date, gender, license_birth)
values('서울 11-010054-23', 'hee', '2종보통', to_date('2022-12-31','YYYY/MM/DD'), 
	to_date('2010-12-24','YYYY/MM/DD'), '여', to_date('1990-11-03','YYYY/MM/DD'));
insert into driving_license(license_no, member_id, license_type, license_renewal_term, license_issue_date, gender, license_birth)
values('강원 13-032387-41', 'bobbob', '1종보통', to_date('2020-12-31','YYYY/MM/DD'), 
	to_date('2016-10-24','YYYY/MM/DD'), '남', to_date('1990-05-30','YYYY/MM/DD'));
		
-- 결제카드
drop table card
create table card(
	card_no varchar2(50) primary key,
	member_id varchar2(50),
	card_type varchar2(50) not null,
	card_expiration_date date not null,
	card_password varchar2(50) not null,
	card_birth date not null,
	constraint fk_card_id foreign key(member_id) references member(member_id) on DELETE CASCADE	
)
select * from card;

insert into card(card_no, member_id, card_type, card_expiration_date, card_password, card_birth) 
values('5021-2377-5289-3307', 'minions', '개인', to_date('2018-02','YYYY/MM'), '50', to_date('1993-10-23','YYYY/MM/DD'));
insert into card(card_no, member_id, card_type, card_expiration_date, card_password, card_birth) 
values('3922-4739-2639-2261', 'minions', '개인', to_date('2018-02','YYYY/MM'), '11', to_date('1993-10-23','YYYY/MM/DD'));
insert into card(card_no, member_id, card_type, card_expiration_date, card_password, card_birth) 
values('3724-3923-2422-5457', 'minions', '개인', to_date('2018-02','YYYY/MM'), '11', to_date('1993-10-23','YYYY/MM/DD'));
insert into card(card_no, member_id, card_type, card_expiration_date, card_password, card_birth) 
values('8745-2342-5465-4336', 'java', '개인', to_date('2018-02','YYYY/MM'), '11', to_date('1982-07-14','YYYY/MM/DD'));
insert into card(card_no, member_id, card_type, card_expiration_date, card_password, card_birth) 
values('4592-8743-2687-1277', 'bobbob', '개인', to_date('2020-02','YYYY/MM'), '11', to_date('1990-05-30','YYYY/MM/DD'));
insert into card(card_no, member_id, card_type, card_expiration_date, card_password, card_birth) 
values('2342-3794-2349-4568', 'bobbob', '개인', to_date('2018-02','YYYY/MM'), '11', to_date('1990-05-30','YYYY/MM/DD'));
	
-- 운전면허 지역정보
create sequence license_location_seq nocache;
drop sequence license_location_seq;
drop table license_location;
create table license_location(
	license_location_no number primary key,
	license_location_name varchar2(50) unique
)
insert into LICENSE_LOCATION values(license_location_seq.nextval, '서울');
insert into LICENSE_LOCATION values(license_location_seq.nextval, '경기');
insert into LICENSE_LOCATION values(license_location_seq.nextval, '인천');
insert into LICENSE_LOCATION values(license_location_seq.nextval, '대전');
insert into LICENSE_LOCATION values(license_location_seq.nextval, '광주');
insert into LICENSE_LOCATION values(license_location_seq.nextval, '울산');
insert into LICENSE_LOCATION values(license_location_seq.nextval, '대구');
insert into LICENSE_LOCATION values(license_location_seq.nextval, '부산');
insert into LICENSE_LOCATION values(license_location_seq.nextval, '강원');
insert into LICENSE_LOCATION values(license_location_seq.nextval, '충남');
insert into LICENSE_LOCATION values(license_location_seq.nextval, '충북');
insert into LICENSE_LOCATION values(license_location_seq.nextval, '전남');
insert into LICENSE_LOCATION values(license_location_seq.nextval, '전북');
insert into LICENSE_LOCATION values(license_location_seq.nextval, '경남');
insert into LICENSE_LOCATION values(license_location_seq.nextval, '경북');
insert into LICENSE_LOCATION values(license_location_seq.nextval, '제주');
insert into LICENSE_LOCATION values(license_location_seq.nextval, '11');
insert into LICENSE_LOCATION values(license_location_seq.nextval, '12');
insert into LICENSE_LOCATION values(license_location_seq.nextval, '13');
insert into LICENSE_LOCATION values(license_location_seq.nextval, '14');
insert into LICENSE_LOCATION values(license_location_seq.nextval, '15');
insert into LICENSE_LOCATION values(license_location_seq.nextval, '16');
insert into LICENSE_LOCATION values(license_location_seq.nextval, '17');
insert into LICENSE_LOCATION values(license_location_seq.nextval, '18');
insert into LICENSE_LOCATION values(license_location_seq.nextval, '19');
insert into LICENSE_LOCATION values(license_location_seq.nextval, '20');
insert into LICENSE_LOCATION values(license_location_seq.nextval, '21');
insert into LICENSE_LOCATION values(license_location_seq.nextval, '22');
insert into LICENSE_LOCATION values(license_location_seq.nextval, '23');
insert into LICENSE_LOCATION values(license_location_seq.nextval, '24');
insert into LICENSE_LOCATION values(license_location_seq.nextval, '25');
insert into LICENSE_LOCATION values(license_location_seq.nextval, '26');

-- 포인트
drop sequence point_history_seq;
create sequence point_history_seq nocache;
drop table point_history;
create table point_history(
	point_history_no number primary key,
	member_id varchar2(50),
	point_value number not null,
	point_date date not null,
	point_content varchar2(100) not null,
	point_type varchar2(50) not null,
	constraint fk_point_member_id foreign key (member_id) references member(member_id) on DELETE CASCADE
)
select * from point_history;

insert into point_history(point_history_no, member_id, point_value, point_date, point_content, point_type)
values(point_history_seq.nextval, 'java', 10000, sysdate, '회원가입', '적립');
insert into point_history(point_history_no, member_id, point_value, point_date, point_content, point_type)
values(point_history_seq.nextval, 'hee', 10000, sysdate, '회원가입', '적립');
insert into point_history(point_history_no, member_id, point_value, point_date, point_content, point_type)
values(point_history_seq.nextval, 'minions', 10000, sysdate, '회원가입', '적립');
insert into point_history(point_history_no, member_id, point_value, point_date, point_content, point_type)
values(point_history_seq.nextval, 'bobbob', 10000, sysdate, '회원가입', '적립');