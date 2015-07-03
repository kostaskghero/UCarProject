--공지사항
	insert into notice_board(notice_no, notice_title, notice_member_id, notice_content, notice_time_posted)
values (notice_board_seq.nextval, '[공지] 서울시 카셰어링 공식사업자 선정', 'admin','안녕하세요! 스마트 카셰어링 유카입니다. 

공유도시 서울에서는 교통 복지정책의 일환으로 
카셰어링 서비스 나눔카를 2013.02.20 부터 정식 운영합니다.

유카는 제주에서 처음으로 카셰어링 서비스를 시작한 우수업체로
2013년 서울시 공식 카셰어링 서비스 사업자로 선정되었으며, 
100% 저공해 차량을 제공함으로써 카셰어링의 경제적, 환경적, 사회적 가치를 높이겠습니다. 

2013.02.20 So Smart, ucar SEOUL!

- 서울시 전역 103개소 유카존에서 유카를 이용하실 수 있습니다.
- 주택가, 업무지구 및 주요 대중교통 연계지점에서 편리하게 이용 가능합니다.
- 천호역~구로디지털단지~마포유수지 간 편도 서비스를 제공합니다.


☞ 관련 언론보도 자세히보기


서울시민 여러분의 많은 관심과 이용 부탁드립니다.
고맙습니다.

So Smart, ucar!', sysdate);
	
	insert into notice_board(notice_no, notice_title, notice_member_id, notice_content, notice_time_posted)
values (notice_board_seq.nextval, '[공지] 서울시 카셰어링 공식사업자 선정', 'admin',, sysdate);
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
--추가 FAQ
insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'결제카드 등록은 꼭 해야 하나요?','admin','유카 서비스 가입 및 이용을 위해서는 반드시 결제카드 등록을 해야 합니다. 카셰어링 서비스에서 카드 등록은 회원의 차량 예약 변경 및 기타 페널티 발생을 대비한 최소한의 조건입니다. 결제 금액 및 날짜를 사전에 공지해 드리고 있으니 카드를 등록하시고 편리하게 이용하기 바랍니다.','자주묻는질문');
insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'유카를 반납할 때 연료를 다시 채워야 하나요?','admin','다음 이용자를 위해서 유카 반납 시 잔여연료가 절반이상 남아있는지 반드시 확인해 주세요. 만약 잔여연료 부족으로 다음 이용에 문제가 발생한 경우 페널티금액이 부과될 수 있습니다.','자주묻는질문');
insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'세차가 하고 싶어요! 어떻게 해야하나요?','admin','이용 중 세차가 하고 싶으신가요? 자비부담으로 세차하시면 1만 크레딧을 리워드로 드립니다. 리워드 신청은 한줄댓글에 세차 중인 인증샷과 함께 #세차했유해시태그를 남겨주세요! 
※ 담당자 확인 후 크레딧 지급까지 3~4일이 소요됩니다.','자주묻는질문');
insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'어떤 종류의 차량이 있나요?','admin','유카에는 피아트500, 유나타 하이브리드, 레이, K3, 아반떼, 모닝, 스파크, 그랜드 스타렉스, 프라이드 해치백, 올란도, 미니쿠퍼, 프리우스, 액센트가 있습니다.','예약과 결제문의');
insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'홈페이지에서 차량 예약을 어떻게 하나요?','admin','유카는 회원제 카셰어링 서비스로, 이용을 원하시는 분들은 회원 가입 후 로그인을 하시면 홈페이지에서 차량 예약이 가능합니다. 로그인 후 상단 메뉴에서 ‘유카 예약’을 진행하실 수 있습니다.','예약과 결제문의');
insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'주변에 예약 가능한 유카가 없을 때는 어떻게 하나요?','admin','현재 유카존에는 1~2대의 차량이 주차되어 있으나, 이용이 많을 때에는 예약이 불가능할 수 있습니다. 이런 경우에는 고객센터 1661-3315로 연락 주시면 이용 가능한 차량이 있는지 확인해 드립니다.','예약과 결제문의');
insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'예약한 시간보다 차량 반납이 늦어지는 경우 어떻게 되나요?','admin','차량을 사용 예약한 시간보다 늦게 반납하는 경우, 페널티금액 부과 또는 경고조치를 받을 수 있습니다. 자동차 반납이 10분 이상 30분 미만 지연될 경우 페널티금액 1만원이 부과되며, 30분 이상 지연 시 자동차 반납 예정 시각으로부터 반납 시각까지의 시간 동안에 해당하는 차량 이용요금의 2배가 페널티금액으로 부과됩니다.
','예약과 결제문의');
insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'예약 연장이 가능한가요?','admin','회원님이 사용 중인 차량이 다른 회원이 대기 중인 차량이 아닐 경우에는 차량 연장이 가능합니다. 예약연장은 홈페이지와 스마트폰 앱, 콜센터 상담원을 통해 가능합니다. 다만, 추가 연장 예약을 하지 않거나 콜센터 조치에 의해 사용연장이 되지 않은 상태에서 임의적으로 계속 사용할 경우, 시간당 페널티가 과금될 수 있습니다.','예약과 결제문의');
insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'예약 가능한 횟수가 정해져 있나요?','admin','동일 시간에 중복예약은 불가합니다. 실시간으로 예약 상황을 확인하신 후 필요하실 때 언제든지 이용해주세요.','예약과 결제문의');
insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'가입절차가 어떻게 되나요?','admin','회원가입은 유카 홈페이지 에서 가능합니다. 회원가입 시 실명인증 및 연락처, 이메일, 주소 등의 개인정보와 결제카드정보 및 운전면허 정보를 모두 입력해 주셔야 합니다. 회원가입을 완료하시면 입력하신 정보가 사실과 맞는지 검토하는 과정을 거쳐, 심사가 정상적으로 완료된 후부터 유카 예약 및 이용이 가능합니다.','가입문의');
insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'결제카드 등록은 꼭 해야 하나요?','admin','유카 서비스 가입 및 이용을 위해서는 반드시 결제카드 등록을 해야 합니다. 카셰어링 서비스에서 카드 등록은 회원의 차량 예약 변경 및 기타 페널티 발생을 대비한 최소한의 조건입니다. 결제 금액 및 날짜를 사전에 공지해 드리고 있으니 카드를 등록하시고 편리하게 이용하기 바랍니다.
','가입문의');
insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'가입 후 바로 차를 이용할 수 있나요?','admin','유카 회원 가입을 완료하시면 입력하신 정보가 사실과 맞는지 소정의 심사과정을 진행하게 됩니다. 심사가 정상적으로 완료 된 후 유카 이용이 가능하며, 유카 스마트폰 앱을 다운 받으시면 유카카드 없이 예약 및 사용이 가능합니다. 유카카드는 마이페이지 > 내정보에서 신청하시면 우편으로 배송되며(비용 1,500원), 주말 및 공휴일 제외 5~7일 정도 소요됩니다.','가입문의');
insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'차량 내부를 지저분한 상태로 반납하면 어떻게 되나요?','admin','자동차 내부가 불량한 상태로 차량을 반납한 경우, 30,000원의 페널티금액이 부과됩니다. 유카 차량은 모두가 공유하는 차량이오니, 차량이용 후 깨끗한 상태로 반납해 주세요.
','차량이용');
insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'개인보험으로 차량손실비용을 처리 가능한가요?','admin','특정 상품은 개인보험으로 렌터카 사고를 보장하는 경우가 있습니다. 하지만 보장 예외 정책이 있기 때문에 자세히 확인이 필요합니다. 차량 이용 전에 보험사를 통해 확인하시기 바랍니다.','차량이용');
insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'애완동물도 함께 탈 수 있나요?','admin','장애인을 위한 반려견을 제외한 모든 경우는 애완용 캐리어를 이용해 이동해야 합니다. 애완동물과 동승한 경우에는 다음 이용자를 위해 실내 청소에 더욱 신경 써 주시기 바랍니다.','차량이용');
insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'차량에 개인소지품을 놓고 왔습니다. 어디서 찾아야 하나요?','admin','고객센터로 연락주시면 차량 대여 여부 확인 후 분실물을 찾으실 수 있도록 도와드립니다. 차량 반납 전 미리 트렁크나 서랍 등을 잘 살피시고 두고 내린 물건이 없는지 확인해 주세요!','차량이용');
insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'반납장소에 다른 차가 세워져 있으면 어떻게 하나요?','admin','지정 주차존에 다른 차량이 주차되어 있는 경우, 고객센터로 연락주시면 가까운 다른 주차장소를 안내해 드립니다.','차량이용');
insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'기타사용비용은 어떻게 지급받나요?','admin','유카 사용 중 회원이 직접 자동차의 관리 비용을 지출한 경우, 해당 비용은 회원에게 실비로 지급되며 자동차관리를 위해 지출된 비용에 대해서는 영수증을 반드시 제출해야 합니다. 영수증이 누락된 경우 또는 비용지출일 또는 자동차 대여기간 종료일로부터 15일을 초과한 경우에는 공제가 되지 않습니다. 지출 비용이 5만원 이상일 경우에는, 그 비용 지출 전에 회사 측에 허가를 받아야 하며, 5만원 미만일 경우에는 영수증(간이영수증 제외) 반드시 보관, 제출하여야 합니다. 5만원 미만의 자동차 관리 비용이 발생한 경우, 회원은 보관한 영수증에 성명과 회원번호를 기재하여 회사 팩스 또는 전자우편으로 송부하면 회원의 무료 사용 금액으로 자동 적립 받을 수 있습니다.','차량이용');

 insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'차량 운전을 위해 휴대해야 하는 것이 있나요?','admin','유카 차량 문을 열고 잠그기 위해 반드시 필요한 유카 키와 운전면허증을 소지하시기 바랍니다.','차량이용');
insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'보험에는 어떤 내용이 포함되어 있나요?','admin','모든 유카는 자동차 종합보험(대인배상, 대물배상, 자기신체사고)
및 차량손해 면책제도가 모든차량에 적용되며 기본 대여요금에 포함되어 있어 일반 렌트카처럼 별도의 보험료를 지불할 필요가 없습니다.
만약 상해나 재물상의 손실이 본사의 배상 한도를 초과했을 경우에는 회원이 이 초과분에 대하여 지급할 책임이 있으며 관련 보험사나 상대측 보험사와 컨택하여 처리 할 수 있습니다. 회원의 허가되지 않은 사용에 대한 사건 및 사고는 보험으로 배상되지 않습니다.비회원의 운전은 금지되어 있으며 이로 인한 사고의 피해도 보험적용이 되지 않으며 기존 회원의 회원자격 상실의 사유가 됩니다.','차량이용');
 insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'차 안에서 흡연이 가능한가요?','admin','유카 차량 내에서는 흡연이 일절 금지되어있습니다. 이를 위반한 경우는 10만원의 페널티금액이 부과됩니다. 다음 사용자를 위해 반드시 금연해 주시기 바랍니다.','차량이용');

insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'차량 이용 중 사고가 나거나 긴급 출동이 필요할 때는 어떻게 해야 하나요?','admin','차량 이용 중 고장이나 사고 발생 시 고객센터(1661-3315)로 즉시 연락해 신고해야 하며 회사의 안내를 준수해야 합니다. 사고 후 신고하지 않은 경우에는 보험 혜택을 적용받을 수 없으며 미신고 페널티 금액이 징구됩니다.','사고');

insert into faq( FAQ_NO, FAQ_TITLE, FAQ_MEMBER_ID, FAQ_CONTENT, FAQ_CATEGORY  
  )  values(faq_seq.nextval,'사용하려고 하는데, 차량에 파손이 있으면 어떻게 하나요?','admin','차량 예약 후 주행 전에 반드시 전반적인 차량 외관 및 내부를 점검해 주시기 바랍니다. 차량이 파손 혹은, 문제가 있는경우 유카앱>고객센터>차량사진전송 기능을 이용해주시거나 고객센터로 즉시 연락 주시기 바랍니다. 이러한 절차는 고객님의 이용 전 일어난 사고에 대한 책임을 면책하기 위해 반드시 필요합니다.','사고');


