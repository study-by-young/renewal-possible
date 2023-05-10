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
public class EstimateRequest {

    @ApiModelProperty(value = "식별자")
    private Integer id;

    @ApiModelProperty(value = "브랜드")
    private String brand;

    @ApiModelProperty(value = "모델")
    private String model;

    @ApiModelProperty(value = "차량옵션리스트")
    private List<CarOptionVO> options; // 추후 타입 수정

    @ApiModelProperty(value = "아이템(캠핑도구)옵션리스트")
    private List<CarOptionVO> items; // 추후 타입 수정

    @ApiModelProperty(value = "시작일자")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date startDate;

    @ApiModelProperty(value = "종료일자")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date endDate;

    @ApiModelProperty(value = "등록일자")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date regDate;

    @ApiModelProperty(value = "수정일자")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date uptDate;

    @ApiModelProperty(value = "회원식별자")
    private Integer memberId;

}
