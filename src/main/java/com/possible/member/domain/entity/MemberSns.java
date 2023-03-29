package com.possible.member.domain.entity;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class MemberSns {

    @ApiModelProperty(value = "식별자")
    private Integer id;

    @ApiModelProperty(value = "토큰")
    private String accessToken;

    @ApiModelProperty(value = "회원식별자")
    private Integer memberId;

}
