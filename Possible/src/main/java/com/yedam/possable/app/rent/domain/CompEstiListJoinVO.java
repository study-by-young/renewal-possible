package com.yedam.possable.app.rent.domain;

import java.util.Date;

import com.yedam.possable.app.car.domain.CarVO;
import com.yedam.possable.app.company.domain.CompanyVO;

import lombok.Data;

@Data
public class CompEstiListJoinVO {
	
	//EstiSubmitHistoryVO 
	 	private Long seq;
	    private String items;
	    private Long price;
	    private String memo;
	    private Date genDate;
	    private Date uptDate;

	    private Long estiSeq;
	    private Long cmpnSeq;
	    private Long carSeq;
	    
	//private CarVO carVO;
	    private String carNum;
	    private String brand;
	    private String segment;
	    private String model;
	    private String trim;
	    private String color;
	    private Long year;
	    private String fuel;    //가솔린
	    private Long passenger; //인원
	    private String mission; //수동 or 자동
	    private Long trunk;
	    private Long door;
	    private Long kmpl;
	   
	//private CompanyVO companyVO; 
	    private String name;
	    private Long memSeq;
}
