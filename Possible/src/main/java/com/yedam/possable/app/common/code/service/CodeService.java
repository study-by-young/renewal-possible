package com.yedam.possable.app.common.code.service;

import com.yedam.possable.app.common.code.domain.*;

import java.util.List;

public interface CodeService {
    public List<CodeMasterVO> getMasterCodes();                         // 마스터 코드 리스트 조회

    public CodeMasterVO getMasterCodeByValue(String code);              // 코드로 마스터 코드 조회

    public CodeMasterVO getMasterCodeByName(String name);               // 이름으로 마스터 코드 조회

    public List<CodeSubVO> getCodesByParentCode(String parentCode);     // 코드 리스트 조회

    public CodeSubVO getCodeByValue(String code);                       // 코드 네임 조회

    public List<BrandCodeVO> getBrandList();                            // 브랜드 조회

    public BrandCodeVO getBrand(String code);                           // 브랜드 단건 조회

    public List<ModelCodeVO> getModelList(String brandCode);            // 모델 조회

    public ModelCodeVO getModel(String code);                           // 모델 단건 조회

    public List<TrimCodeVO> getTrimList(String modelCode);              // 트림 조회

    public TrimCodeVO getTrim(String code);                             // 트림 단건 조회
}
