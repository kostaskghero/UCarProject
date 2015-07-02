--자동차 모델정보
drop table CAR_MODEL_INFO;
CREATE TABLE CAR_MODEL_INFO (
		CAR_MODEL VARCHAR2(50) primary key,
		CAR_TYPE VARCHAR2(50) NOT NULL,
		RENTAL_FEE NUMBER NOT NULL,
		DRIVING_FEE NUMBER NOT NULL,
		OIL_TYPE VARCHAR2(50) NOT NULL
	)
	select * from CAR_MODEL_INFO;
--유카존
drop table ucar_zone;
create table ucar_zone (
		UCAR_ZONE_NAME varchar2(200) primary key,
		ucar_zone_address varchar2(300),
		latitude number not null,
		longitude number  not null
		);
--자동차 테이블
	drop sequence car_seq ;
	drop table car;
	create sequence car_seq nocache;
	CREATE TABLE CAR (
		CAR_NO NUMBER primary key,
		CAR_MODEL VARCHAR2(50),
		UCAR_ZONE_NAME VARCHAR2(50) NOT NULL,
		CAR_NICK_NAME VARCHAR2(50) NOT NULL,
		constraint fk_car foreign key(CAR_MODEL) references CAR_MODEL_INFO on DELETE CASCADE,
		constraint fk_ucar_zone_name foreign key(UCAR_ZONE_NAME) references ucar_zone on DELETE CASCADE 
	);	
	select * from CAR
	--차량 옵션 테이블
		drop sequence car_option_seq;
	drop table car_option;
	create sequence car_option_seq nocache;
	CREATE TABLE CAR_OPTION (
		OPTION_NUMBER number primary key,
		CAR_MODEL VARCHAR2(50),
		OPTION_INFO VARCHAR2(50) NOT NULL
	);
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
--유카존 인서트
	insert into ucar_zone(UCAR_ZONE_NAME,UCAR_ZONE_ADDRESS,latitude,longitude)
	values('장위시장','서울시 성북구 장위동 238-401',37.613476,127.050878);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('신천역','서울시 송파구 잠실동 186-9',37.511306,127.084053);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('용산한남오거리','서울시 용산구 한남동 628-1',37.533534,127.006271);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('서울기차역 5번출구','서울시 중구 중림동 128-3',37.554962,126.964700);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('동묘앞역 4번출구','서울시 종로구 숭인동 292-1',37.573806,127.016463);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('논현역 1번출구','서울시 강남구 논현동 122-8',37.511574,127.023167);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('르네상스호텔사거리','서울시 강남구 역삼동 706',37.503327,127.043676);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('가락시장역 3번출구','서울시 송파구 가락동 98-1',37.495387,127.118600);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('서울고교교차로','서울시 서초구 방배동 1002',37.481236,127.004314);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('서울대입구역 5번출구','서울시 관악구 봉천동 870-13',37.482812,126.951296);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('가산디지털단지역(제이플라츠)','서울시 금천구 가산동 459-11',37.482676,126.881789);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('광명6동삼거리','경기도 광명시 광명동 346-52',37.473850, 126.850070);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('서울과기대 정문','서울시 노원구 공릉동 461-1',37.631078, 127.075662);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('석계역','서울시 노원구 월계동 54-1 맞은편',37.645168, 127.077132);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('고려대','서울시 성북구 안암동5가 126-16',37.585351, 127.026665);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('종각역 1번출구','서울시 종로구 청진동 119-1',37.571344, 126.981648);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('서대문우체국 앞','서울시 서대문구 창천동 92-7',37.5605148,126.9330678);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('KBS수원센터 앞','부산시 금정구 장전동 422-26',35.2294803,129.0860539);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('부산대 정문','부산시 금정구 장전동 422-26',35.230585, 129.086054);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('제주공항','제주도 제주시 도두2동 44',33.504782, 126.491494);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('해운대역','부산시 해운대구 우동 541-29',35.163013, 129.158914);
	
select * from UCAR_ZONE;

