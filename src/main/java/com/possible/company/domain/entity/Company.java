package com.possible.company.domain.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class Company {

    @ApiModelProperty(value = "식별자")
    private Integer id;

    @ApiModelProperty(value = "업체명")
    private String name;

    @ApiModelProperty(value = "사업자등록번호")
    private String comNumber;

    @ApiModelProperty(value = "연락처")
    private String tel;

    @ApiModelProperty(value = "상태")
    private String status;

    @ApiModelProperty(value = "등록일자")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date regDate;

    @ApiModelProperty(value = "수정일자")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date uptDate;

    @ApiModelProperty(value = "업체전환회원식별자")
    private Integer memberId;

    @ApiModelProperty(value = "우편번호")
    private String postalCode;

    @ApiModelProperty(value = "주소")
    private String address;

}
