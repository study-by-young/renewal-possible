package com.possible.community.course.service;

import com.possible.common.criteria.domain.Criteria;
import com.possible.community.course.domain.CourseBoardLikeVO;
import com.possible.community.course.domain.CourseBoardVO;
import com.possible.community.course.domain.CourseVO;
import com.possible.community.tour.domain.TestVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CourseBoardService {

	public List<CourseBoardVO> getList(Criteria cri);

	public CourseBoardVO read(CourseBoardVO vo);
	
	public List<CourseBoardVO> getWriter(String writer);
	
	//마이페이지 나의 여행코스 조회
	public List<CourseBoardVO> getUserCourseList(@Param("writer")String writer,@Param("cri")Criteria cri);
	
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
	
	public int checkLike(CourseBoardLikeVO vo);
	
}
