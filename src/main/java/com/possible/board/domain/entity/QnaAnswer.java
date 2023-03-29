package com.possible.board.domain.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class QnaAnswer {

    @ApiModelProperty(value = "식별자")
    private Integer id;

    @ApiModelProperty(value = "문의식별자")
    private Integer qnaId;

    @ApiModelProperty(value = "내용")
    private String content;

    @ApiModelProperty(value = "등록일자")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date regDate;

}
