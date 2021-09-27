package com.yedam.possable.app.rent.domain;

import com.yedam.possable.app.car.domain.CarVO;
import com.yedam.possable.app.company.domain.CompanyVO;
import lombok.Data;

import java.util.Date;

@Data
public class EstiSubmitHistoryVO {
    private Long seq;
    private String items;
    private Long price;
    private String memo;
    private Date genDate;
    private Date uptDate;

    private EstimateHistoryVO estimateHistoryVO;
    private CompanyVO companyVO;
    private CarVO carVO;
}
