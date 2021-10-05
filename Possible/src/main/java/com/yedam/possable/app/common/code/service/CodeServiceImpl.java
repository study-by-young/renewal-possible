package com.yedam.possable.app.common.code.service;

import com.yedam.possable.app.common.code.domain.BrandCodeVO;
import com.yedam.possable.app.common.code.domain.CodeSubVO;
import com.yedam.possable.app.common.code.domain.ModelCodeVO;
import com.yedam.possable.app.common.code.domain.TrimCodeVO;
import com.yedam.possable.app.common.code.mapper.CodeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CodeServiceImpl implements CodeService{
    @Autowired
    CodeMapper codeMapper;

    @Override
    public String getMasterCodeNameByCodeValue(String code) {
        return codeMapper.getMasterCodeNameByCodeValue(code);
    }

    @Override
    public String getMasterCodeValueByName(String name) {
        return codeMapper.getMasterCodeValueByName(name);
    }

    @Override
    public List<CodeSubVO> getCodesByParentCodeValue(String parentCode) {
        return codeMapper.getCodesByParentCode(parentCode);
    }

    @Override
    public CodeSubVO getCodeByName(String name) {
        return codeMapper.getCodeByName(name);
    }

    @Override
    public CodeSubVO getCodeByCodeValue(String code) {
        return codeMapper.getCodeByName(code);
    }

    @Override
    public List<BrandCodeVO> getBrandList() {
        return codeMapper.getBrandList();
    }

    @Override
    public BrandCodeVO getBrand(String code) {
        return codeMapper.getBrand(code);
    }

    @Override
    public List<ModelCodeVO> getModelList(String code) {
        return codeMapper.getModelList(code);
    }

    @Override
    public ModelCodeVO getModel(String code) {
        return codeMapper.getModel(code);
    }

    @Override
    public List<TrimCodeVO> getTrimList(String code) {
        return codeMapper.getTrimList(code);
    }

    @Override
    public TrimCodeVO getTrim(String code) {
        return codeMapper.getTrim(code);
    }
}
