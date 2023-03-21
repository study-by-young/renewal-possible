package com.possible.rent.domain;

import com.possible.car.domain.CarVO;
import com.possible.common.code.domain.BrandCodeVO;
import com.possible.common.code.domain.CodeSubVO;
import com.possible.common.code.domain.ModelCodeVO;
import com.possible.common.code.domain.TrimCodeVO;
import com.possible.company.domain.CompanyVO;
import com.yedam.possable.app.member.domain.MemberVO;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

@Data
public class CompEstiListJoinVO {
	
	//EstiSubmitHistoryVO 
	 	private Long seq;
	    private String items;
	    private Long price;
	    private String memo;
	   @DateTimeFormat(pattern = "yyyy/MM/dd")
	    private Date genDate;
	   @DateTimeFormat(pattern = "yyyy/MM/dd")
	    private Date uptDate;
	   
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
	    //private String name;
	    private String memName;
	    private String phone; //회원전화번호
	    //private Long estiSeq;
	    private Long cmpnSeq;
	    //private Long carSeq;
	    private String status;
	    private List<String> itemList;
	    private List<String> optionList;

	    private BrandCodeVO brandCodeVO;
	    private CodeSubVO segmentCodeVO;
	    private ModelCodeVO modelCodeVO;
	    private TrimCodeVO trimCodeVO;
	    private MemberVO memberVO;
	    private CarVO carVO;
	    private CompanyVO companyVO;
	    private EstimateHistoryVO estimateHistoryVO;
		//String[] itemsArr;
}
