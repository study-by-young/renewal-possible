package com.yedam.possable.app.rent.domain;

import com.yedam.possable.app.member.domain.MemberVO;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

@Data
public class EstimateHistoryVO {
    private Long seq;
    private String brand;
    private String segment;
    private String model;
    private String trim;
    private String options;
    private String items;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date startDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endDate;
    private String takePlaceCode;
    private String takePlaceBasic;
    private String takePlaceDetail;
    private Date genDate;
    private Date uptDate;


    private MemberVO memberVO;
}
