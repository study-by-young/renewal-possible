package com.yedam.possable.app.community.qna.domain;

import lombok.Data;

import java.util.Date;

@Data
public class QnaVO {
    private Long seq;
    private String title;
    private String content;
    private String writer;
    private String status;
    private Date genDate;
    private Date uptDate;
    
    // 답변 수 카운트
    private Long answerCnt;
}
