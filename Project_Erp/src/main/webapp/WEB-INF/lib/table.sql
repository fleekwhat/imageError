ALTER TABLE product ADD image_path VARCHAR2(255);

CREATE TABLE product (
	num NUMBER PRIMARY KEY, --상품 고유 번호
	name VARCHAR2(100) NOT NULL, --상품 이름
	description VARCHAR2(1000), --상품 설명
	price NUMBER NOT NULL, --상품 가격
	status VARCHAR2(20) --상품 상태
);

CREATE SEQUENCE product_seq;

Create table users2(
num NUMBER PRIMARY KEY, --회원 고유 번호
name VARCHAR2(20), -- 이름
password VARCHAR2(100), -- 비밀번호
branchLocation VARCHAR2(20), -- 지점 주소(ex) 역삼점)
myLocation VARCHAR2(20), -- 개인 주소
branchNum VARCHAR2(20), -- 지점 전화번호
phoneNum VARCHAR2(20), -- 개인 전화번호
grade VARCHAR2(20), --계급
profileImage VARCHAR2(100), -- 프로필 이미지
updatedAt DATE Default sysdate, -- 수정 날짜
registratedAt DATE -- 가입 날짜
);

create sequence users2_seq;