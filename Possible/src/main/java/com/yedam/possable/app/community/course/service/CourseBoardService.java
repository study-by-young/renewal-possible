package com.yedam.possable.app.community.course.service;

import java.util.List;

import com.yedam.possable.app.common.criteria.domain.Criteria;
import com.yedam.possable.app.community.course.domain.CourseBoardLikeVO;
import com.yedam.possable.app.community.course.domain.CourseBoardVO;
import com.yedam.possable.app.community.course.domain.CourseVO;
import com.yedam.possable.app.community.tour.domain.TestVO;

public interface CourseBoardService {

	public List<CourseBoardVO> getList();

	public CourseBoardVO read(CourseBoardVO vo);

	public int insert(CourseBoardVO vo);

	public int update(CourseBoardVO vo);

	public int delete(CourseBoardVO vo);

	public List<TestVO> tourList();

	public List<TestVO> tourList(Criteria cri);

	public int getTotalCount(Criteria cri);
	
	public int courseCnt(CourseBoardVO vo);
	
	public List<TestVO> courseSelect(CourseBoardVO vo);
	
	public int courseInsert(List<CourseVO> list, Long num);
	
	public boolean plusViews(CourseBoardVO vo);
	
	public int plusLike(CourseBoardLikeVO vo);
	
	public int minusLike(CourseBoardLikeVO vo);
	
	public int countLike(CourseBoardVO vo);

}
