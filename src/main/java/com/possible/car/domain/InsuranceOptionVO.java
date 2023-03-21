package com.possible.car.domain;

import lombok.Data;

@Data
public class InsuranceOptionVO {
    private String optCode;
    private Long price;

    private String optName;
    private Long carSeq;
}
