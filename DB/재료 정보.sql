-- 테이블 생성 SQL - tbl_ingredient
CREATE TABLE tbl_ingredient
(
    `ingre_idx`   INT UNSIGNED     NOT NULL    AUTO_INCREMENT COMMENT '재료 식별자', 
    `ingre_name`  VARCHAR(50)      NOT NULL    COMMENT '재료 이름', 
    `ingre_type`  VARCHAR(50)      NOT NULL    COMMENT '재료 타입', 
    `ingre_info`  TEXT             NOT NULL    COMMENT '재료 설명', 
    `ingre_img`   VARCHAR(1000)    NOT NULL    COMMENT '재료 사진', 
     PRIMARY KEY (ingre_idx)
);

-- 테이블 Comment 설정 SQL - tbl_ingredient
ALTER TABLE tbl_ingredient COMMENT '재료 정보';
