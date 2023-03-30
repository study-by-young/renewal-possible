package com.possible.common.code.domain;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class MasterCode {

    @ApiModelProperty(value = "코드")
    private String code;

    @ApiModelProperty(value = "코드명")
    private String name;

}
