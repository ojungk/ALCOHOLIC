-- 테이블 생성 SQL - tbl_user_cocktail_likes
CREATE TABLE tbl_user_cocktail_likes
(
    `user_like_idx`  INT UNSIGNED    NOT NULL    AUTO_INCREMENT COMMENT '좋아요 식별자', 
    `user_id`        VARCHAR(30)     NOT NULL    COMMENT '사용자 아이디', 
    `user_ct_idx`    INT UNSIGNED    NOT NULL    COMMENT '사용자 칵테일 식별자', 
    `created_at`     TIMESTAMP       NOT NULL    DEFAULT CURRENT_TIMESTAMP COMMENT '등록 일자', 
     PRIMARY KEY (user_like_idx)
);

-- 테이블 Comment 설정 SQL - tbl_user_cocktail_likes
ALTER TABLE tbl_user_cocktail_likes COMMENT '사용자 칵테일 좋아요(찜)';

-- Foreign Key 설정 SQL - tbl_user_cocktail_likes(user_ct_idx) -> tbl_user_cocktail(user_ct_idx)
ALTER TABLE tbl_user_cocktail_likes
    ADD CONSTRAINT FK_tbl_user_cocktail_likes_user_ct_idx_tbl_user_cocktail_user_ct FOREIGN KEY (user_ct_idx)
        REFERENCES tbl_user_cocktail (user_ct_idx) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- Foreign Key 설정 SQL - tbl_user_cocktail_likes(user_id) -> tbl_user(user_id)
ALTER TABLE tbl_user_cocktail_likes
    ADD CONSTRAINT FK_tbl_user_cocktail_likes_user_id_tbl_user_user_id FOREIGN KEY (user_id)
        REFERENCES tbl_user (user_id) ON DELETE RESTRICT ON UPDATE RESTRICT;
