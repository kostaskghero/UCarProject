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
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('KBS수원센터 앞','경기도 수원시 팔달구 인계동 1036-13',37.268121, 127.031164);
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
	
	
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('목포대 학생편의관','전라남도 무안군 청계면 도림리61',34.911031, 126.437349);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('강원대학교병원','강원도 춘천시 효자동 17-1',37.875401, 127.745020);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('홈플러스 강동점','서울시 강동구 천호동 42',37.545707, 127.142520);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('김포 운양동','경기도 김포시 운양동 505',37.654452, 126.683766);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('일산1동 주민센터 앞','경기도 고양시 일산서구 일산동 606-1',37.687052, 126.770091);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('고양시청 앞','경기도 고양시 덕양구 주교동 602-1',37.657040, 126.831903);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('전자랜드 일산점','경기도 고양시 일산서구 대화동 2198-2',37.675532, 126.749934);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('연세화이트치과 옆','경기도 고양시 일산서구 성저로 92',37.685590, 126.757156);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('탄현큰마일8단지','경기도 고양시 일산서구 일현로 128',37.685590, 126.757156);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('동문그린시티아파트단지','경기도 파주시 조리읍 대원리 272 그린시티동문아파트',37.726925, 126.816376);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('봉일천감리교회 옆','경기도 파주시 조리읍 봉일천리 229-1',37.726925, 126.816376);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('파주시청앞','경기도 파주시 아동동 215 파주시청',37.759764, 126.779879);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('금촌역 앞','경기도 파주시 금촌동 329-77',37.759764, 126.779879);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('운정 가람마을 8단지','경기도 파주시 와동동 큐브씨앤에스',37.728521, 126.755802);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('운정역 앞','경기도 파주시 운정3동 299-5',37.728521, 126.755802);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('교하초등학교 옆','경기도 파주시 교하동 337',37.753870, 126.747197);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('교하 풋살장 앞','경기도 파주시 하지석동 153-1',37.753870, 126.747197);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('금릉역 주차장','경기도 파주시 금촌2동 979-5',37.750845, 126.765815);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('청석마을 9단지','경기도 파주시 다율동 대원아파트',37.750845, 126.765815);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('교하도서관 옆','경기도 파주시 문발동 129-4',37.750845, 126.765815);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('롯데프리미엄아울렛','경기도 파주시 문발로 284',37.750845, 126.765815);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('가좌마을8단지','경기도 고양시 일산서구 가좌동 유건크레인',37.691000, 126.720671);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('주엽역','경기도 고양시 일산서구 주엽2동 475-1',37.691000, 126.720671);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('정발초등학교','경기도 고양시 일산동구 마두1동 758',37.655750, 126.784101);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('문산역 옆','경기도 파주시 문산읍 문산리 17',37.655750, 126.784101);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('법원여자중학교','경기도 파주시 법원읍 가야리 57-1 법원여자중학교',37.852503, 126.869018);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('천현감리교회 주차장','경기도 파주시 법원읍 법원리 428-16',37.847221, 126.879385);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('비룡아파트','경기도 양주시 남면 개나리19길 88-15',37.900720, 126.973638);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('상수초등학교','경기도 양주시 남면 상수리 443-2',37.900720, 126.973638);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('봉암초등학교','경기도 양주시 은현면 봉암리 403',37.900720, 126.973638);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('상패동교회','경기도 동두천시 상패동 427-11',37.900720, 126.973638);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('상패동주민센터','경기도 동두천시 상패동 83-1',37.905462, 127.043970);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('새은혜아파트','경기도 동두천시 상패동',37.905462, 127.043970);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('공간나누기미술학원','경기도 동두천시 중앙로 301',37.905462, 127.043970);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('파크타운아파트','경기도 동두천시 중앙로 301',37.905462, 127.043970);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('생연부영 5단지 아파트','경기도 동두천시 생연동 715-1',37.905462, 127.043970);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('동두천고등학교','경기도 동두천시 생연1동 산44-1',37.904694, 127.059202);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('생연1동주민센터','경기도 동두천시 생연동 장고갯로 140',37.904694, 127.059202);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('신흥대학교연수원','경기도 동두천시 생연동',37.904694, 127.059202);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('에이스 3차 아파트 주차장','경기도 동두천시 생연동 350',37.904694, 127.059202);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('동두천외국어고등학교','경기도 동두천시 지행동 310',37.904694, 127.059202);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('지행역동 아더 프라임 아파트','경기도 동두천시 불현동 194-1',37.904694, 127.059202);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('덕정역','경기도 양주시 덕정동 324-3',37.843143, 127.061366);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('회천1동주민센터','경기도 양주시 덕정동 140-1',37.843143, 127.061366);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('덕정고등학교','경기도 양주시 고암동 121-1',37.843143, 127.061366);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('옥정고등학교','경기도 양주시 옥정동 250-7',37.827645, 127.088952);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('율정마을13단지아파트','경기도 양주시 율정동 458-6',37.827645, 127.088952);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('양주 2동 주민센터','경기도 양주시 만송동',37.796857, 127.080293);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('고읍 도서관','경기도 양주시 양주2동 51-1',37.796857, 127.080293);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('송우리터미널','경기도 포천시 소흘읍 송우리터미널',37.829607, 127.147702);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('송산역','경기도 의정부시 송산1동 6-5',37.829607, 127.147702);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('세말역','경기도 의정부시 신곡2동 757-1',37.748808, 127.063644);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('신곡1동우체국','경기도 의정부시 신곡1동 716-2',37.731442, 127.057218);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('장암동주민센터','경기도 의정부시 장암동 20-10',37.726346, 127.054214);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('롯데마트','경기도 의정부시 장암동 38-10',37.723650, 127.053038);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('별내초등학교','경기도 남양주시 별내면 청학리 408-2',37.711054, 127.118385);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('별내면청학리컴퓨터학원','경기도 남양주시 별내면 청학리',37.708167, 127.117791);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('별내면사무소','경기도 남양주시 별내면 광전리 122-6',37.702636, 127.124823);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('경은학교','경기도 남양주시 별내면 송산로679번길 6',37.699403, 127.122402);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('진접우체국','경기도 남양주시 진접읍 금곡리 1081',37.712722, 127.187184);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('진접초등학교 옆 주차장','경기도 남양주시 진접읍 해밀예당2로 102',37.717005, 127.199533);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('오남양지아파트 주차장','경기도 남양주시 오남읍 양지리 234',37.708850, 127.201283);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('양지E편한세상2단지아파트','경기도 남양주시 오남읍 양지리 807-2',37.700730, 127.196972);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('오남읍사무소','경기도 남양주시 오남읍 양지리 96-10',37.698812, 127.204693);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('오남도서관 옆 도서관','경기도 남양주시 오남읍 양지리 512-29',37.697899, 127.197698);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('오남대한아파트','경기도 남양주시 오남읍 오남리 267-3',37.685323, 127.213015);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('오남보건소 주차장','경기도 남양주시 오남읍 오남리 산72',37.681198, 127.214757);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('가평군청','경기도 가평군 가평읍 읍내리 513',37.831296, 127.509527);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('금강사원아파트','경기도 가평군 가평읍 읍내리',37.833987, 127.507746);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('가평고등학교','경기도 가평군 가평읍 호반로 2601',37.818170, 127.513186);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('청평역 주차장','경기도 가평군 청평면 청평리 174',37.735391, 127.426533);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('청평 버스터미널','경기도 가평군 청평면 432-24',37.738087, 127.420823);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('천마산역 주차장','경기도 남양주시 화도읍 묵현리 320-31',37.658921, 127.285394);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('남양주대림아파트 주차장','경기도 남양주시 화도읍 마석우리 448-1',37.662175, 127.305050);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('마석우체국 주차장','경기도 남양주시 화도읍 창현리 488-9',37.651878, 127.306269);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('마체질독서실 옆 주차장','경기도 남양주시 화도읍 창현리',37.650383, 127.304213);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('금곡역','경기도 남양주시 금곡동 404-280',37.637324, 127.207865);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('남양주시청','경기도 남양주시 금곡동 경춘로 1037',37.635998, 127.216530);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('금곡우체국','경기도 남양주시 금곡동 404-56',37.634744, 127.207186);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('금곡LG아파트 주차장','경기도 남양주시 금곡동 102 금곡LG아파트',37.628435, 127.202589);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('갈매역','경기도 구리시 갈매동 502-17',37.634059, 127.114696);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('카페베네 옆 주차장','경기도 남양주시 별내동 558-93',37.643913, 127.109929);
   insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address,latitude,longitude) values('갈매초등학교 뒤 주차장','경기도 구리시 갈매동 336',37.628291, 127.116007);
select count(*) from UCAR_ZONE;

