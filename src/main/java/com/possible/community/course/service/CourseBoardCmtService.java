package com.possible.community.course.service;

import com.possible.common.criteria.domain.Criteria;
import com.possible.community.course.domain.CourseBoardCmtVO;

import java.util.List;

public interface CourseBoardCmtService {
	
	public List<CourseBoardCmtVO> getList(Criteria cri, CourseBoardCmtVO vo);
	
    public int getTotalCount(Criteria cri);
	
	public int insert(CourseBoardCmtVO vo);
	
	public int delete(Long seq);
	
	public CourseBoardCmtVO read(CourseBoardCmtVO vo);
	
}
