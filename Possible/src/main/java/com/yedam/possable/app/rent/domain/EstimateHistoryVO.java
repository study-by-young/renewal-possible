package com.yedam.possable.app.rent.domain;

import com.yedam.possable.app.member.domain.MemberVO;
import lombok.Data;

import java.util.Date;

@Data
public class EstimateHistoryVO {
    private Long seq;
    private String brand;
    private String segment;
    private String model;
    private String trim;
    private String options;
    private String items;
    private Date startDate;
    private Date endDate;
    private String takePlaceCode;
    private String takePlaceBasicAddr;
    private String takePlaceDetailAddr;
    private String destinationCode;
    private String destinationBasicAddr;
    private String destinationDetailAddr;
    private Date genDate;
    private Date uptDate;

    private MemberVO memberVO;
}
