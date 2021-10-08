package com.yedam.possable.app.rent.domain;

import lombok.Data;

@Data
public class RentReviewVO {
    private Long seq;
    private String title;
    private String content;
    private Long score;

    private Long carSeq;
    private Long memSeq;
    private Long courseSeq;
}
