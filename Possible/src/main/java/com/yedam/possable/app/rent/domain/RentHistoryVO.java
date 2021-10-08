package com.yedam.possable.app.rent.domain;

import lombok.Data;

import java.util.Date;

@Data
public class RentHistoryVO {
    private Long seq;
	private String rentType; /* 구분 */
	private Date startDate; /* 시작일자 */
	private Date receiveDate; /* 수령일자 */
	private Date returnDate; /* 반납일자 */
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
}
