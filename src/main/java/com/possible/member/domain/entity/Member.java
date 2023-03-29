package com.possible.member.domain.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class Member {

    @ApiModelProperty(value = "식별자")
    private Integer id;

    @ApiModelProperty(value = "로그인아이디")
    private String loginId;

    @ApiModelProperty(value = "비밀번호")
    private String password;

    @ApiModelProperty(value = "이름")
    private String name;

    @ApiModelProperty(value = "생년월일")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date birth;

    @ApiModelProperty(value = "이메일")
    private String email;

    @ApiModelProperty(value = "연락처")
    private String phone;

    @ApiModelProperty(value = "권한")
    private String auth;

    @ApiModelProperty(value = "상태")
    private String status;

    @ApiModelProperty(value = "등록일자")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date regDate;

    @ApiModelProperty(value = "수정일자")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date uptDate;

}
