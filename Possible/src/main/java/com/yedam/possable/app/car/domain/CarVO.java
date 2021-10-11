package com.yedam.possable.app.car.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class CarVO {
    private Long seq;
    private String carNum;
    private String brand;
    private String segment;
    private String model;
    private String trim;
    private String color;
    private Long year;
    private String fuel;
    private Long passenger;
    private String mission;
    private Long trunk;
    private Long door;
    private Long kmpl;
    private Long price;
    private String status;
    private String img1;
    private String img2;
    private String img3;
    private Date genDate;
    private Date uptDate;

    private Long cmpnSeq;
    
    private List<CarVO> modelList; // 해당하는 모델의 차량을 보유하고 있는 업체의 시퀀스를 출력하기 위해 추가
    private String name; // getCarByModel() 에서 COMPANY 테이블과 JOIN해서 추가된 컬럼
}
