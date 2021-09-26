package com.yedam.possable.app.rent.domain;

import lombok.Data;

@Data
public class InsuranceOptionVO {
    private String optCode;
    private Long price;

    private CarVO carVO;
}
