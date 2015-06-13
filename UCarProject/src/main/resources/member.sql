drop table member;
create table member(
	member_id varchar2(50) primary key,
	member_password varchar2(50) not null,
	member_name varchar2(50) not null,
	member_email varchar2(50) not null,
	member_phone varchar2(50) not null,
	member_point number default 2000,
	member_level varchar2(50) default 1
)
select * from member;
insert into member(member_id, member_password, member_name, member_email, member_phone)
values ('java', '1234', '한효주', 'skghero@naver.com', '01020636416');

drop table driving_license;
create table driving_license(
	member_id varchar2(50),
	license_no varchar2(50) unique,
	license_type varchar2(50) not null,
	license_renewal_term date not null,
	license_issue_date date not null,
	gender varchar2(50) not null,
	license_birth date not null,
	constraint fk_member_id foreign key(member_id) references member,
	constraint pk_member_id primary key(member_id)
)
select * from driving_license;
insert into driving_license (license_no, member_id, license_type, license_renewal_term, license_issue_date, gender, license_birth)
values ('1', 'java', '1종보통', to_date('2015/04/10','YYYY/MM/DD'),to_date('2010/02/22','YYYY/MM/DD'), '여', to_date('1988/11/11','YYYY/MM/DD'));

drop table card
create table card(
	card_no varchar2(50) primary key,
	member_id varchar2(50),
	card_type varchar2(50) not null,
	card_expiration_date date not null,
	card_password varchar2(50) not null,
	card_birth date not null,
	constraint fk_card_id foreign key(member_id) references member	
)
select * from card
insert into card(card_no, member_id, card_type, card_expiration_date, card_password, card_birth) 
		values('11', 'java', '개인', to_date('2018/02','YYYY/MM'), '1234', to_date('1900/10/11','YYYY/MM/DD'));

create sequence license_location_seq nocache;
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