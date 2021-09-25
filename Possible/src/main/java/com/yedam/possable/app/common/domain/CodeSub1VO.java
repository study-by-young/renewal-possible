package com.yedam.possable.app.common.domain;

import lombok.Data;

@Data
public class CodeSub1VO {
    private String code;
    private String name;

    private CodeMasterVO codeMaster;
}
