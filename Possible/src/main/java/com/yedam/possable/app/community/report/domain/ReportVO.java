package com.yedam.possable.app.community.report.domain;

import lombok.Data;

import java.util.Date;

@Data
public class ReportVO {
    private Long seq;
    private String writer;
    private Long target;
    private String reason;
    private String code;
    private Date genDate;
    private String reporter;
}
