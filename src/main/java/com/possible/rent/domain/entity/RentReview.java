package com.possible.rent.domain.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class RentReview {

    @ApiModelProperty(value = "식별자")
    private Integer id;

    @ApiModelProperty(value = "차량식별자")
    private Integer carId;

    @ApiModelProperty(value = "회원식별자")
    private Integer memberId;

    @ApiModelProperty(value = "렌트식별자")
    private Integer rentId;

    @ApiModelProperty(value = "제목")
    private String title;

    @ApiModelProperty(value = "내용")
    private String content;

    @ApiModelProperty(value = "평점")
    private double score;

    @ApiModelProperty(value = "등록일자")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date regDate;

    @ApiModelProperty(value = "수정일자")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date uptDate;

}
