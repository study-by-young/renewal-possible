package com.yedam.possable.app.community.course.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class CourseBoardVO {
    private Long seq;
    private String title;
    private String writer;
    private String content;
    private Long views;
    private Long likes;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date startDate;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date endDate;
    private Long people;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date genDate;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date uptDate;
}
