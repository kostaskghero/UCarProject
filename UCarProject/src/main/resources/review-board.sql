-- 이용후기
drop table review;
drop sequence review_seq;
create sequence review_seq nocache;
create table review(
   review_no number primary key,
   review_title varchar2(100) not null,
   review_member_id varchar2(50),
   review_content clob not null,
   review_time_posted date not null,
   review_hit number default 0 not null
)
select * from review;
insert into review(review_no, review_title, review_member_id, review_content, review_time_posted)
values(review_seq.nextval, '힘들어요', 'bobbob', '힘들고 힘들어요', sysdate);

-- 이용후기댓글
drop table review_comment;
drop sequence review_comment_seq;
create sequence review_comment_seq nocache;
create table review_comment(
   review_comment_no number primary key,
   review_no number,
   review_comment_member_id varchar2(50),
   review_comment_content clob not null,
   review_comment_time_posted date not null,
   constraint fk_review_no foreign key(review_no) references review(review_no) on DELETE CASCADE
)

-- 추천수
drop table review_like;
drop sequence review_like_seq;
create sequence review_like_seq nocache;
create table review_like(
   review_like_no number primary key,
   review_no number,
   review_like_member_id varchar2(50),
   constraint fk_review_like_no foreign key(review_no) references review(review_no) on DELETE CASCADE
)
select * from review_like

--이용후기 사진 테이블 
drop table review_file;
drop sequence review_file_seq;
create sequence review_file_seq nocache;
create table review_file(
review_file_no number primary key,
review_no number not null,
file_path varchar2(200) not null,
constraint review_no_fk foreign key(review_no) references review(review_no) on DELETE CASCADE 
)