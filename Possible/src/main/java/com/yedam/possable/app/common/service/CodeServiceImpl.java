package com.yedam.possable.app.common.service;

import com.yedam.possable.app.common.mapper.CodeMapper;
import org.springframework.beans.factory.annotation.Autowired;

public class CodeServiceImpl implements CodeService{
    @Autowired
    CodeMapper codeMapper;
}
