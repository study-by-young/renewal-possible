package com.yedam.possable.app.community.tour.domain;

import lombok.Data;

import java.util.Date;

@Data
public class TourVO {
    private Long seq;
    private Long areaId;
    private Long areaType;
    private String addr;
    private String thumbnail;
    private String tourPage;
    private String name;
    private String content;
    private String img1;
    private String img2;
    private String img3;
    private String img4;
    private String img5;
    private Date genDate;
    private Date uptDate;
}
