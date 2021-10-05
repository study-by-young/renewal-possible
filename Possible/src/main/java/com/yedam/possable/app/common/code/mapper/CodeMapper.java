package com.yedam.possable.app.common.code.mapper;

import com.yedam.possable.app.common.code.domain.BrandCodeVO;
import com.yedam.possable.app.common.code.domain.CodeSubVO;
import com.yedam.possable.app.common.code.domain.ModelCodeVO;
import com.yedam.possable.app.common.code.domain.TrimCodeVO;

import java.util.List;

public interface CodeMapper {
    public String getMasterCodeNameByCodeValue(String code);            // 코드로 마스터 코드 네임 조회

    public String getMasterCodeValueByName(String name);                // 코드네임으로 마스터 코드 조회

    public List<CodeSubVO> getCodesByParentCode(String parentCode);     // 코드 리스트 조회

    public CodeSubVO getCodeByName(String name);                        // 코드 조회

    public CodeSubVO getNameByCode(String code);                        // 코드 네임 조회

    public List<BrandCodeVO> getBrandList();                   // 브랜드 조회

    public BrandCodeVO getBrand(String code);               // 브랜드 단건 조회

    public List<ModelCodeVO> getModelList(String code);        // 모델 선택 조회

    public ModelCodeVO getModel(String code);               // 모델 단건 조회

    public List<TrimCodeVO> getTrimList(String code);          // 트림 조회

    public TrimCodeVO getTrim(String code);                 // 트림 단건 조회
}
