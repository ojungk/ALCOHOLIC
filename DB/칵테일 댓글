-- 테이블 생성 SQL - tbl_cocktail_comment
CREATE TABLE tbl_cocktail_comment
(
    `cmt_idx`      INT UNSIGNED    NOT NULL    AUTO_INCREMENT COMMENT '댓글 식별자', 
    `ct_idx`       INT UNSIGNED    NOT NULL    COMMENT '사용자 칵테일 식별자', 
    `cmt_content`  VARCHAR(900)    NOT NULL    COMMENT '댓글 내용', 
    `created_at`   TIMESTAMP       NOT NULL    DEFAULT CURRENT_TIMESTAMP COMMENT '댓글 작성일자', 
    `user_id`      VARCHAR(30)     NOT NULL    COMMENT '댓글 작성자', 
     PRIMARY KEY (cmt_idx)
);

-- 테이블 Comment 설정 SQL - tbl_cocktail_comment
ALTER TABLE tbl_cocktail_comment COMMENT '칵테일 댓글';

-- Foreign Key 설정 SQL - tbl_cocktail_comment(ct_idx) -> tbl_cocktail(ct_idx)
ALTER TABLE tbl_cocktail_comment
    ADD CONSTRAINT FK_tbl_cocktail_comment_ct_idx_tbl_cocktail_ct_idx FOREIGN KEY (ct_idx)
        REFERENCES tbl_cocktail (ct_idx) ON DELETE RESTRICT ON UPDATE RESTRICT;
