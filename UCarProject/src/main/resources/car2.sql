--자동차 모델 테이블
drop table CAR_MODEL_INFO;
CREATE TABLE CAR_MODEL_INFO (
		CAR_MODEL VARCHAR2(50) primary key,
		CAR_TYPE VARCHAR2(50) NOT NULL,
		RENTAL_FEE NUMBER NOT NULL,
		DRIVING_FEE NUMBER NOT NULL,
		OIL_TYPE VARCHAR2(50) NOT NULL
	)
	select * from CAR_MODEL_INFO;
	-- 자동차 테이블
	drop sequence car_seq 
	drop table car
	create sequence car_seq nocache
	CREATE TABLE CAR (
		CAR_NO NUMBER primary key,
		CAR_MODEL VARCHAR2(50),
		UCAR_ZONE_NAME VARCHAR2(50) NOT NULL,
		CAR_NICK_NAME VARCHAR2(50) NOT NULL,
		constraint fk_car foreign key(CAR_MODEL) references CAR_MODEL_INFO,
		constraint fk_ucar_zone_name foreign key(UCAR_ZONE_NAME) references ucar_zone
	);	
	select * from CAR
	--차량 옵션 테이블
		drop sequence car_option_seq
	drop table car_option
	create sequence car_option_seq nocache
	CREATE TABLE CAR_OPTION (
		OPTION_NUMBER number primary key,
		CAR_MODEL VARCHAR2(50),
		OPTION_INFO VARCHAR2(50) NOT NULL
	);
	select * from car_option
--자동차 모델 사진 테이블 
	drop sequence car_pic_seq;
	drop table car_pic;
create sequence car_pic_seq nocache;
create table car_pic(
car_pic_no number primary key,
CAR_MODEL varchar2(200) not null,
file_path varchar2(200) not null,
original_name varchar2(200) not null,
constraint car_pic_fk foreign key(CAR_MODEL) references CAR_MODEL_INFO(CAR_MODEL) on DELETE CASCADE 
)
select * from car_pic;