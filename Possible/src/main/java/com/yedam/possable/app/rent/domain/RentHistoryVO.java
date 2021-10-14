package com.yedam.possable.app.rent.domain;

import java.util.Date;

import com.yedam.possable.app.car.domain.CarVO;
import com.yedam.possable.app.company.domain.CompanyVO;
import com.yedam.possable.app.member.domain.MemberVO;

import lombok.Data;

@Data
public class RentHistoryVO {
    private Long seq;
	private String rentType; /* 구분 */
	private Date startDate; /* 시작일자 */
	private Date endDate; /* 끝일자 */
    private String receiver;
    private Long price;
    private Long estimate;
    private String status;
    private Date genDate;
    private Date uptDate;
    private String takePlaceCode;
    private String takePlaceBasic;
    private String takePlaceDetail;
    private String merchantUid;
    private String payMethod;
    
    private Long carSeq;
    private Long memSeq;
    private Long cmpnSeq;
    private String review; 
    
    // 211014 추가
    private CarVO carVO;
    private MemberVO memberVO;
    private CompanyVO companyVO;
    
    private String phone;
    private Date birth;
    private String email;
    private String receiverB;
    private String phoneB;
    private Date birthB;
    private String emailB;
}
