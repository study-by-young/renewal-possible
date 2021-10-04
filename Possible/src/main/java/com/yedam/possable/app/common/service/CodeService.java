package com.yedam.possable.app.common.service;

import com.yedam.possable.app.common.domain.BrandCodeVO;
import com.yedam.possable.app.common.domain.CodeSubVO;
import com.yedam.possable.app.common.domain.ModelCodeVO;
import com.yedam.possable.app.common.domain.TrimCodeVO;

import java.util.List;

public interface CodeService {
    // 코드 리스트 조회
    public List<CodeSubVO> getCodesByParentCodeName(String parentCodeName);

    // 코드 네임 조회
    public CodeSubVO getNameByCode(String code);

    // 브랜드 조회
    public List<BrandCodeVO> getBrands();

    // 브랜드 단건 조회
    public BrandCodeVO getBrand(String code);

    // 모델 조회
    public List<ModelCodeVO> getModels();

    // 모델 선택 조회
    public List<ModelCodeVO> getModels(String brandCode);

    // 모델 단건 조회
    public ModelCodeVO getModel(String code);

    // 트림 조회
    public List<TrimCodeVO> getTrims(String modelCode);

    // 트림 단건 조회
    public TrimCodeVO getTrim(String code);

}
