package com.possible.community.course.mapper;

import com.possible.common.criteria.domain.Criteria;
import com.possible.community.course.domain.CourseBoardCmtVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CourseBoardCmtMapper {
	
	public List<CourseBoardCmtVO> getList(@Param("cri") Criteria cri, @Param("vo") CourseBoardCmtVO vo);
	
    public int getTotalCount(Criteria cri);
	
	public int insert(CourseBoardCmtVO vo);
	
	public int delete(Long seq);
	
	public CourseBoardCmtVO read(CourseBoardCmtVO vo);

}
