package com.yedam.possable.app.community.course.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.possable.app.common.criteria.domain.Criteria;
import com.yedam.possable.app.community.course.domain.CourseBoardCmtVO;

public interface CourseBoardCmtMapper {
	
	public List<CourseBoardCmtVO> getList(@Param("cri") Criteria cri,@Param("vo") CourseBoardCmtVO vo);
	
    public int getTotalCount(Criteria cri);
	
	public int insert(CourseBoardCmtVO vo);
	
	public int delete(Long seq);
	
	public CourseBoardCmtVO read(CourseBoardCmtVO vo);

}
