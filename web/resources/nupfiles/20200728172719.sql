/* 고객센터 */
DROP TABLE TB_SERVICE_CENTER 
	CASCADE CONSTRAINTS;

/* 사용자 */
DROP TABLE TB_USER 
	CASCADE CONSTRAINTS;

/* 지점상품 */
DROP TABLE TB_STORE_PRODUCT 
	CASCADE CONSTRAINTS;

/* 할인 */
DROP TABLE TB_DC_INFO 
	CASCADE CONSTRAINTS;

/* 상품 */
DROP TABLE TB_PRODUCT 
	CASCADE CONSTRAINTS;

/* 관심목록 */
DROP TABLE TB_FAVORITE_LIST 
	CASCADE CONSTRAINTS;

/* 지점 */
DROP TABLE TB_STORE 
	CASCADE CONSTRAINTS;

/* 이벤트 */
DROP TABLE TB_EVENT 
	CASCADE CONSTRAINTS;

/* 구매 */
DROP TABLE TB_PURCHASE 
	CASCADE CONSTRAINTS;

/* 이벤트참여 */
DROP TABLE TB_EVENT_JOIN 
	CASCADE CONSTRAINTS;

/* 할인상품 */
DROP TABLE TB_DC_PRODUCT 
	CASCADE CONSTRAINTS;

/* 자유게시판 */
DROP TABLE TB_BOARD 
	CASCADE CONSTRAINTS;

/* 상품종류 */
DROP TABLE TB_PRODUCT_KIND 
	CASCADE CONSTRAINTS;

/* 기프티콘 */
DROP TABLE TB_GIFTICON 
	CASCADE CONSTRAINTS;

/* 이벤트결과 */
DROP TABLE TB_EVENT_RESULT 
	CASCADE CONSTRAINTS;

/* 고객센터댓글 */
DROP TABLE TB_SERVICE_CENTER_COMMENT 
	CASCADE CONSTRAINTS;

/* 상호 */
DROP TABLE TB_BRAND 
	CASCADE CONSTRAINTS;
  
/* DROP SEQUENCE SEQ_BOARD_NO */
DROP SEQUENCE SEQ_BOARD_NO;

/* DROP SEQUENCE SEQ_EVENT_NO */
DROP SEQUENCE SEQ_EVENT_NO;

/* DROP SEQUENCE SEQ_EVENT_RESULT_NO */
DROP SEQUENCE SEQ_EVENT_RESULT_NO;

/* DROP SEQUENCE SEQ_GIFTICON_NO */
DROP SEQUENCE SEQ_GIFTICON_NO;

/* DROP SEQUENCE SEQ_PRODUCT_NO */
DROP SEQUENCE SEQ_PRODUCT_NO;

/* DROP SEQUENCE SEQ_PURCHASE_NO */
DROP SEQUENCE SEQ_PURCHASE_NO;

/* DROP SEQUENCE SEQ_SERVICE_NO */
DROP SEQUENCE SEQ_SERVICE_NO;

/* DROP SEQUENCE SEQ_STORE_PRODUCT_NO */
DROP SEQUENCE SEQ_STORE_PRODUCT_NO;

/* DROP SEQUENCE SEQ_USER_NO */
DROP SEQUENCE SEQ_USER_NO;


/* 고객센터 */
CREATE TABLE TB_SERVICE_CENTER (
	SERVICE_NO NUMBER NOT NULL, /* 문의번호 */
	TITLE VARCHAR2(300), /* 제목 */
	WRITER NUMBER, /* 작성자 */
	CONTENTS VARCHAR2(3000), /* 내용 */
	WRITE_DATE DATE, /* 작성일 */
	READCOUNT NUMBER, /* 조회수 */
	ORIGINAL_FILE_NAME VARCHAR2(260), /* 첨부파일기존명 */
	STORED_FILE_NAME VARCHAR2(36), /* 첨부파일변경명 */
	DEL_CHECK VARCHAR2(1) DEFAULT 'N' NOT NULL /* 삭제구분 */
);

COMMENT ON TABLE TB_SERVICE_CENTER IS '고객센터';

COMMENT ON COLUMN TB_SERVICE_CENTER.SERVICE_NO IS '문의번호';

COMMENT ON COLUMN TB_SERVICE_CENTER.TITLE IS '제목';

COMMENT ON COLUMN TB_SERVICE_CENTER.WRITER IS '작성자';

COMMENT ON COLUMN TB_SERVICE_CENTER.CONTENTS IS '내용';

COMMENT ON COLUMN TB_SERVICE_CENTER.WRITE_DATE IS '작성일';

COMMENT ON COLUMN TB_SERVICE_CENTER.READCOUNT IS '조회수';

COMMENT ON COLUMN TB_SERVICE_CENTER.ORIGINAL_FILE_NAME IS '첨부파일기존명';

COMMENT ON COLUMN TB_SERVICE_CENTER.STORED_FILE_NAME IS '첨부파일변경명';

COMMENT ON COLUMN TB_SERVICE_CENTER.DEL_CHECK IS '삭제구분';

ALTER TABLE TB_SERVICE_CENTER
	ADD
		CONSTRAINT PK_TB_SERVICE_CENTER
		PRIMARY KEY (
			SERVICE_NO
		);

/* 사용자 */
CREATE TABLE TB_USER (
	USER_NO NUMBER NOT NULL, /* 사용자번호 */
	EMAIL VARCHAR2(100), /* 이메일 */
	USER_PWD VARCHAR2(50), /* 비밀번호 */
	USER_NAME VARCHAR2(30), /* 이름 */
	BIRTHDAY DATE, /* 생년월일 */
	GENDER VARCHAR2(1), /* 성별 */
	PHONE VARCHAR2(30), /* 연락처 */
	ADDRESS VARCHAR2(300), /* 주소 */
	ORIGINAL_FILE_NAME VARCHAR2(260), /* 첨부파일기존명 */
	STORED_FILE_NAME VARCHAR2(36), /* 첨부파일변경명 */
	USER_STATE NUMBER, /* 상태 */
	JOB VARCHAR2(20), /* 직책 */
	CASH NUMBER, /* 잔고 */
	POINT NUMBER, /* 포인트 */
	STORE_NO VARCHAR2(20), /* 지점번호 */
	BRAND_NO NUMBER /* 상호번호 */
);

COMMENT ON TABLE TB_USER IS '사용자';

COMMENT ON COLUMN TB_USER.USER_NO IS '사용자번호';

COMMENT ON COLUMN TB_USER.EMAIL IS '이메일';

COMMENT ON COLUMN TB_USER.USER_PWD IS '비밀번호';

COMMENT ON COLUMN TB_USER.USER_NAME IS '이름';

COMMENT ON COLUMN TB_USER.BIRTHDAY IS '생년월일';

COMMENT ON COLUMN TB_USER.GENDER IS '성별';

COMMENT ON COLUMN TB_USER.PHONE IS '연락처';

COMMENT ON COLUMN TB_USER.ADDRESS IS '주소';

COMMENT ON COLUMN TB_USER.ORIGINAL_FILE_NAME IS '첨부파일기존명';

COMMENT ON COLUMN TB_USER.STORED_FILE_NAME IS '첨부파일변경명';

COMMENT ON COLUMN TB_USER.USER_STATE IS '상태';

COMMENT ON COLUMN TB_USER.JOB IS '직책';

COMMENT ON COLUMN TB_USER.CASH IS '잔고';

COMMENT ON COLUMN TB_USER.POINT IS '포인트';

COMMENT ON COLUMN TB_USER.STORE_NO IS '지점번호';

COMMENT ON COLUMN TB_USER.BRAND_NO IS '상호번호';

ALTER TABLE TB_USER
	ADD
		CONSTRAINT PK_TB_USER
		PRIMARY KEY (
			USER_NO
		);

/* 지점상품 */
CREATE TABLE TB_STORE_PRODUCT (
	STORE_PRODUCT_NO NUMBER NOT NULL, /* 지점상품번호 */
	STORE_NO VARCHAR2(20), /* 지점번호 */
	PRODUCT_NO NUMBER, /* 상품번호 */
	MANUFACTURE_DATE DATE, /* 제조일 */
	QUANTITY NUMBER /* 수량 */
);

COMMENT ON TABLE TB_STORE_PRODUCT IS '지점상품';

COMMENT ON COLUMN TB_STORE_PRODUCT.STORE_PRODUCT_NO IS '지점상품번호';

COMMENT ON COLUMN TB_STORE_PRODUCT.STORE_NO IS '지점번호';

COMMENT ON COLUMN TB_STORE_PRODUCT.PRODUCT_NO IS '상품번호';

COMMENT ON COLUMN TB_STORE_PRODUCT.MANUFACTURE_DATE IS '제조일';

COMMENT ON COLUMN TB_STORE_PRODUCT.QUANTITY IS '수량';

ALTER TABLE TB_STORE_PRODUCT
	ADD
		CONSTRAINT PK_TB_STORE_PRODUCT
		PRIMARY KEY (
			STORE_PRODUCT_NO
		);

/* 할인 */
CREATE TABLE TB_DC_INFO (
	DISCOUNT_NO NUMBER NOT NULL, /* 할인번호 */
	DISCOUNT_NAME VARCHAR2(30) /* 할인명 */
);

COMMENT ON TABLE TB_DC_INFO IS '할인';

COMMENT ON COLUMN TB_DC_INFO.DISCOUNT_NO IS '할인번호';

COMMENT ON COLUMN TB_DC_INFO.DISCOUNT_NAME IS '할인명';

ALTER TABLE TB_DC_INFO
	ADD
		CONSTRAINT PK_TB_DC_INFO
		PRIMARY KEY (
			DISCOUNT_NO
		);

/* 상품 */
CREATE TABLE TB_PRODUCT (
	PRODUCT_NO NUMBER NOT NULL, /* 상품번호 */
	PRODUCT_NAME VARCHAR2(100), /* 상품명 */
	MANUFACTURER VARCHAR2(60), /* 제조사 */
	PRICE NUMBER, /* 가격 */
	EXPIRATION_DATE NUMBER, /* 유통기한 */
	PRODUCT_KIND_NO NUMBER, /* 상품종류번호 */
	BRAND_NO NUMBER, /* 상호번호 */
	ORIGINAL_FILE_NAME VARCHAR2(260), /* 첨부파일기존명 */
	STORED_FILE_NAME VARCHAR2(36), /* 첨부파일변경명 */
	DEL_CHECK VARCHAR2(1) DEFAULT 'N' NOT NULL /* 삭제구분 */
);

COMMENT ON TABLE TB_PRODUCT IS '상품';

COMMENT ON COLUMN TB_PRODUCT.PRODUCT_NO IS '상품번호';

COMMENT ON COLUMN TB_PRODUCT.PRODUCT_NAME IS '상품명';

COMMENT ON COLUMN TB_PRODUCT.MANUFACTURER IS '제조사';

COMMENT ON COLUMN TB_PRODUCT.PRICE IS '가격';

COMMENT ON COLUMN TB_PRODUCT.EXPIRATION_DATE IS '유통기한';

COMMENT ON COLUMN TB_PRODUCT.PRODUCT_KIND_NO IS '상품종류번호';

COMMENT ON COLUMN TB_PRODUCT.BRAND_NO IS '상호번호';

COMMENT ON COLUMN TB_PRODUCT.ORIGINAL_FILE_NAME IS '첨부파일기존명';

COMMENT ON COLUMN TB_PRODUCT.STORED_FILE_NAME IS '첨부파일변경명';

COMMENT ON COLUMN TB_PRODUCT.DEL_CHECK IS '삭제구분';

ALTER TABLE TB_PRODUCT
	ADD
		CONSTRAINT PK_TB_PRODUCT
		PRIMARY KEY (
			PRODUCT_NO
		);

/* 관심목록 */
CREATE TABLE TB_FAVORITE_LIST (
	USER_NO NUMBER NOT NULL, /* 사용자번호 */
	STORE_NO VARCHAR2(20) NOT NULL, /* 지점번호 */
	PRODUCT_NO NUMBER NOT NULL /* 상품번호 */
);

COMMENT ON TABLE TB_FAVORITE_LIST IS '관심목록';

COMMENT ON COLUMN TB_FAVORITE_LIST.USER_NO IS '사용자번호';

COMMENT ON COLUMN TB_FAVORITE_LIST.STORE_NO IS '지점번호';

COMMENT ON COLUMN TB_FAVORITE_LIST.PRODUCT_NO IS '상품번호';

ALTER TABLE TB_FAVORITE_LIST
	ADD
		CONSTRAINT PK_TB_FAVORITE_LIST
		PRIMARY KEY (
			USER_NO,
			STORE_NO,
			PRODUCT_NO
		);

/* 지점 */
CREATE TABLE TB_STORE (
	STORE_NO VARCHAR2(20) NOT NULL, /* 지점번호 */
	STORE_NAME VARCHAR2(50), /* 지점명 */
	LOC_L_CODE VARCHAR2(10), /* 시도코드 */
	LOC_L_NAME VARCHAR2(50), /* 시도명 */
	LOC_M_CODE VARCHAR2(10), /* 구군코드 */
	LOC_M_NAME VARCHAR2(50), /* 구군명 */
	LOC_S_CODE VARCHAR2(50), /* 법정동코드 */
	LOC_S_NAME VARCHAR2(50), /* 법정동명 */
	ROAD_ADDRESS VARCHAR2(300), /* 도로명주소 */
	NUM_ADDRESS VARCHAR2(300), /* 지번주소 */
	LAT VARCHAR2(20), /* 위도 */
	LNG VARCHAR2(20), /* 경도 */
	BRAND_NO NUMBER, /* 상호번호 */
	JOIN_COUNT NUMBER /* 방문 횟수 */
);

COMMENT ON TABLE TB_STORE IS '지점';

COMMENT ON COLUMN TB_STORE.STORE_NO IS '지점번호';

COMMENT ON COLUMN TB_STORE.STORE_NAME IS '지점명';

COMMENT ON COLUMN TB_STORE.LOC_L_CODE IS '시도코드';

COMMENT ON COLUMN TB_STORE.LOC_L_NAME IS '시도명';

COMMENT ON COLUMN TB_STORE.LOC_M_CODE IS '구군코드';

COMMENT ON COLUMN TB_STORE.LOC_M_NAME IS '구군명';

COMMENT ON COLUMN TB_STORE.LOC_S_CODE IS '법정동코드';

COMMENT ON COLUMN TB_STORE.LOC_S_NAME IS '법정동명';

COMMENT ON COLUMN TB_STORE.ROAD_ADDRESS IS '도로명주소';

COMMENT ON COLUMN TB_STORE.NUM_ADDRESS IS '지번주소';

COMMENT ON COLUMN TB_STORE.LAT IS '위도';

COMMENT ON COLUMN TB_STORE.LNG IS '경도';

COMMENT ON COLUMN TB_STORE.BRAND_NO IS '상호번호';

COMMENT ON COLUMN TB_STORE.JOIN_COUNT IS '방문 횟수';

ALTER TABLE TB_STORE
	ADD
		CONSTRAINT PK_TB_STORE
		PRIMARY KEY (
			STORE_NO
		);

/* 이벤트 */
CREATE TABLE TB_EVENT (
	EVENT_NO NUMBER NOT NULL, /* 이벤트번호 */
	TITLE VARCHAR2(300), /* 제목 */
	WRITER NUMBER, /* 작성자 */
	CONTENTS VARCHAR2(3000), /* 내용 */
	START_DATE DATE, /* 시작일 */
	END_DATE DATE, /* 종료일 */
	JOIN_LIMIT NUMBER, /* 참여제한횟수 */
	READCOUNT NUMBER, /* 조회수 */
	ORIGINAL_FILE_NAME VARCHAR2(260), /* 첨부파일기존명 */
	STORED_FILE_NAME VARCHAR2(36), /* 첨부파일변경명 */
	DEL_CHECK VARCHAR2(1) DEFAULT 'N' NOT NULL /* 삭제구분 */
);

COMMENT ON TABLE TB_EVENT IS '이벤트';

COMMENT ON COLUMN TB_EVENT.EVENT_NO IS '이벤트번호';

COMMENT ON COLUMN TB_EVENT.TITLE IS '제목';

COMMENT ON COLUMN TB_EVENT.WRITER IS '작성자';

COMMENT ON COLUMN TB_EVENT.CONTENTS IS '내용';

COMMENT ON COLUMN TB_EVENT.START_DATE IS '시작일';

COMMENT ON COLUMN TB_EVENT.END_DATE IS '종료일';

COMMENT ON COLUMN TB_EVENT.JOIN_LIMIT IS '참여제한횟수';

COMMENT ON COLUMN TB_EVENT.READCOUNT IS '조회수';

COMMENT ON COLUMN TB_EVENT.ORIGINAL_FILE_NAME IS '첨부파일기존명';

COMMENT ON COLUMN TB_EVENT.STORED_FILE_NAME IS '첨부파일변경명';

COMMENT ON COLUMN TB_EVENT.DEL_CHECK IS '삭제구분';

ALTER TABLE TB_EVENT
	ADD
		CONSTRAINT PK_TB_EVENT
		PRIMARY KEY (
			EVENT_NO
		);

/* 구매 */
CREATE TABLE TB_PURCHASE (
	PURCHASE_NO NUMBER NOT NULL, /* 구매번호 */
	USER_NO NUMBER, /* 사용자번호 */
	STORE_PRODUCT_NO NUMBER, /* 지점상품번호 */
	PURCHASE_QUANTITY NUMBER, /* 구매수량 */
	CALCULATED_PRICE NUMBER, /* 계산가격 */
	USING_POINT NUMBER, /* 사용포인트 */
	ACCUMULATE_POINT NUMBER, /* 적립포인트 */
	PURCHASE_DATE DATE /* 구매날짜 */
);

COMMENT ON TABLE TB_PURCHASE IS '구매';

COMMENT ON COLUMN TB_PURCHASE.PURCHASE_NO IS '구매번호';

COMMENT ON COLUMN TB_PURCHASE.USER_NO IS '사용자번호';

COMMENT ON COLUMN TB_PURCHASE.STORE_PRODUCT_NO IS '지점상품번호';

COMMENT ON COLUMN TB_PURCHASE.PURCHASE_QUANTITY IS '구매수량';

COMMENT ON COLUMN TB_PURCHASE.CALCULATED_PRICE IS '계산가격';

COMMENT ON COLUMN TB_PURCHASE.USING_POINT IS '사용포인트';

COMMENT ON COLUMN TB_PURCHASE.ACCUMULATE_POINT IS '적립포인트';

COMMENT ON COLUMN TB_PURCHASE.PURCHASE_DATE IS '구매날짜';

ALTER TABLE TB_PURCHASE
	ADD
		CONSTRAINT PK_TB_PURCHASE
		PRIMARY KEY (
			PURCHASE_NO
		);

/* 이벤트참여 */
CREATE TABLE TB_EVENT_JOIN (
	USER_NO NUMBER NOT NULL, /* 사용자번호 */
	EVENT_NO NUMBER NOT NULL /* 이벤트번호 */
);

COMMENT ON TABLE TB_EVENT_JOIN IS '이벤트참여';

COMMENT ON COLUMN TB_EVENT_JOIN.USER_NO IS '사용자번호';

COMMENT ON COLUMN TB_EVENT_JOIN.EVENT_NO IS '이벤트번호';

ALTER TABLE TB_EVENT_JOIN
	ADD
		CONSTRAINT PK_TB_EVENT_JOIN
		PRIMARY KEY (
			USER_NO,
			EVENT_NO
		);

/* 할인상품 */
CREATE TABLE TB_DC_PRODUCT (
	STORE_NO VARCHAR2(20) NOT NULL, /* 지점번호 */
	PRODUCT_NO NUMBER NOT NULL, /* 상품번호 */
	DISCOUNT_NO NUMBER, /* 할인번호 */
	DISCOUNT_INFO VARCHAR2(30) /* 할인정보 */
);

COMMENT ON TABLE TB_DC_PRODUCT IS '할인상품';

COMMENT ON COLUMN TB_DC_PRODUCT.STORE_NO IS '지점번호';

COMMENT ON COLUMN TB_DC_PRODUCT.PRODUCT_NO IS '상품번호';

COMMENT ON COLUMN TB_DC_PRODUCT.DISCOUNT_NO IS '할인번호';

COMMENT ON COLUMN TB_DC_PRODUCT.DISCOUNT_INFO IS '할인정보';

ALTER TABLE TB_DC_PRODUCT
	ADD
		CONSTRAINT PK_TB_DC_PRODUCT
		PRIMARY KEY (
			STORE_NO,
			PRODUCT_NO
		);

/* 자유게시판 */
CREATE TABLE TB_BOARD (
	BOARD_NO NUMBER NOT NULL, /* 글번호 */
	TITLE VARCHAR2(300), /* 제목 */
	WRITER NUMBER, /* 작성자 */
	CONTENTS VARCHAR2(3000), /* 내용 */
	WRITE_DATE DATE, /* 작성일 */
	READCOUNT NUMBER, /* 조회수 */
	ORIGINAL_FILE_NAME VARCHAR2(260), /* 첨부파일기존명 */
	STORED_FILE_NAME VARCHAR2(36), /* 첨부파일변경명 */
	DEL_CHECK VARCHAR2(1) DEFAULT 'N' NOT NULL /* 삭제구분 */
);

COMMENT ON TABLE TB_BOARD IS '자유게시판';

COMMENT ON COLUMN TB_BOARD.BOARD_NO IS '글번호';

COMMENT ON COLUMN TB_BOARD.TITLE IS '제목';

COMMENT ON COLUMN TB_BOARD.WRITER IS '작성자';

COMMENT ON COLUMN TB_BOARD.CONTENTS IS '내용';

COMMENT ON COLUMN TB_BOARD.WRITE_DATE IS '작성일';

COMMENT ON COLUMN TB_BOARD.READCOUNT IS '조회수';

COMMENT ON COLUMN TB_BOARD.ORIGINAL_FILE_NAME IS '첨부파일기존명';

COMMENT ON COLUMN TB_BOARD.STORED_FILE_NAME IS '첨부파일변경명';

COMMENT ON COLUMN TB_BOARD.DEL_CHECK IS '삭제구분';

ALTER TABLE TB_BOARD
	ADD
		CONSTRAINT PK_TB_BOARD
		PRIMARY KEY (
			BOARD_NO
		);

/* 상품종류 */
CREATE TABLE TB_PRODUCT_KIND (
	PRODUCT_KIND_NO NUMBER NOT NULL, /* 상품종류번호 */
	PRODUCT_KIND_NAME VARCHAR2(30) /* 상품종류명 */
);

COMMENT ON TABLE TB_PRODUCT_KIND IS '상품종류';

COMMENT ON COLUMN TB_PRODUCT_KIND.PRODUCT_KIND_NO IS '상품종류번호';

COMMENT ON COLUMN TB_PRODUCT_KIND.PRODUCT_KIND_NAME IS '상품종류명';

ALTER TABLE TB_PRODUCT_KIND
	ADD
		CONSTRAINT PK_TB_PRODUCT_KIND
		PRIMARY KEY (
			PRODUCT_KIND_NO
		);

/* 기프티콘 */
CREATE TABLE TB_GIFTICON (
	GIFTICON_NO NUMBER NOT NULL, /* 기프티콘번호 */
	PURCHASE_NO NUMBER, /* 구매번호 */
	BARCODE_IMG_NAME VARCHAR2(36), /* 바코드이미지명 */
	IS_USE VARCHAR2(1) DEFAULT 'N' NOT NULL /* 사용여부 */
);

COMMENT ON TABLE TB_GIFTICON IS '기프티콘';

COMMENT ON COLUMN TB_GIFTICON.GIFTICON_NO IS '기프티콘번호';

COMMENT ON COLUMN TB_GIFTICON.PURCHASE_NO IS '구매번호';

COMMENT ON COLUMN TB_GIFTICON.BARCODE_IMG_NAME IS '바코드이미지명';

COMMENT ON COLUMN TB_GIFTICON.IS_USE IS '사용여부';

ALTER TABLE TB_GIFTICON
	ADD
		CONSTRAINT PK_TB_GIFTICON
		PRIMARY KEY (
			GIFTICON_NO
		);

/* 이벤트결과 */
CREATE TABLE TB_EVENT_RESULT (
	EVENT_RESULT_NO NUMBER NOT NULL, /* 글번호 */
	EVENT_NO NUMBER NOT NULL, /* 이벤트번호 */
	TITLE VARCHAR2(300), /* 제목 */
	WRITER NUMBER, /* 작성자 */
	CONTENTS VARCHAR2(3000), /* 내용 */
	WRITE_DATE DATE, /* 작성일 */
	READCOUNT NUMBER, /* 조회수 */
	ORIGINAL_FILE_NAME VARCHAR2(260), /* 첨부파일기존명 */
	STORED_FILE_NAME VARCHAR2(36), /* 첨부파일변경명 */
	DEL_CHECK VARCHAR2(1) DEFAULT 'N' NOT NULL /* 삭제구분 */
);

COMMENT ON TABLE TB_EVENT_RESULT IS '이벤트결과';

COMMENT ON COLUMN TB_EVENT_RESULT.EVENT_RESULT_NO IS '글번호';

COMMENT ON COLUMN TB_EVENT_RESULT.EVENT_NO IS '이벤트번호';

COMMENT ON COLUMN TB_EVENT_RESULT.TITLE IS '제목';

COMMENT ON COLUMN TB_EVENT_RESULT.WRITER IS '작성자';

COMMENT ON COLUMN TB_EVENT_RESULT.CONTENTS IS '내용';

COMMENT ON COLUMN TB_EVENT_RESULT.WRITE_DATE IS '작성일';

COMMENT ON COLUMN TB_EVENT_RESULT.READCOUNT IS '조회수';

COMMENT ON COLUMN TB_EVENT_RESULT.ORIGINAL_FILE_NAME IS '첨부파일기존명';

COMMENT ON COLUMN TB_EVENT_RESULT.STORED_FILE_NAME IS '첨부파일변경명';

COMMENT ON COLUMN TB_EVENT_RESULT.DEL_CHECK IS '삭제구분';

ALTER TABLE TB_EVENT_RESULT
	ADD
		CONSTRAINT PK_TB_EVENT_RESULT
		PRIMARY KEY (
			EVENT_RESULT_NO
		);

/* 고객센터댓글 */
CREATE TABLE TB_SERVICE_CENTER_COMMENT (
	SERVICE_COMMENT_NO NUMBER NOT NULL, /* 댓글번호 */
	SERVICE_NO NUMBER NOT NULL, /* 문의번호 */
	WRITER NUMBER, /* 작성자 */
	CONTENTS VARCHAR2(3000), /* 내용 */
	WRITE_DATE DATE, /* 작성일 */
	DEL_CHECK VARCHAR2(1) DEFAULT 'N' NOT NULL /* 삭제구분 */
);

COMMENT ON TABLE TB_SERVICE_CENTER_COMMENT IS '고객센터댓글';

COMMENT ON COLUMN TB_SERVICE_CENTER_COMMENT.SERVICE_COMMENT_NO IS '댓글번호';

COMMENT ON COLUMN TB_SERVICE_CENTER_COMMENT.SERVICE_NO IS '문의번호';

COMMENT ON COLUMN TB_SERVICE_CENTER_COMMENT.WRITER IS '작성자';

COMMENT ON COLUMN TB_SERVICE_CENTER_COMMENT.CONTENTS IS '내용';

COMMENT ON COLUMN TB_SERVICE_CENTER_COMMENT.WRITE_DATE IS '작성일';

COMMENT ON COLUMN TB_SERVICE_CENTER_COMMENT.DEL_CHECK IS '삭제구분';

ALTER TABLE TB_SERVICE_CENTER_COMMENT
	ADD
		CONSTRAINT PK_TB_SERVICE_CENTER_COMMENT
		PRIMARY KEY (
			SERVICE_COMMENT_NO,
			SERVICE_NO
		);

/* 상호 */
CREATE TABLE TB_BRAND (
	BRAND_NO NUMBER NOT NULL, /* 상호번호 */
	BRAND_NAME VARCHAR2(30) /* 상호명 */
);

COMMENT ON TABLE TB_BRAND IS '상호';

COMMENT ON COLUMN TB_BRAND.BRAND_NO IS '상호번호';

COMMENT ON COLUMN TB_BRAND.BRAND_NAME IS '상호명';

ALTER TABLE TB_BRAND
	ADD
		CONSTRAINT PK_TB_BRAND
		PRIMARY KEY (
			BRAND_NO
		);

ALTER TABLE TB_SERVICE_CENTER
	ADD
		CONSTRAINT FK_TB_USER_TO_TB_SRVC_CNTR
		FOREIGN KEY (
			WRITER
		)
		REFERENCES TB_USER (
			USER_NO
		);

ALTER TABLE TB_USER
	ADD
		CONSTRAINT FK_TB_STORE_TO_TB_USER
		FOREIGN KEY (
			STORE_NO
		)
		REFERENCES TB_STORE (
			STORE_NO
		);

ALTER TABLE TB_USER
	ADD
		CONSTRAINT FK_TB_BRAND_TO_TB_USER
		FOREIGN KEY (
			BRAND_NO
		)
		REFERENCES TB_BRAND (
			BRAND_NO
		);

ALTER TABLE TB_STORE_PRODUCT
	ADD
		CONSTRAINT FK_TB_PRDCT_TO_TB_STR_PRDCT
		FOREIGN KEY (
			PRODUCT_NO
		)
		REFERENCES TB_PRODUCT (
			PRODUCT_NO
		);

ALTER TABLE TB_STORE_PRODUCT
	ADD
		CONSTRAINT FK_TB_STORE_TO_TB_STR_PRDCT
		FOREIGN KEY (
			STORE_NO
		)
		REFERENCES TB_STORE (
			STORE_NO
		);

ALTER TABLE TB_PRODUCT
	ADD
		CONSTRAINT FK_TB_BRAND_TO_TB_PRODUCT
		FOREIGN KEY (
			BRAND_NO
		)
		REFERENCES TB_BRAND (
			BRAND_NO
		);

ALTER TABLE TB_PRODUCT
	ADD
		CONSTRAINT FK_TB_PRDT_KIND_TO_TB_PRDT
		FOREIGN KEY (
			PRODUCT_KIND_NO
		)
		REFERENCES TB_PRODUCT_KIND (
			PRODUCT_KIND_NO
		);

ALTER TABLE TB_FAVORITE_LIST
	ADD
		CONSTRAINT FK_TB_USER_TO_TB_FAVORITE_LIST
		FOREIGN KEY (
			USER_NO
		)
		REFERENCES TB_USER (
			USER_NO
		);

ALTER TABLE TB_FAVORITE_LIST
	ADD
		CONSTRAINT FK_TB_STORE_TO_TB_FVRT_LIST
		FOREIGN KEY (
			STORE_NO
		)
		REFERENCES TB_STORE (
			STORE_NO
		);

ALTER TABLE TB_FAVORITE_LIST
	ADD
		CONSTRAINT FK_TB_PRDCT_TO_TB_FVRT_LST
		FOREIGN KEY (
			PRODUCT_NO
		)
		REFERENCES TB_PRODUCT (
			PRODUCT_NO
		);

ALTER TABLE TB_STORE
	ADD
		CONSTRAINT FK_TB_BRAND_TO_TB_STORE
		FOREIGN KEY (
			BRAND_NO
		)
		REFERENCES TB_BRAND (
			BRAND_NO
		);

ALTER TABLE TB_EVENT
	ADD
		CONSTRAINT FK_TB_USER_TO_TB_EVENT
		FOREIGN KEY (
			WRITER
		)
		REFERENCES TB_USER (
			USER_NO
		);

ALTER TABLE TB_PURCHASE
	ADD
		CONSTRAINT FK_TB_USER_TO_TB_PURCHASE
		FOREIGN KEY (
			USER_NO
		)
		REFERENCES TB_USER (
			USER_NO
		);

ALTER TABLE TB_PURCHASE
	ADD
		CONSTRAINT FK_TB_STR_PRDCT_TO_TB_PRCHS
		FOREIGN KEY (
			STORE_PRODUCT_NO
		)
		REFERENCES TB_STORE_PRODUCT (
			STORE_PRODUCT_NO
		);

ALTER TABLE TB_EVENT_JOIN
	ADD
		CONSTRAINT FK_TB_USER_TO_TB_EVENT_JOIN
		FOREIGN KEY (
			USER_NO
		)
		REFERENCES TB_USER (
			USER_NO
		);

ALTER TABLE TB_EVENT_JOIN
	ADD
		CONSTRAINT FK_TB_EVENT_TO_TB_EVENT_JOIN
		FOREIGN KEY (
			EVENT_NO
		)
		REFERENCES TB_EVENT (
			EVENT_NO
		);

ALTER TABLE TB_DC_PRODUCT
	ADD
		CONSTRAINT FK_TB_PRODUCT_TO_TB_DC_PRODUCT
		FOREIGN KEY (
			PRODUCT_NO
		)
		REFERENCES TB_PRODUCT (
			PRODUCT_NO
		);

ALTER TABLE TB_DC_PRODUCT
	ADD
		CONSTRAINT FK_TB_STORE_TO_TB_DC_PRODUCT
		FOREIGN KEY (
			STORE_NO
		)
		REFERENCES TB_STORE (
			STORE_NO
		);

ALTER TABLE TB_DC_PRODUCT
	ADD
		CONSTRAINT FK_TB_DC_INFO_TO_TB_DC_PRODUCT
		FOREIGN KEY (
			DISCOUNT_NO
		)
		REFERENCES TB_DC_INFO (
			DISCOUNT_NO
		);

ALTER TABLE TB_BOARD
	ADD
		CONSTRAINT FK_TB_USER_TO_TB_BOARD
		FOREIGN KEY (
			WRITER
		)
		REFERENCES TB_USER (
			USER_NO
		);

ALTER TABLE TB_GIFTICON
	ADD
		CONSTRAINT FK_TB_PURCHASE_TO_TB_GIFTICON
		FOREIGN KEY (
			PURCHASE_NO
		)
		REFERENCES TB_PURCHASE (
			PURCHASE_NO
		);

ALTER TABLE TB_EVENT_RESULT
	ADD
		CONSTRAINT FK_TB_EVENT_TO_TB_EVENT_RESULT
		FOREIGN KEY (
			EVENT_NO
		)
		REFERENCES TB_EVENT (
			EVENT_NO
		);

ALTER TABLE TB_EVENT_RESULT
	ADD
		CONSTRAINT FK_TB_USER_TO_TB_EVENT_RESULT
		FOREIGN KEY (
			WRITER
		)
		REFERENCES TB_USER (
			USER_NO
		);

ALTER TABLE TB_SERVICE_CENTER_COMMENT
	ADD
		CONSTRAINT FK_TB_CNTR_TO_TB_CMNT
		FOREIGN KEY (
			SERVICE_NO
		)
		REFERENCES TB_SERVICE_CENTER (
			SERVICE_NO
		);

ALTER TABLE TB_SERVICE_CENTER_COMMENT
	ADD
		CONSTRAINT FK_TB_USR_TO_TB_CNTR_CMNT
		FOREIGN KEY (
			WRITER
		)
		REFERENCES TB_USER (
			USER_NO
		);
    
        
/* Sequence */

--SEQ_BOARD_NO
CREATE SEQUENCE SEQ_BOARD_NO
START WITH 1
INCREMENT BY 1
NOMAXVALUE 
CACHE 20;

--SEQ_EVENT_NO
CREATE SEQUENCE SEQ_EVENT_NO
START WITH 1
INCREMENT BY 1
NOMAXVALUE 
CACHE 20;

--SEQ_EVENT_RESULT_NO
CREATE SEQUENCE SEQ_EVENT_RESULT_NO
START WITH 1
INCREMENT BY 1
NOMAXVALUE 
CACHE 20;

--SEQ_GIFTICON_NO
CREATE SEQUENCE SEQ_GIFTICON_NO
START WITH 1
INCREMENT BY 1
NOMAXVALUE 
CACHE 20;

--SEQ_PRODUCT_NO
CREATE SEQUENCE SEQ_PRODUCT_NO
START WITH 1
INCREMENT BY 1
NOMAXVALUE 
CACHE 20;

--SEQ_PURCHASE_NO
CREATE SEQUENCE SEQ_PURCHASE_NO
START WITH 1
INCREMENT BY 1
NOMAXVALUE 
CACHE 20;

--SEQ_SERVICE_NO
CREATE SEQUENCE SEQ_SERVICE_NO
START WITH 1
INCREMENT BY 1
NOMAXVALUE 
CACHE 20;

--SEQ_STORE_PRODUCT_NO
CREATE SEQUENCE SEQ_STORE_PRODUCT_NO
START WITH 1
INCREMENT BY 1
NOMAXVALUE 
CACHE 20;

--SEQ_USER_NO
CREATE SEQUENCE SEQ_USER_NO
START WITH 1
INCREMENT BY 1
NOMAXVALUE 
CACHE 20;

COMMIT;