-- FAQ 게시판
drop sequence faq_seq;
drop table faq;
create sequence faq_seq nocache;
CREATE TABLE FAQ (
	FAQ_NO number primary key,
	FAQ_CATEGORY VARCHAR2(200) NOT NULL,
	FAQ_TITLE VARCHAR2(200) NOT NULL,
	FAQ_MEMBER_ID VARCHAR2(50),
	FAQ_CONTENT CLOB NOT NULL,
	constraint FK_FAQ_MEMBER_ID foreign key(FAQ_MEMBER_ID) references member
);

-- 1:1 문의 게시판
drop sequence qna_board_reply_seq;
drop table qna_board_reply;
create sequence qna_board_reply_seq nocache;
create table qna_board_reply(
   qna_no number primary key,
   qna_category varchar2(50) not null,
   qna_member_id varchar2(50) not null,
   qna_title varchar2(100) not null,
   qna_content clob not null,
   qna_time_posted date not null,
   qna_ref number not null,
   qna_restep number default 0,
   qna_relevel number default 0,
   constraint fk_qna_reply_member_id foreign key(qna_member_id) references member(member_id) on DELETE CASCADE
)

-- 공지사항
drop table notice_board;
drop sequence notice_board_seq;
create sequence notice_board_seq nocache;
create table notice_board(
	notice_no number primary key,
	notice_title varchar2(100) not null,
	notice_member_id varchar2(50) not null,
	notice_content clob not null,
	notice_time_posted date not null,
	constraint fk_notice_member_id foreign key(notice_member_id) references member(member_id) on DELETE CASCADE
)
select * from notice_board
