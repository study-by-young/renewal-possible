package com.possible.common.code.domain;

import lombok.Data;

@Data
public class ModelCodeVO {
    private String code;
    private String name;
    private String img;
    private String segCode;

    private BrandCodeVO brandCode;
}
