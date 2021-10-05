package com.yedam.possable.app.car.domain;

import com.yedam.possable.app.company.domain.CompanyVO;
import lombok.Data;

import java.util.Date;

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
}
