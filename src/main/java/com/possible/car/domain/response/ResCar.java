package com.possible.car.domain.response;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.possible.company.domain.entity.Company;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class ResCar {

    @ApiModelProperty(value = "식별자")
    private Integer id;

    @ApiModelProperty(value = "브랜드")
    private String brand;

    @ApiModelProperty(value = "모델")
    private String model;

    @ApiModelProperty(value = "색상")
    private String color;

    @ApiModelProperty(value = "연식")
    private Integer year;

    @ApiModelProperty(value = "연료")
    private String fuel;

    @ApiModelProperty(value = "인원수")
    private Integer passenger;

    @ApiModelProperty(value = "가격")
    private Integer price;

    @ApiModelProperty(value = "상태")
    private String status;

    @ApiModelProperty(value = "차량넘버")
    private String carNumber;

    @ApiModelProperty(value = "등록일자")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date regDate;

    @ApiModelProperty(value = "수정일자")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date uptDate;


    @ApiModelProperty(value = "업체")
    private Company company;

}
