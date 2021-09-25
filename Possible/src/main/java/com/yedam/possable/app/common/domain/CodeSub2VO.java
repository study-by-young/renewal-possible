package com.yedam.possable.app.common.domain;

import lombok.Data;

@Data
public class CodeSub2VO {
    private String code;
    private String name;

    private CodeSub1VO codeSub1;
}
