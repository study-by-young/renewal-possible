package com.yedam.possable.app.community.course.domain;

import lombok.Data;

@Data
public class CourseVO {
    private Long seq;
    private Long placeNo;
    private Long areaId;
    private String thumbnail;
    private String addr;
    private Long areaType;
    private String tourPage;
    private String name;
    private String content;
    private String img1;
    private String img2;
    private String img3;

    private CourseBoardVO courseBoardVO;
}
