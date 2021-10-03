package com.yedam.possable.app.common.service;

import com.yedam.possable.app.common.domain.BrandCodeVO;
import com.yedam.possable.app.common.domain.CodeSubVO;
import com.yedam.possable.app.common.domain.ModelCodeVO;
import com.yedam.possable.app.common.domain.TrimCodeVO;
import com.yedam.possable.app.common.mapper.CodeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CodeServiceImpl implements CodeService{
    @Autowired
    CodeMapper codeMapper;

    @Override
    public List<CodeSubVO> getCodesByParentCodeName(String parentCodeName) {
        return codeMapper.getCodesByParentCodeName(parentCodeName);
    }

    @Override
    public CodeSubVO getNameByCode(String code) {
        return codeMapper.getNameByCode(code);
    }

    @Override
    public List<BrandCodeVO> getBrands() {
        return codeMapper.getBrands();
    }

    @Override
    public BrandCodeVO getBrand(String code) {
        return codeMapper.getBrand(code);
    }

    @Override
    public List<ModelCodeVO> getModels() {
        return codeMapper.getModels();
    }

    @Override
    public List<ModelCodeVO> getModels(String brandCode) {
        return codeMapper.getModels(brandCode);
    }

    @Override
    public ModelCodeVO getModel(String code) {
        return codeMapper.getModel(code);
    }

    @Override
    public List<TrimCodeVO> getTrims(String modelCode) {
        return codeMapper.getTrims(modelCode);
    }

    @Override
    public TrimCodeVO getTrim(String code) {
        return codeMapper.getTrim(code);
    }
}
