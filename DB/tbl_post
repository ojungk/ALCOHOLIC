-- 테이블 생성 SQL - tbl_post
CREATE TABLE tbl_post
(
    `post_idx`      INT UNSIGNED     NOT NULL    AUTO_INCREMENT COMMENT '포스트 식별자', 
    `post_title`    VARCHAR(1500)    NOT NULL    COMMENT '포스트 제목', 
    `post_content`  TEXT             NOT NULL    COMMENT '포스트 내용', 
    `post_img`      VARCHAR(1000)    NOT NULL    COMMENT '포스트 사진', 
    `post_views`    INT              NOT NULL    DEFAULT 0 COMMENT '포스트 조회수', 
    `created_at`    TIMESTAMP        NOT NULL    DEFAULT CURRENT_TIMESTAMP COMMENT '포스트 작성일자', 
    `user_id`       VARCHAR(30)      NOT NULL    COMMENT '포스트 작성자', 
     PRIMARY KEY (post_idx)
);

-- 테이블 Comment 설정 SQL - tbl_post
ALTER TABLE tbl_post COMMENT '포스트';
