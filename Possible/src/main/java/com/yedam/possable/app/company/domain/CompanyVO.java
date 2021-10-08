package com.yedam.possable.app.company.domain;

import lombok.Data;

import java.util.Date;

@Data
public class CompanyVO {
    private Long seq;
    private String name;
    private String addr1;
    private String addr2;
    private String area;
    private String postal;
    private String cmpnNum;
    private String tel;
    private String status;
    private Date genDate;
    private Date uptDate;

    private Long memSeq;
}

