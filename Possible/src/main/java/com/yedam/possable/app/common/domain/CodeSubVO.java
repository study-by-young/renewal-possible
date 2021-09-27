package com.yedam.possable.app.common.domain;

import lombok.Data;

@Data
public class CodeSubVO {
    private String code;
    private String name;

    private CodeMasterVO codeMaster;
}
