package com.yedam.possable.app.community.course.domain;

import lombok.Data;

import java.util.Date;

@Data
public class CourseBoardVO {
    private Long seq;
    private String title;
    private String writer;
    private String content;
    private Long views;
    private Long likes;
    private Date startDate;
    private Date endDate;
    private Long people;
    private Date genDate;
    private Date uptDate;
}
