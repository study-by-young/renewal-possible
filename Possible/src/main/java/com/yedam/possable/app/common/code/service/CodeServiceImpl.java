package com.yedam.possable.app.common.code.service;

import com.yedam.possable.app.common.code.domain.*;
import com.yedam.possable.app.common.code.mapper.CodeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CodeServiceImpl implements CodeService {
    @Autowired
    CodeMapper codeMapper;

    @Override
    public List<CodeMasterVO> getMasterCodes() {
        return codeMapper.getMasterCodes();
    }

    @Override
    public CodeMasterVO getMasterCodeByValue(String code) {
        return codeMapper.getMasterCodeByValue(code);
    }

    @Override
    public CodeMasterVO getMasterCodeByName(String name) {
        return codeMapper.getMasterCodeByName(name);
    }

    @Override
    public List<CodeSubVO> getCodesByParentCode(String parentCode) {
        return codeMapper.getCodesByParentCode(parentCode);
    }

    @Override
    public CodeSubVO getCodeByValue(String code) {
        return codeMapper.getCodeByValue(code);
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
    public List<ModelCodeVO> getModelList(String brandCode) {
        return codeMapper.getModelList(brandCode);
    }

    @Override
    public ModelCodeVO getModel(String code) {
        return codeMapper.getModel(code);
    }

    @Override
    public List<TrimCodeVO> getTrimList(String modelCode) {
        return codeMapper.getTrimList(modelCode);
    }

    @Override
    public TrimCodeVO getTrim(String code) {
        return codeMapper.getTrim(code);
    }

}
