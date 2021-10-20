package com.yedam.possable.app.community.course.domain;

import lombok.Data;

import java.util.Date;

@Data
public class CourseBoardCmtVO {
    private Long seq;
    private String content;
    private String writer;
    private Date genDate;
    private Date uptDate;
    private Long courseSeq;

    private CourseBoardVO board;
}
