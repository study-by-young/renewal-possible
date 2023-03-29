package com.possible.member.domain.entity;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class MemberDrop {

    @ApiModelProperty(value = "식별자")
    private Integer id;

    @ApiModelProperty(value = "탈퇴사유")
    private String reason;

    @ApiModelProperty(value = "메모")
    private String memo;

    @ApiModelProperty(value = "회원식별자")
    private Integer memberId;

}
