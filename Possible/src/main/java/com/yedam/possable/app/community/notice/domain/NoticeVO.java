package com.yedam.possable.app.community.notice.domain;

import lombok.Data;

import java.util.Date;

@Data
public class NoticeVO {
    private Long seq;
    private String title;
    private String content;
    private String writer;
    private Long views;
    private Date genDate;
    private Date uptDate;
}
