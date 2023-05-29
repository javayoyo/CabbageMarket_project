# <div align = center > 🥬 배 추 마 켓 🥬 </div>
---
## 🕶️ <개발 기간>
+ 2023.05.15 ~ 2023.05.30
---
## 📖 <기획 의도>
+ 게시판 프로젝트를 활용 및 적용하여 "당근 마켓" 참고하여 코딩 및 프로젝트 구체화
---
## ✨ <벤치마킹>
+ 중고거래 플랫폼 "당근마켓" 참고하여 코딩
+ 게시판을 통한 중고거래 및 지역 커뮤니케이션 이웃간의 소통 활성화
---
## ⌨️ <주요기능>
+ 회원 관련 기능

  ㄴ ( 회원가입, 로그인, 로그아웃, 게시글 작성, 게시글 목록 조회 )
+ 관리자 관련 기능

  ㄴ 관리자 계정으로 게시글 숨김, 회원 삭제 기능
+ 게시판 관련 기능

  ㄴ 게시글 작성


	ㄴ 게시글 목록 조회 > 페이징 목록 출력


	ㄴ 게시글 수정 ,  삭제 기능


	ㄴ 본인이 작성한 게시글에 대해서만 수정, 삭제 가능 


	ㄴ 검색 기능 > 작성자, 제목으로 검색할 수 있음


	ㄴ 게시글 상세 조회 시, 글 찜하기 기능


	(해당 적용 시, 관심 목록에서 확인 가능)

+ 댓글 관련 기능

  ㄴ 댓글 작성 및 삭제

+ 마이페이지 관련 기능

  ㄴ 해당 접속하여 회원정보 수정 , 회원 탈퇴 기능

+ 거래자 채팅 기능

  ㄴ 동글채팅 을 활용하여 채팅 기능

---
---
```java
-- 20230515 배추마켓 cabbageMarket_project

-- create user cabbageMarket_project@localhost identified by '1234';

-- create database db_cabbageMarket;

-- grant all privileges on db_cabbageMarket.* to cabbageMarket_project@localhost;

-- 관리자 계정 admin / a1111
```

select * from member_table;

select * from board_table;

select * from member_profile_table;

select * from board_file_table;

select * from comment_table;

select * from waggle_table;

select * from waggle_file_table;

```java
create table member_table(
                             id bigint auto_increment primary key,
                             memberEmail varchar(50) unique not null,
                             memberPassword varchar(50) not null,
                             memberName varchar(10) not null,
                             memberMobile varchar (20) not null,
                             memberProfile int default 0

);
```

drop table if exists member_table;


```java
create table member_profile_table(
                                     id bigint auto_increment primary key,
                                     originalFileName varchar(100) not null,
                                     storedFileName varchar(100) not null,
                                     memberId bigint,
                                     constraint fk_member_profile foreign key (memberId) references member_table(id)


);
```
drop table if exists member_profile_table;

```java
create table board_table(
                            id bigint auto_increment primary key,
                            boardTitle varchar(30) not null,
                            boardWriter varchar(30) not null,
                            boardContents varchar(500) not null,
                            boardHits int default 0,
                            boardCreatedDate datetime default now(),
                            fileAttached int default 0,
                            memberId bigint,
                            constraint fk_board foreign key (memberId) references member_table(id) on delete cascade

);
```
drop table if exists board_table;



```java
create table board_file_table(

                                 id bigint auto_increment primary key,
                                 originalFileName varchar(100) not null,
                                 storedFileName varchar(100) not null,
                                 boardId bigint,
                                 constraint fk_board_file foreign key (boardId) references board_table(id) on delete cascade
);
```
drop table if exists board_file_table;

```java
-- 참조 필요 시, 해당 fk_인덱스 대해 중복 불가, 구별 필요
create table comment_table(
                              id bigint auto_increment primary key,
                              memberId bigint,
                              commentWriter varchar(20) not null,
                              commentContents varchar(100) not null,
                              commentCreatedDate datetime default now(),
                              boardId bigint,
                              constraint fk_comment1 foreign key (memberId) references member_table(id) on delete cascade,
                              constraint fk_comment2 foreign key (boardId) references board_table(id) on delete cascade


);
```
drop table if exists comment_table;

```java
-- 와글의 경우
create table waggle_table(
                             id bigint auto_increment primary key,
                             boardTitle varchar(30) not null,
                             boardWriter varchar(30) not null,
                             boardContents varchar(500) not null,
                             boardHits int default 0,
                             boardCreatedDate datetime default now(),
                             fileAttached int default 0,
                             memberId bigint,
                             constraint fk_waggle foreign key (memberId) references member_table(id) on delete cascade

);
```

drop table if exists waggle_table;
```java
create table waggle_file_table(

                                  id bigint auto_increment primary key,
                                  originalFileName varchar(100) not null,
                                  storedFileName varchar(100) not null,
                                  boardId bigint,
                                  constraint fk_waggle_file foreign key (boardId) references board_table(id) on delete cascade
);
```
drop table if exists waggle_file_table;


---
---
* 거래-와글 댓글 연동> 분리 개선 필요
* api DB 저장 구현
* 댓글작성 후 새로고침해야 댓글 삭제 버튼 노출
* 마이페이지 첫 클릭시 실행 안돼 한번 더 클릭 시 이동되는 점
* 좋아요 db 설계 및 구현
---
추후 구현을 해본다면 ?

*게시글 숨김>게시글 숨김

*게시글 찜하기>게시글 좋아요 

*다국어 제공>새창으로 다국어 버전

*온도 레벨업 기능>온도 올리기

*지역별 페이징처리>지역별로 검색용이

*거래하기 좋은 날씨>날씨 확인 api 관련


