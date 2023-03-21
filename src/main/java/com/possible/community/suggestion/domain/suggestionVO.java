package com.yedam.possable.app.community.suggestion.domain;

import lombok.Data;

import java.util.Date;

@Data
public class suggestionVO {
    private Long seq;
    private String title;
    private String content;
    private String code;
    private Date genDate;
    private Date uptDate;
}
