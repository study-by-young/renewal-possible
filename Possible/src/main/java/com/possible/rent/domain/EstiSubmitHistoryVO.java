package com.possible.rent.domain;

import com.possible.car.domain.CarVO;
import com.possible.company.domain.CompanyVO;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class EstiSubmitHistoryVO {
    private Long seq;
    private String items;
    private Long price;
    private String memo;
    private Date genDate;
    private Date uptDate;
    private String status;
    private List<String> itemsList;

    private EstimateHistoryVO estimateHistoryVO;
    private CompanyVO companyVO;
    private CarVO carVO;
//    private Long estiSeq;
//    private Long cmpnSeq;
//    private Long carSeq;
}
