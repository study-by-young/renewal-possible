package com.possible.common.code.domain;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ModelCode {

    private String code;
    private String name;
    private BrandCode brandCode;
    private String img;

}
