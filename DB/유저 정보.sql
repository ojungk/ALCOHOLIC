    -- 테이블 생성 SQL - tbl_user
    CREATE TABLE tbl_user
    (
        `user_id`     VARCHAR(30)    NOT NULL    COMMENT '유저 아이디', 
        `user_pw`     VARCHAR(30)    NOT NULL    COMMENT '유저 비밀번호', 
        `user_nick`   VARCHAR(30)    NOT NULL    COMMENT '유저 닉네임', 
        `user_phone`  VARCHAR(20)    NOT NULL    COMMENT '유저 핸드폰', 
        `joined_at`   TIMESTAMP      NOT NULL    DEFAULT CURRENT_TIMESTAMP COMMENT '유저 가입일자', 
        `user_type`   VARCHAR(10)    NOT NULL    COMMENT '유저 유형', 
         PRIMARY KEY (user_id)
    );

    -- 테이블 Comment 설정 SQL - tbl_user
    ALTER TABLE tbl_user COMMENT '유저정보';

    -- Unique Index 설정 SQL - tbl_user(user_nick, user_phone)
    CREATE UNIQUE INDEX UQ_tbl_user_1
        ON tbl_user(user_nick, user_phone);--


