--차량 모델 
select * from CAR_MODEL_INFO;
-- select해봐서 db에들어있는것들은 넣지 말기
	insert into CAR_MODEL_INFO(CAR_MODEL,CAR_TYPE, RENTAL_FEE, DRIVING_FEE, CAR_PHOTO, OIL_TYPE) 
	values('모닝', '경차A',1050, 170, '경로', '휘발유');
	insert into CAR_MODEL_INFO(CAR_MODEL,CAR_TYPE, RENTAL_FEE, DRIVING_FEE, CAR_PHOTO, OIL_TYPE) 
	values('스파크', '경차A',1050, 170, '경로', '휘발유');
	insert into CAR_MODEL_INFO(CAR_MODEL,CAR_TYPE, RENTAL_FEE, DRIVING_FEE, CAR_PHOTO, OIL_TYPE) 
	values('레이', '경차B',1100, 180, '경로', '휘발유');
	insert into CAR_MODEL_INFO(CAR_MODEL,CAR_TYPE, RENTAL_FEE, DRIVING_FEE, CAR_PHOTO, OIL_TYPE) 
	values('프라이드', '소형',1250, 180, '경로', '휘발유');
	insert into CAR_MODEL_INFO(CAR_MODEL,CAR_TYPE, RENTAL_FEE, DRIVING_FEE, CAR_PHOTO, OIL_TYPE) 
	values('엑센트', '소형',1250, 180, '경로', '경유');
	insert into CAR_MODEL_INFO(CAR_MODEL,CAR_TYPE, RENTAL_FEE, DRIVING_FEE, CAR_PHOTO, OIL_TYPE) 
	values('K3', '준중형',1390, 180, '경로', '휘발유');
	insert into CAR_MODEL_INFO(CAR_MODEL,CAR_TYPE, RENTAL_FEE, DRIVING_FEE, CAR_PHOTO, OIL_TYPE) 
	values('아반떼', '준중형',1390, 180, '경로', '휘발유');
	insert into CAR_MODEL_INFO(CAR_MODEL,CAR_TYPE, RENTAL_FEE, DRIVING_FEE, CAR_PHOTO, OIL_TYPE) 
	values('피아트500', '수입차',2500, 220, '경로', '휘발유');
	insert into CAR_MODEL_INFO(CAR_MODEL,CAR_TYPE, RENTAL_FEE, DRIVING_FEE, CAR_PHOTO, OIL_TYPE) 
	values('비틀', '수입차',3340, 180, '경로', '휘발유');
	insert into CAR_MODEL_INFO(CAR_MODEL,CAR_TYPE, RENTAL_FEE, DRIVING_FEE, CAR_PHOTO, OIL_TYPE) 
	values('미니쿠퍼', '수입차',2830, 230, '경로', '휘발유');
	insert into CAR_MODEL_INFO(CAR_MODEL,CAR_TYPE, RENTAL_FEE, DRIVING_FEE, CAR_PHOTO, OIL_TYPE) 
	values('미니5도어', '수입차',3000, 230, '경로', '휘발유');
	insert into CAR_MODEL_INFO(CAR_MODEL,CAR_TYPE, RENTAL_FEE, DRIVING_FEE, CAR_PHOTO, OIL_TYPE) 
	values('프리우스', '수입차',2830, 190, '경로', '휘발유');
	insert into CAR_MODEL_INFO(CAR_MODEL,CAR_TYPE, RENTAL_FEE, DRIVING_FEE, CAR_PHOTO, OIL_TYPE) 
	values('올란도', 'SUV',2880, 230, '경로', '경유');
	insert into CAR_MODEL_INFO(CAR_MODEL,CAR_TYPE, RENTAL_FEE, DRIVING_FEE, CAR_PHOTO, OIL_TYPE) 
	values('QM3', '소형SUV',2660, 180, '경로', '경유');
	insert into CAR_MODEL_INFO(CAR_MODEL,CAR_TYPE, RENTAL_FEE, DRIVING_FEE, CAR_PHOTO, OIL_TYPE) 
	values('그랜드 스타렉스', '승합차',3650, 270, '경로', '경유');
--유카존
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address) values('신천역','서울시 송파구 잠실동 186-9');
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address) values('용산한남오거리','서울시 용산구 한남동 628-1');
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address) values('서울기차역 5번출구','서울시 중구 중림동 128-3');
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address) values('동묘앞역 4번출구','서울시 종로구 숭인동 292-1');
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address) values('논현역 1번출구','서울시 강남구 논현동 122-8');
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address) values('르네상스호텔사거리','서울시 강남구 역삼동 706');
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address) values('가락시장역 3번출구','서울시 송파구 가락동 98-1');
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address) values('서울고교교차로','서울시 서초구 방배동 1002');
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address) values('서울대입구역 5번출구','서울시 관악구 봉천동 870-13');
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address) values('가산디지털단지역(제이플라츠)','서울시 금천구 가산동 459-11');
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address) values('광명6동삼거리','경기도 광명시 광명동 346-52');
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address) values('서울과기대 정문','서울시 노원구 공릉동 461-1');
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address) values('석계역','서울시 노원구 월계동 54-1 맞은편');
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address) values('고려대','서울시 성북구 안암동5가 126-16');
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address) values('종각역 1번출구','서울시 종로구 청진동 119-1');
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address) values('서대문우체국 앞','서울시 서대문구 창천동 92-7');
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address) values('KBS수원센터 앞','부산시 금정구 장전동 422-26');
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address) values('부산대 정문','경기도 수원시 팔달구 인계동 1036-13');
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address) values('제주공항','제주도 제주시 도두2동 44');
	insert into ucar_zone(UCAR_ZONE_NAME,ucar_zone_address) values('해운대역','부산시 해운대구 우동 541-29');


--차 넣기
	insert into car(CAR_NO, CAR_MODEL, UCAR_ZONE_NAME, CAR_NICK_NAME)
	values(car_seq.nextval, '모닝', '신천역', '꼬맹이');
	insert into car(CAR_NO, CAR_MODEL, UCAR_ZONE_NAME, CAR_NICK_NAME)
	values(car_seq.nextval, '미니쿠퍼', '신천역', '미쿠');
	insert into car(CAR_NO, CAR_MODEL, UCAR_ZONE_NAME, CAR_NICK_NAME)
	values(car_seq.nextval, 'QM3', '신천역', '큐엠이');
		insert into car(CAR_NO, CAR_MODEL, UCAR_ZONE_NAME, CAR_NICK_NAME)
	values(car_seq.nextval, '피아트500', '해운대역', '피앙');
		insert into car(CAR_NO, CAR_MODEL, UCAR_ZONE_NAME, CAR_NICK_NAME)
	values(car_seq.nextval, '프라이드', '가산디지털단지역(제이플라츠)', '프이라');
		insert into car(CAR_NO, CAR_MODEL, UCAR_ZONE_NAME, CAR_NICK_NAME)
	values(car_seq.nextval, '레이', '고려대', '레아');
		insert into car(CAR_NO, CAR_MODEL, UCAR_ZONE_NAME, CAR_NICK_NAME)
	values(car_seq.nextval, '스파크', '르네상스호텔사거리', '스카');
		insert into car(CAR_NO, CAR_MODEL, UCAR_ZONE_NAME, CAR_NICK_NAME)
	values(car_seq.nextval, '엑센트', '논현역 1번출구', '아랑');
		insert into car(CAR_NO, CAR_MODEL, UCAR_ZONE_NAME, CAR_NICK_NAME)
	values(car_seq.nextval, '미니5도어', '용산한남오거리', '미니쿠');
		insert into car(CAR_NO, CAR_MODEL, UCAR_ZONE_NAME, CAR_NICK_NAME)
	values(car_seq.nextval, '그랜드 스타렉스', '제주공항', '스타');
	insert into car(CAR_NO, CAR_MODEL, UCAR_ZONE_NAME, CAR_NICK_NAME)
	values(car_seq.nextval, '올란도', '가락시장역 3번출구', '올랑');
	insert into car(CAR_NO, CAR_MODEL, UCAR_ZONE_NAME, CAR_NICK_NAME)
	values(car_seq.nextval, 'K3', '서대문우체국 앞', '케아');




--공지사항
	insert into notice_board(notice_no, notice_title, notice_member_id, notice_content, notice_time_posted)
values (notice_board_seq.nextval, '[이벤트] 업무용 법카 등록하고 유카로 10% 추가할인 받으세요!', 'admin','
안녕하세요, 대한민국 1등 카셰어링 유카입니다.

유카에 결제카드를 모두 3장까지 등록해두고 용도에 따라 사용 할 수 있다는 사실 알고 계셨나요?
과장님과 탈 땐 법카, 애인과 탈 땐 개카, 출장갈 땐 법카, 놀러갈 땐 개카 용도에 따라 골라 쓸수있답니다!
이제 결제카드에 업무용 법인카드를 등록하고 주중 10% 할인 혜택 받으세요! 


■ 이벤트 안내
- 이벤트 기간: 2015년 5월 4일(월) ~ 5월 17일(일) 
- 참여방법: 기간 중 결제카드에 법인카드 신규등록
- 혜택: 10% 할인쿠폰 지급 (유효기간: ~6/30)
- 대상: 기존·신규회원 모두 가능 / 개인회원·법인구성원 모두 가능
※ 5월 4일(월) ~ 5월 10일(일) 등록 시 : 5월 12일(화) 쿠폰 일괄 지급
※ 5월 11일(월) ~ 5월 17일(일) 등록 시 : 5월 19일(화) 쿠폰 일괄 지급
※ 주중 사용 가능 / 수입차종 할인 적용 불가 / 1회 최대 할인금액 1만원

■ 결제카드 등록방법
- 신규회원 : 회원가입 단계에서 결제카드 등록 > 법인카드 등록
- 기존회원 : 마이페이지 > 면허/결제카드/회원카드 > 결제카드 등록하기 > 법인카드 추가?', sysdate);
	insert into notice_board(notice_no, notice_title, notice_member_id, notice_content, notice_time_posted)
values (notice_board_seq.nextval, '[이벤트] 유카 전격 작명 작전! 2,400대의 차량에 이름을 부여하라!', 'admin','안녕하세요, 대한민국 1등 카셰어링 유카입니다.

내가 너의 이름을 불러주었을 때 너는 나에게로 와서 #유카가 되었다.
12호 3456 차량번호로 부르면 그냥 차지만, 
이름을 붙여주고 불러주면 우리에겐 더욱 특별한 유카가 됩니다.

2,400대의 유카에 고유한 이름을 유친이 직접 지어주세요!
응모한 이름이 선정되면 해당 차량에는 번호와 함께 이름이 표기되어
모든 유친들이 내가 지은 이름으로 유카를 이용하고 부르게 됩니다.


■ 이벤트 기간
2015년 4월 29일(수) ~ 5월 12일(화)

■ 참여 방법
유카 App 또는 모바일 홈페이지 > 유카 이벤트 > 유카 전격작명작전 > 작명할 차량 검색 후 선택 > 이름 응모', sysdate);
	insert into notice_board(notice_no, notice_title, notice_member_id, notice_content, notice_time_posted)
values (notice_board_seq.nextval, '[공지] 유카 공공서비스 혜택 제공 안내 (2015년)', 'admin','안녕하세요, 스마트 카셰어링 유카입니다.

2015년 유카에서 제공해드리는 공공서비스 혜택을 아래와 같이 안내해 드립니다. 



1. 카셰어링 우수 이용자 혜택

ㆍ제공 내용 : 유카 카셰어링 이용 횟수에 따라 다양한 혜택 제공 
ㆍ지급 대상 : SO회원이며, 이용 실적이 유카가 정한 기준에 맞는 회원


2. 대중교통 이용자 혜택

ㆍ제공 내용 : 대중 교통 이용 후 유카를 이용하는 회원에게 300원 쿠폰 제공
ㆍ지급 대상 : SO회원, 대중교통 정상 하차 후 30분 이내 유카를 이용하는 회원 (티머니에 한함)
ㆍ제공 방식 : 유카 이용 종료 후 자동 제공


3. 저소득층 대상 무료 이용쿠폰 제공

ㆍ제공 내용 : 월 1만원에 상당하는 카셰어링 차량 대여료 지원
ㆍ지급 대상 : 전국가구 월 평균 소득의 100분의 60 이하인 세대 구성원
ㆍ신청 서류 : 수급자증명서, 차상위계층확인서, 복지대상자 건강보험료 납입고지서 중 1가지
ㆍ신청 방법 : 신청서류를 이메일(social@socar.kr)로 전달하여 신청, 접수 시 신청인의 유카 ID(이메일) 필수 기재


4. 장애인 할인 지원

ㆍ제공 내용 : 월 1만원에 상당하는 카셰어링 차량 대여료 지원
ㆍ지급 대상 : 장애인 및 장애인 가족
ㆍ신청 서류 : 본인 혹은 가족의 장애인등록증 사본 (가족인 경우 가족관계증명서 추가 제출)
ㆍ신청 방법 : 신청서류를 이메일(social@socar.kr)로 전달하여 신청, 접수 시 신청인의 유카 ID(이메일) 필수 기재


5. 봉사활동 차량 지원

ㆍ제공 내용 : 최소 3명으로 구성된 팀의 봉사활동 신청 시 최대 10시간(평일 기준) 무료 이용쿠폰 증정
ㆍ지급 대상 : 인증된 봉사활동단체 또는 개인 봉사활동자(봉사활동기관 인증 필요)
ㆍ신청 서류 : 봉사활동 차량 지원 신청서(별도 양식) 
ㆍ신청 방법 : 신청서류를 이메일(social@socar.kr)로 신청, 접수 시 신청인의 유카 ID(이메일) 필수 기재


6. 자동차 처분(매각)자 혜택


ㆍ제공 내용 : 자동차 처분 시 최대 24시간 무료 이용쿠폰 제공
ㆍ지급 대상 : 최근 3개월 내 본인 소유 차량 처분자
ㆍ신청 서류 : 폐차인수증명서, 자동차양도증명서, 자동차말소등록사실증명서, 자동차원부 중 1가지
ㆍ신청 방법 : 신청서류를 이메일(social@socar.kr)로 신청, 접수 시 신청인의 유카 ID(이메일) 필수 기재


7. 웨딩카 지원

ㆍ제공 내용 : 2개월이내 결혼 예정인 커플 1쌍을 선정해 24시간 무료 이용 쿠폰 제공
ㆍ지급 대상 : SO회원이며, 전월 사용 실적이 있는 회원에 한함. (운전자 별도 가입 필수)
ㆍ신청 서류 : 청첩장 사본
ㆍ신청 방법 : 신청 서류를 이메일(social@socar.kr)로 전달하여 신청. 접수 시 신청인의 유카 ID(이메일) 필수 기재


8. 소외계층 희망 물품 기부

ㆍ제공 내용 : 유카 이용 건수마다 10원씩 적립하여 연 1회 희망 물품 전달
ㆍ일정 및 상세 방안은 하반기 공지 예정


9. 스타트업 기업 차량 지원 혜택

ㆍ제공 내용 : 스타트업 분기별 10개 업체 선정하여 3개월 간 매월 유카 10만원 이용 쿠폰 제공
ㆍ지급 대상 : 설립 1년 이내의 스타트업 기업
ㆍ신청 서류 : 사업자등록증 사본
ㆍ신청 방법 : 신청 서류를 이메일(partner@socar.kr)로 전달하여 신청, 접수 시 신청인의 유카 ID(이메일) 필수 기재


전체 지원 범위 및 규모에 따라 항목별 혜택은 조정될 수 있습니다.

더 궁금하신 사항은 유카 소식 및 고객센터 1:1 문의를 이용해주세요.', sysdate);

--FAQ
insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'이용 요금은 어떻게 지불해야 하나요?','admin','유카 서비스 가입 시 등록한 결제카드를 통해 이용금액이 지불됩니다. 예약하신 시간 수 분 전에 자동으로 결제되며 사용 반납 후 km당 주행요금이 결제 됩니다.','자주묻는질문');
insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'신용카드만 가능한가요? 체크카드는 등록이 안되나요?','admin','신용카드, 체크카드 둘다 등록 가능합니다. 단, 체크카드 등록 후 이용금액이 충분하지 않아 결제가 정상적으로 되지 않을 시에는 차량 이용이 제한됩니다.','자주묻는질문');
insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'내가 예약한 동안 차량은 다른 사람이 운전해도 되나요?','admin','예약한 회원 본인과 예약 시 지정한 추가 운전자 1인만 유카를 운전 할 수 있습니다. 이 외 유카와 협의되지 않은 제 3자가 운전하거나 예약자 없이 동승 운전자가 단독운행하여 발생한 사고는 보험 혜택 등을 적용 받을 수 없습니다. ','자주묻는질문');
insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'이용 요금은 어떻게 지불해야 하나요?','admin','유카 서비스 가입 시 등록한 결제카드를 통해 이용금액이 지불됩니다. 예약하신 시간 수 분 전에 자동으로 결제되며 사용 반납 후 km당 주행요금이 결제 됩니다.','자주묻는질문');
insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'예약 연장이 가능한가요?','admin','회원님이 사용 중인 차량이 다른 회원이 대기 중인 차량이 아닐 경우에는 차량 연장이 가능합니다. 예약연장은 홈페이지와 스마트폰 앱, 콜센터 상담원을 통해 가능합니다. 다만, 추가 연장 예약을 하지 않거나 콜센터 조치에 의해 사용연장이 되지 않은 상태에서 임의적으로 계속 사용할 경우, 시간당 페널티가 과금될 수 있습니다.','자주묻는질문');
insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'예약시간보다 일찍 반납하면 요금을 돌려받을 수 있나요?','admin','이미 예약된 시간에는 다른 회원의 예약이 불가능하기 때문에 반납 예정 시간보다 먼저 자동차를 반납하더라도 사전 예약한 시간의 요금이 부과됩니다.','예약과 결제문의');
insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'예약한 시간보다 차량 반납이 늦어지는 경우 어떻게 되나요?','admin','차량을 사용 예약한 시간보다 늦게 반납하는 경우, 페널티금액 부과 또는 경고조치를 받을 수 있습니다. 자동차 반납이 10분 이상 30분 미만 지연될 경우 페널티금액 1만원이 부과되며, 30분 이상 지연 시 자동차 반납 예정 시각으로부터 반납 시각까지의 시간 동안에 해당하는 차량 이용요금의 2배가 페널티금액으로 부과됩니다.','예약과 결제문의');
insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'꼭 회원가입해야 이용이 가능한가요?','admin','네, 유카는 신뢰를 기반으로 한 회원제 서비스로 안전한 이용을 위하여 회원으로 가입하셔야만 이용이 가능합니다.','가입문의');
insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'연회비 제도가 있나요?','admin','유카에서는 별도 연회비가 없이 모든 서비스를 이용하실 수 있습니다.※ 유카 SO회원에 한해 적용되던 연회비가 2014년 1월 9일 부로 무료화되었습니다. 대여요금 최대 70% 할인 등, SO회원 혜택은 그대로 유지됩니다. 회원제에 대해 궁금하신 사항은 고객센터(1661-3315)로 문의 부탁드립니다.','가입문의');
insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'차에 사고가 난 흔적을 발견 하면 어떻게 하나요?','admin','차에 사고가 난 흔적을 발견 하면 어떻게 하나요?','차량이용');
  insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'이용에 제한을 받을 수 있나요?','admin','유카 이용 중 사고가 났을 경우, 해당 사고가 처리될 때까지 회원의 유카 서비스 이용이 정지됩니다. 미납요금이 있거나 벌금 및 손해배상 등 회원이 회사에 대한 채무가 남아있는 경우도 해당 회원의 유카 서비스는 중지됩니다. 이 밖에 회사에 금전적, 물질적 손해를 입힌 경우 회사 내규에 따라 이용에 제한을 받을 수 있습니다.','차량이용');
  insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'자동차 반납을 지정된 장소가 아닌 다른곳에 하게 되면 어떻게 되나요?','admin','차량을 지정되지 않은 장소로 반납할 경우 50,000원의 페널티금액이 부과되며, 견인, 주차비 등의 비용이 발생하는 경우 벌금과 함께 부과됩니다. 유카를 대여한 장소가 아닌 다른 곳에 반납 할 경우 다음 이용자에게 불편을 주게 되므로 반드시 대여한 장소에 반납하여 주시기 바랍니다. (단, 편도노선은 예외) 부득이하게 정해진 유카존과 떨어진 곳에 주차하셔야 할 경우에는 반드시 고객센터 1661-3315로 미리 알려주셔야 합니다.','차량이용');
  insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'교통위반 고지서를 받으면 어떻게 해야하죠?','admin','회사에서 교통위반 고지서를 받은 후 고객님께 개별 통보드립니다. 교통위반으로 인한 벌금, 과태료 등의 비용은 당시 운전한 회원이 지불해야 합니다.','사고');
    insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'사고를 당하면 어떻게 해야 하나요?','admin','사고 발생 시 부상자 및 차량 파손 여부를 확인해 경찰서에 신고하고, 유카 고객센터로도 곧바로 연락주시기 바랍니다. 본인 과실이 아닌 경우, 경찰 진술서가 보험적용에 큰 영향을 미칩니다. 이점 유념해 주시고, 다음 내용을 기록해 주세요. 사고발생지점, 부상자 여부, 동승자 및 관련자 이름과 연락처, 운전면허번호, 보험사 연락처, 차량 번호 및 기타 파손된 시설물이 있다면 소유자 연락처를 확인해 주세요. 보험요청을 위해 사고 현장 및 차량은 사진을 찍어 보관해 주시고, 목격자를 확보해 주세요. 차량 동승자나 가족, 친구는 법정에서 증인으로 효력이 없습니다. 사고 발생 시 모든 사고 처리가 완료될 때까지 회원 자격이 일시 정지되며, 처리가 완료된 후에 다시 회원으로 이용이 가능합니다.','사고');
    insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'개인보험으로 차량손실비용을 처리 가능한가요?','admin','특정 상품은 개인보험으로 렌터카 사고를 보장하는 경우가 있습니다. 하지만 보장 예외 정책이 있기 때문에 자세히 확인이 필요합니다. 차량 이용 전에 보험사를 통해 확인하시기 바랍니다.','사고');
   insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'탈퇴 시 보유한 포인트은 환불이 되나요?','admin','회사가 무상으로 부여한 크레딧은 환불되지 않습니다. 3개월 후 재가입을 하셔도 다시 생성되지 않습니다. 단, 유상으로 구매하신 크레딧은 규정에 따라 환불됩니다.','탈퇴');
   insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'탈퇴를 하려면 어떻게 해야하나요','admin','유카 홈페이지 로그인 후, 마이페이지>내정보 하단의 탈퇴하기 버튼을 클릭하여, 탈퇴를 요청해주세요. 관리자가 미납 요금 및 환불 금액을 확인한 후 탈퇴를 처리해 드립니다.



[!] 회원 탈퇴 시에는 아래의 주의 사항을 반드시 확인해주세요!

1) 탈퇴 시 3개월간 재가입이 제한됩니다. 아이디/이름 변경 등이 필요한 경우에는 고객센터로 문의해주세요.

2) 탈퇴 시 회사가 무상으로 부여한 크레딧은 환불되지 않으며, 3개월 후 재가입을 하셔도 다시 생성되지 않습니다. 단, 유상으로 구매하신 크레딧은 규정에 따라 환불해 드립니다.','탈퇴');
   insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'주변에 유카존이 없어서 이용이 불편합니다. 요청은 어떻게 하나요?','admin','원하시는 유카존이 있는 경우 자세한 위치 및 유카존이 생겼으면 하는 이유를 PC홈페이지 유카존 신청하기나 고객센터 1:1 문의하기로 보내주시면 의견을 수렴해 	유카존을 마련해 나가도록 하겠습니다. ','기타');
     insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'세차가 하고 싶어요! 어떻게 해야하나요?','admin','이용 중 세차가 하고 싶으신가요? 자비부담으로 세차하시면 1만 크레딧을 리워드로 드립니다. 리워드 신청은 한줄댓글에 세차 중인 인증샷과 함께 '#세차했유' 해시태그를 남겨주세요! 

※ 담당자 확인 후 크레딧 지급까지 3~4일이 소요됩니다','기타');

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  