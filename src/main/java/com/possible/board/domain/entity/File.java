package com.possible.board.domain.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public class File {

    @ApiModelProperty(value = "식별자")
    private Integer id;

    @ApiModelProperty(value = "파일번호")
    private Integer fileNo;

    @ApiModelProperty(value = "파일명")
    private String name;

    @ApiModelProperty(value = "원본파일명")
    private String orgName;

    @ApiModelProperty(value = "파일타입")
    private String fileType;

    @ApiModelProperty(value = "파일사이즈")
    private Integer fileSize;

    @ApiModelProperty(value = "등록일자")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date regDate;

    @ApiModelProperty(value = "수정일자")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date uptDate;

    @ApiModelProperty(value = "관련게시글코드")
    private String refPostCode;

    @ApiModelProperty(value = "관련게시글식별자")
    private Integer refPostId;

}
