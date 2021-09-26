package com.yedam.possable.app.community.course.mapper;

import java.util.List;

import com.yedam.possable.app.community.course.domain.CourseBoardVO;

public interface CourseBoardMapper {
	
	public List<CourseBoardVO> getList();
	
	public CourseBoardVO read(CourseBoardVO vo);
	
	public int insert(CourseBoardVO vo);
	
	public int update(CourseBoardVO vo);
	
	public int delete(CourseBoardVO vo);

}
