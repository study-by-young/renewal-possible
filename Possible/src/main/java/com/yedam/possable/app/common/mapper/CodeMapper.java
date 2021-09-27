package com.yedam.possable.app.common.mapper;

import com.yedam.possable.app.common.domain.CodeSubVO;

import java.util.List;

public interface CodeMapper {
    public List<CodeSubVO> getNamesByParentCode(String parentCode);
}
