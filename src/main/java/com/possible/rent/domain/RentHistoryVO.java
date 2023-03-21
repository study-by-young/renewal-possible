package com.possible.rent.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.possible.car.domain.CarVO;
import com.possible.car.domain.InsuranceOptionVO;
import com.possible.common.code.domain.CodeSubVO;
import com.possible.company.domain.CompanyVO;
import com.yedam.possable.app.member.domain.MemberVO;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
public class RentHistoryVO {
    private Long seq;
    private Long carSeq;
    private Long memSeq;
	private String rentType; /* 구분 */
    @JsonFormat(pattern = "yy/MM/dd")
    @DateTimeFormat(pattern = "yy/MM/dd")
	private Date startDate; /* 시작일자 */
    @JsonFormat(pattern = "yy/MM/dd")
    @DateTimeFormat(pattern = "yy/MM/dd")
	private Date endDate; /* 끝일자 */
    private String receiver;
    private String takePlaceCode;
    private Long price;
    private Long estimate;
    private String status;
    private Date genDate;
    private Date uptDate;
    private String takePlaceDetail;
    private String takePlaceBasic;
    private String merchantUid;
    private String payMethod;
    private String phone;
    private Date birth;
    private String email;
    private String insuranceCode;
    private Long cmpnSeq;

    private String review;

    // 211014 추가
    private CarVO carVO;
    private MemberVO memberVO;
    private CompanyVO companyVO;
    private InsuranceOptionVO insuranceCodeVO;
    private CodeSubVO statusCodeVO;
   

}
