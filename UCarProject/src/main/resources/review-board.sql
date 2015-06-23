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
   review_hit number default 0 not null,
   --review_like_count number default 0 not null,(추천수는 VO에만 표시)
   constraint fk_review_member_id foreign key(review_member_id) references member
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
   constraint fk_review_comment_member_id foreign key(review_comment_member_id) references member,
   constraint fk_review_no foreign key(review_no) references review
)

-- 추천수
drop table review_like;
drop sequence review_like_seq;
create sequence review_like_seq nocache;
create table review_like(
   review_like_no number primary key,
   review_no number,
   review_like_member_id varchar2(50),
   constraint fk_review_like_member_id foreign key(review_like_member_id) references member,
   constraint fk_review_like_no foreign key(review_no) references review
)
select * from review_like