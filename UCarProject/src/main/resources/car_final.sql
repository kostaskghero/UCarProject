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
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('대구한의대 버스정류장','경산시 유곡동 산25-10',35.798074, 128.776651);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('경산역 뒤편','경북 경산시 옥곡동 27-4',35.817479, 128.728282);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('방촌역 1번출구','대구시 동구 방촌동 907-7',35.883042, 128.664939);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('대구 북구청','대구 북구 노원동1가370',35.886680, 128.581138);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('대구 동천동','대구시 북구 동천동903-4',35.944562, 128.559665);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('명덕역 5번출구','대구시 남구 대명2동 2026-12',35.857902, 128.591507);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('감삼역 3번출구','대구시 달서구 두류동 494-1',35.856163, 128.551128);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('경상감영공원','대구 중구 북성로1가 63',35.874942, 128.592740);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('영남대역 5번출구','경북 경산시 임당동 632',35.841082, 128.751609);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('대구한의대 버스정류장','경산시 유곡동 산25-10',35.797969, 128.776737);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('구미역 앞','경북 구미시 원평동 158-56',36.131893, 128.331669);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('구미시외버스터미널','경북 구미시 원평동 1073-1',36.124129, 128.351711);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('구미 옥계동','경북 구미시 거양길 4-47',36.138189, 128.411578);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('구미 인동','경북 구미시 황상동 303-30',36.109573, 128.420361);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('구미 진평동','경북 구미시 진평동111-1',36.095792, 128.425743);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('흑석사거리','광주시 광산구 월곡동 679-12',35.180386, 126.810853);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('스타벅스하남점 옆','광주시 광산구 우산동 1586-23',35.163869, 126.810241);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('광주송정역 앞','광주시 광산구 송정동 1496',35.136826, 126.791345);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('양산지구 사거리','광주시 북구 양산동 246-5',35.211168, 126.873836);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('이마트에브리데이 일곡동점','광주시 북구 일곡동 845-1',35.204561, 126.897202);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('광주광역시청 앞','광주시 서구 치평동 1202-1',35.157730, 126.849709);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('서광주세무서 앞','광주시 서구 쌍촌동 986-14',35.150988, 126.863555);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('유스퀘어','광주시 서구 광천동 49-1',35.159955, 126.880090);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('금남로5가역 3번출구','광주시 북구 누문동 75',35.154859, 126.907771);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('광주교대 인문사회관','광주시 북구 풍향동 1-1',35.165103, 126.926319);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('롯데슈퍼 풍암점 뒤','광주시 서구 풍암동 1117-11',35.126570, 126.879058);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('롯데슈퍼 진월점 옆','광주시 남구 진월동 303-2',35.123600, 126.897763);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('광주대 운동장','광주시 남구 행암동58',35.104740, 126.895781);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('이마트봉선점 옆','광주시 남구 봉선동 545',35.122463, 126.911777);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('주월프라자 옆','광주시 남구 주월동 1261-9',35.132804, 126.908463);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('조선대 국제관','광주시 동구 서석동 359-1',35.143861, 126.931826);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('서구문화센터 앞','광주시 서구 금호동 799',35.131062, 126.858886);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('동신대 도서관','전라남도 나주시 대호동 252-17',35.049895, 126.717642);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('동신대 체육관','전라남도 나주시 대호동 252-17',35.049930, 126.717599);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('순천대 학생회관','전라남도 순천시 석현동 313',34.968767, 127.480309);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('순천역','전라남도 순천시 덕암동 188-101',34.945104, 127.504061);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('전남대(여수) 이학관','전남 여수시 둔덕동 산 91',34.776416, 127.699416);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('전남대(여수) 학생회관','전라남도 여수시 미평동 산 103-1',34.776065, 127.701173);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('목포역','전라남도 목포시 호남동 1-864',34.791750, 126.388440);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('목포대 학생편의관','전라남도 무안군 청계면 도림리61',34.911031, 126.437349);
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('목포대 기숙사','전라남도 무안군 청계면 도림리61',34.910011, 126.436791);
	
select * from UCAR_ZONE;

