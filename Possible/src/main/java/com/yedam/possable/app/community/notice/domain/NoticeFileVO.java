package com.yedam.possable.app.community.notice.domain;

import lombok.Data;

import java.util.Date;

@Data
public class NoticeFileVO {
    private Long seq;
    private Long fileNo;
    private String name;
    private String orgName;
    private String fileType;
    private Long fileSize;
    private Date genDate;
    private Date uptDate;

    private Long noticeSeq;
}
