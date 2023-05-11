package com.possible.community.notice_finish_delete.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class NoticeVO {
    private Long seq;
    private String title;
    private String content;
    private String writer;
    private Long views;
    private Date genDate;
    private Date uptDate;
    
    List<NoticeFileVO> attachList;
}
