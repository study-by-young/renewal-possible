package com.possible.common.code.domain;

import lombok.Data;

@Data
public class TrimCodeVO {
    private String code;
    private String name;
    private String fuel;

    private ModelCodeVO modelCodeVO;
}
