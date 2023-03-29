package com.possible.rent.domain.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class Rent {

    @ApiModelProperty(value = "식별자")
    private Integer id;

    @ApiModelProperty(value = "차량식별자")
    private Integer carId;

    @ApiModelProperty(value = "회원식별자")
    private Integer memberId;

    @ApiModelProperty(value = "렌트타입")
    private String rentType;

    @ApiModelProperty(value = "시작일자")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date startDate;

    @ApiModelProperty(value = "수령일자")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date receiveDate;

    @ApiModelProperty(value = "반납일자")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date returnDate;

    @ApiModelProperty(value = "종료일자")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date endDate;

    @ApiModelProperty(value = "견적식별자")
    private Integer estimateId;

    @ApiModelProperty(value = "예약자")
    private String reserver;

    @ApiModelProperty(value = "상태")
    private String status;

    @ApiModelProperty(value = "등록일자")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date regDate;

    @ApiModelProperty(value = "수정일자")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date uptDate;

}
