--자동차 모델정보
drop table CAR_MODEL_INFO;
CREATE TABLE CAR_MODEL_INFO (
		CAR_MODEL VARCHAR2(50) primary key,
		CAR_TYPE VARCHAR2(50) NOT NULL,
		RENTAL_FEE NUMBER NOT NULL,
		DRIVING_FEE NUMBER NOT NULL,
		CAR_PHOTO VARCHAR2(200) NOT NULL,
		OIL_TYPE VARCHAR2(50) NOT NULL
	)
	select * from CAR_MODEL_INFO;
	insert into CAR_MODEL_INFO(CAR_MODEL,CAR_TYPE, RENTAL_FEE, DRIVING_FEE, CAR_PHOTO, OIL_TYPE) 
	values('모닝', '경차A',1050, 170, '경로', '휘발유');
	insert into CAR_MODEL_INFO(CAR_MODEL,CAR_TYPE, RENTAL_FEE, DRIVING_FEE, CAR_PHOTO, OIL_TYPE) 
	values('스파크', '경차A',1050, 170, '경로', '휘발유');
	insert into CAR_MODEL_INFO(CAR_MODEL,CAR_TYPE, RENTAL_FEE, DRIVING_FEE, CAR_PHOTO, OIL_TYPE) 
	values('프라이드','소형', 1250, 180, '경로', '휘발유');
	insert into CAR_MODEL_INFO(CAR_MODEL, CAR_TYPE,RENTAL_FEE, DRIVING_FEE, CAR_PHOTO, OIL_TYPE) 
	values('K3', '준준형',1390, 170, '경로', '휘발유');
--유카존
drop table ucar_zone;
create table ucar_zone(
		UCAR_ZONE_NAME varchar2(200) primary key,
		ucar_zone_address varchar2(300)
	)
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address) values('신천역','서울시 송파구 잠실동 186-9');
--자동차 테이블
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
	insert into car(CAR_NO, CAR_MODEL, UCAR_ZONE_NAME, CAR_NICK_NAME)
	values(car_seq.nextval, '모닝', '신천역', '꼬맹이')
	--자동차 옵션
	drop sequence car_option_seq
	drop table car_option
	create sequence car_option_seq nocache
	CREATE TABLE CAR_OPTION (
		OPTION_NUMBER number primary key,
		CAR_MODEL VARCHAR2(50),
		OPTION_INFO VARCHAR2(50) NOT NULL,
		constraint fk_car_option foreign key(CAR_MODEL) references CAR_MODEL_INFO	
	);
	select * from car_option
	insert into CAR_OPTION(OPTION_NUMBER, CAR_MODEL, OPTION_INFO)
	values (car_option_seq.nextval, '모닝', '하이패스')
	
	
	select c.CAR_NO,c.CAR_MODEL,c.UCAR_ZONE_NAME,c.CAR_NICK_NAME,m.CAR_TYPE,m.RENTAL_FEE,m.DRIVING_FEE,m.OIL_TYPE
	from CAR c,CAR_MODEL_INFO m
	where c.CAR_MODEL=m.CAR_MODEL and c.Car_NO=1