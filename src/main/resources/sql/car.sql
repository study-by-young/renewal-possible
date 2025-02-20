-- 차량 테이블 생성
CREATE TABLE CAR(
  id INT NOT NULL AUTO_INCREMENT,
  brand VARCHAR(45) DEFAULT NULL COMMENT '브랜드',
  model VARCHAR(45) DEFAULT NULL COMMENT '모델',
  color VARCHAR(45) DEFAULT NULL COMMENT '색상',
  year VARCHAR(45) DEFAULT NULL COMMENT '연식',
  fuel VARCHAR(45) DEFAULT NULL COMMENT '연료',
  passenger VARCHAR(45) DEFAULT NULL COMMENT '인원수',
  price VARCHAR(45) DEFAULT NULL COMMENT '가격',
  status VARCHAR(45) DEFAULT NULL,
  car_number VARCHAR(45) DEFAULT NULL COMMENT '차량번호',
  reg_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  upt_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  company_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (company_id) REFERENCES COMPANY (id) ON DELETE RESTRICT ON UPDATE RESTRICT
) AUTO_INCREMENT = 1000000000;