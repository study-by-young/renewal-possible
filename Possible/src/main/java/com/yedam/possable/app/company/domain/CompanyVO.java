package com.yedam.possable.app.company.domain;

import com.yedam.possable.app.member.domain.MemberVO;
import lombok.Data;

import java.util.Date;

@Data
public class CompanyVO {
    private Long seq;
    private String name;
    private String addrCode;
    private String addrBasic;
    private String addrDetail;
    private String cmpnNum;
    private String tel;
    private String status;
    private Date genDate;
    private Date uptDate;

    private MemberVO memberVO;
}
