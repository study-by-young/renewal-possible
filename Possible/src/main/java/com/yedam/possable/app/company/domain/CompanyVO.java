package com.yedam.possable.app.company.domain;

import com.yedam.possable.app.common.code.domain.CodeSubVO;
import com.yedam.possable.app.member.domain.MemberVO;
import lombok.Data;

import java.util.Date;
import java.util.List;

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

    private CodeSubVO areaCodeVO;
    private CodeSubVO statusCodeVO;
    private MemberVO memberVO;
    private List<CodeSubVO> itemList;
}

