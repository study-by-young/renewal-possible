package com.yedam.possable.app.rent.domain;

import com.yedam.possable.app.community.course.domain.CourseBoardVO;
import com.yedam.possable.app.member.domain.MemberVO;
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
