package com.yedam.possable.app.common.criteria.domain;


import lombok.Data;
@Data
//@AllArgsConstructor	//생성자 만들어줌
//@NoArgsConstructor
public class Criteria {
    private int pageNum = 1;
    private int amount = 10;

    private String type;
    private String keyword;
    
    // 일반렌트 자동차 검색
    private String model;
    private String segment;
    private String fuel;
    private String year;
    private String brand;
    private String passenger;

    public Criteria() {
    }

    public Criteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
    }

    public String[] getTypeArr() {
        return type == null ? new String[] {} : type.split("");
    }    
    
    public String[] getModelArr() {
        return model == null ? new String[] {} : model.split("");
    }    
    
    public String[] getSegmentArr() {
        return segment == null ? new String[] {} : segment.split("");
    }
    
    public String[] getFuelArr() {
        return fuel == null ? new String[] {} : fuel.split("");
    }
    
    public String[] getYearArr() {
        return year == null ? new String[] {} : year.split("");
    }
    
    public String[] getBrandArr() {
        return brand == null ? new String[] {} : brand.split("");
    }
    
    public String[] getPassengerArr() {
        return passenger == null ? new String[] {} : passenger.split("");
    }
}
