package com.yedam.possable.app.member.domain;

import lombok.Data;

@Data
public class MemberDropVO {
    private Long seq;
    private String reasonCode;
    private String memo;

    private Long memSeq;
}
