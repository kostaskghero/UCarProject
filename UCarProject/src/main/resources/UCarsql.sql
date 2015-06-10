
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
select * from member where member_id='java' and member_password='1234'


drop table driving_license
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
drop table driving_license
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




