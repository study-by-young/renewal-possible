package com.possible.car.domain.entity;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class CarOption {

    @ApiModelProperty(value = "코드")
    private String code;

    @ApiModelProperty(value = "차량식별자")
    private Integer carId;

}
