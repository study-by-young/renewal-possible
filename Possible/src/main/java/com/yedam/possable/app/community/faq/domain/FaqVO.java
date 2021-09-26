package com.yedam.possable.app.community.faq.domain;

import lombok.Data;

import java.util.Date;

@Data
public class FaqVO {
    private Long seq;
    private String title;
    private String content;
    private Date genDate;
    private Date uptDate;
}
