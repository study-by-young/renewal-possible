package com.yedam.possable.app.car.domain;

import lombok.Data;

@Data
public class InsuranceOptionVO {
    private String optCode;
    private Long price;

    private String optName;
    private Long carSeq;
}
