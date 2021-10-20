package com.yedam.possable.app.community.course.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.possable.app.common.criteria.domain.Criteria;
import com.yedam.possable.app.community.course.domain.CourseBoardCmtVO;
import com.yedam.possable.app.community.course.domain.CourseBoardVO;

public interface CourseBoardCmtService {
	
	public List<CourseBoardCmtVO> getList(Criteria cri, CourseBoardCmtVO vo);
	
    public int getTotalCount(Criteria cri);
	
	public int insert(CourseBoardCmtVO vo);
	
	public int delete(Long seq);
	
	public CourseBoardCmtVO read(CourseBoardCmtVO vo);
	
}
