create table member_ucar(
	member_id varchar2(50) primary key,
	member_name varchar2(50) not null,
	member_email varchar2(50) not null,
	member_phone varchar2(50) not null,
	member_point varchar2(50) not null,
	member_level varchar2(50) not null,
	member_birth_date varchar2(50) not null
)

select * from member_ucar
drop table member_ucar

insert into member_ucar(member_id, member_name, member_email, member_phone, member_point, member_level, member_birth_date)
 values ('java', '한효주', 'bbb@naver.com', '1234567890', '100', '브론즈', '19790222')
