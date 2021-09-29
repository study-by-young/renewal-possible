package com.yedam.possable.app.common.mapper;

import com.yedam.possable.app.common.domain.BrandCodeVO;
import com.yedam.possable.app.common.domain.CodeSubVO;
import com.yedam.possable.app.common.domain.ModelCodeVO;
import com.yedam.possable.app.common.domain.TrimCodeVO;

import java.util.List;

public interface CodeMapper {
    // 코드 리스트 조회
    public List<CodeSubVO> getCodesByParentCodeName(String parentCodeName);

    // 브랜드 조회
    public List<BrandCodeVO> getBrands();

    // 모델 조회
    public List<ModelCodeVO> getModels();

    // 모델 선택 조회
    public List<ModelCodeVO> getModels(String brandCode);

    // 트림 조회
    public List<TrimCodeVO> getTrims();

    // 트림 선택 조회
    public List<TrimCodeVO> getTrims(String modelCode);

}
