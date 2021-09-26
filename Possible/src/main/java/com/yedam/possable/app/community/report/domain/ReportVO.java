package com.yedam.possable.app.community.report.domain;

import lombok.Data;

import java.util.Date;

@Data
public class ReportVO {
    private Long seq;
    private String title;
    private String content;
    private String writer;
    private String target;
    private String code;
    private Date genDate;
    private Date uptDate;
}
