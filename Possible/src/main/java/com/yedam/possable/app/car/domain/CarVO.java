package com.yedam.possable.app.car.domain;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.yedam.possable.app.common.code.domain.ModelCodeVO;
import com.yedam.possable.app.common.code.domain.TrimCodeVO;
import com.yedam.possable.app.company.domain.CompanyVO;
import com.yedam.possable.app.rent.domain.RentReviewVO;

import lombok.Data;

@Data
public class CarVO {
    private Long seq;
    private String carNum;
    private String brand;
    private String segment;
    private String model;
    private String trim;
    private String color;
    private Long year;
    private String fuel;
    private Long passenger;
    private String mission;
    private Long trunk;
    private Long door;
    private Long kmpl;
    private Long price;
    private String status;
    private String img1;
    private String img2;
    private String img3;
    private Date genDate;
    private Date uptDate;

    private String brandName;
    private String segmentName;
    private String colorName;
    private String fuelName;
    private String missionName;
    private String statusName;
    private ModelCodeVO modelCodeVO;
    private TrimCodeVO trimCodeVO;
    private CompanyVO companyVO;

    private Long cmpnSeq; // commonRent 기능 구현에서 사용
    private String name; // getCarByModel() 에서 COMPANY 테이블과 JOIN해서 추가된 컬럼
    private List<CarVO> modelList; // 해당하는 모델의 차량을 보유하고 있는 업체의 시퀀스를 출력하기 위해 추가
    private List<CarOptionVO> optionList;
    private List<InsuranceOptionVO> insuranceList; // 보험 리스트
    private List<RentReviewVO> reviewList; // 리뷰리스트

    @DateTimeFormat(pattern = "yyyy/MM/dd")
    private Date startDate;
    @DateTimeFormat(pattern = "yyyy/MM/dd")
    private Date endDate;

    private MultipartFile uploadFile;	//첨부파일
}
