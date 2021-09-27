package com.yedam.possable.app.rent.domain;

import com.yedam.possable.app.car.domain.CarVO;
import com.yedam.possable.app.member.domain.MemberVO;
import lombok.Data;

import java.util.Date;

@Data
public class RentHistoryVO {
    private Long seq;
    private String rentType;
    private Date startDate;
    private Date endDate;
    private Date receiveDate;
    private Date returnDate;
    private String receiver;
    private String takePlaceCode;
    private String takePlaceBasicAddr;
    private String takePlaceDetailAddr;
    private String destinationCode;
    private String destinationBasicAddr;
    private String destinationDetailAddr;
    private Long price;
    private Long estimate;
    private String status;
    private Date genDate;
    private Date uptDate;

    private CarVO carVO;
    private MemberVO memberVO;
}
