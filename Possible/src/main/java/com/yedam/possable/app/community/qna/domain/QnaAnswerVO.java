package com.yedam.possable.app.community.qna.domain;

import lombok.Data;

import java.util.Date;

@Data
public class QnaAnswerVO {
    private Long seq;
    private String title;
    private String content;
    private String writer;
    private Date genDate;
    private Date uptDate;

    private QnaVO qnaVO;
}
