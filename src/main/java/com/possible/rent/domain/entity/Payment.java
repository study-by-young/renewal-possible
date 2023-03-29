package com.possible.rent.domain.entity;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Payment {

    @ApiModelProperty(value = "식별자")
    private Integer id;

    @ApiModelProperty(value = "렌트식별자")
    private Integer rentId;

    @ApiModelProperty(value = "가격")
    private Integer price;

    @ApiModelProperty(value = "주문번호")
    private String merchantUid;

    @ApiModelProperty(value = "결제방식")
    private String payMethod;

}
