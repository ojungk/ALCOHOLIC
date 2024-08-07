-- 테이블 생성 SQL - tbl_user_cocktail
CREATE TABLE tbl_user_cocktail
(
    `user_ct_idx`         INT UNSIGNED     NOT NULL    AUTO_INCREMENT COMMENT '사용자 칵테일 식별자', 
    `user_id`             VARCHAR(30)      NOT NULL    COMMENT '사용자 아이디', 
    `user_cocktail_name`  VARCHAR(50)      NOT NULL    COMMENT '칵테일 이름', 
    `user_cocktail_img`   VARCHAR(1000)    NULL        COMMENT '칵테일 사진', 
    PRIMARY KEY (user_ct_idx)
);

-- 테이블 Comment 설정 SQL - tbl_user_cocktail
ALTER TABLE tbl_user_cocktail COMMENT '사용자 칵테일';

-- Foreign Key 설정 SQL - tbl_user_cocktail(user_id) -> tbl_user(user_id)
ALTER TABLE tbl_user_cocktail
    ADD CONSTRAINT FK_tbl_user_cocktail_user_id_tbl_user_user_id FOREIGN KEY (user_id)
        REFERENCES tbl_user (user_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

