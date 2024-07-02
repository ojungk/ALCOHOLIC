-- 테이블 생성 SQL - tbl_post_comment
CREATE TABLE tbl_post_comment
(
    `cmt_idx`      INT UNSIGNED    NOT NULL    AUTO_INCREMENT COMMENT '댓글 식별자', 
    `post_idx`     INT UNSIGNED    NOT NULL    COMMENT '포스트 식별자', 
    `cmt_content`  VARCHAR(900)    NOT NULL    COMMENT '댓글 내용', 
    `created_at`   TIMESTAMP       NOT NULL    DEFAULT CURRENT_TIMESTAMP COMMENT '댓글 작성일자', 
    `user_id`      VARCHAR(30)     NOT NULL    COMMENT '댓글 작성자', 
     PRIMARY KEY (cmt_idx)
);

-- 테이블 Comment 설정 SQL - tbl_post_comment
ALTER TABLE tbl_post_comment COMMENT '포스트 댓글';

-- Foreign Key 설정 SQL - tbl_post_comment(post_idx) -> tbl_post(post_idx)
ALTER TABLE tbl_post_comment
    ADD CONSTRAINT FK_tbl_post_comment_post_idx_tbl_post_post_idx FOREIGN KEY (post_idx)
        REFERENCES tbl_post (post_idx) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 설정 SQL - tbl_post_comment(user_id) -> tbl_user(user_id)
ALTER TABLE tbl_post_comment
    ADD CONSTRAINT FK_tbl_post_comment_user_id_tbl_user_user_id FOREIGN KEY (user_id)
        REFERENCES tbl_user (user_id) ON DELETE RESTRICT ON UPDATE RESTRICT;
