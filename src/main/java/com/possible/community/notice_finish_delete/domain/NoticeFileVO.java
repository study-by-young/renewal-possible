package com.possible.community.notice_finish_delete.domain;

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
    private String uploadPath;

    private Long noticeSeq;
}
