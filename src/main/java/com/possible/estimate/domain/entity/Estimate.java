package com.possible.estimate.domain.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.possible.car.domain.CarOptionVO;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;
import java.util.List;

@Setter
@Getter
public class Estimate {

    @ApiModelProperty(value = "식별자")
    private Integer id;

    @ApiModelProperty(value = "견적요청식별자")
    private Integer estimateReqId;

    @ApiModelProperty(value = "업체식별자")
    private Integer companyId;

    @ApiModelProperty(value = "차량식별자")
    private Integer carId;

    @ApiModelProperty(value = "차량옵션리스트")
    private List<CarOptionVO> options; // 추후 타입 수정

    @ApiModelProperty(value = "아이템(캠핑도구)옵션리스트")
    private List<CarOptionVO> items; // 추후 타입 수정

    @ApiModelProperty(value = "가격")
    private Integer price;

    @ApiModelProperty(value = "메모")
    private String memo;

    @ApiModelProperty(value = "등록일자")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date regDate;

    @ApiModelProperty(value = "수정일자")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date uptDate;

}
