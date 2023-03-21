package com.possible.community.course.service;

import com.possible.common.criteria.domain.Criteria;
import com.possible.community.course.domain.CourseBoardLikeVO;
import com.possible.community.course.domain.CourseBoardVO;
import com.possible.community.course.domain.CourseVO;
import com.possible.community.course.mapper.CourseBoardMapper;
import com.possible.community.tour.domain.TestVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseBoardServiceImpl implements CourseBoardService {

	@Autowired
	CourseBoardMapper courseBoardMapper;

	@Override
	public List<CourseBoardVO> getList(Criteria cri) {
		return courseBoardMapper.getList(cri);
	}

	@Override
	public CourseBoardVO read(CourseBoardVO vo) {
		return courseBoardMapper.read(vo);
	}

	@Override
	public int insert(CourseBoardVO vo) {
		return courseBoardMapper.insert(vo);
	}

	@Override
	public int update(CourseBoardVO vo) {
		return courseBoardMapper.update(vo);
	}

	@Override
	public int delete(CourseBoardVO vo) {
		return courseBoardMapper.delete(vo);
	}

	@Override
	public List<TestVO> tourList() {
		return courseBoardMapper.tourList();
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return courseBoardMapper.getTotalCount(cri);
	}

	@Override
	public List<TestVO> tourList(Criteria cri) {
		return courseBoardMapper.tourList(cri);
	}

	@Override
	public int courseCnt(CourseBoardVO vo) {
		return courseBoardMapper.courseCnt(vo);
	}

	@Override
	public List<TestVO> courseSelect(CourseBoardVO vo) {
		return courseBoardMapper.courseSelect(vo);
	}

	@Override
	public int courseInsert(List<CourseVO> list, Long num) {
		long cnt = 1;
		for (CourseVO course : list) {
			course.setCourseSeq(num);
			course.setPlaceNo(cnt++);
			courseBoardMapper.courseInsert(course);
		}
		System.out.println(list.toString());
		return 0;
	}

	@Override
	public boolean plusViews(CourseBoardVO vo) {
		return courseBoardMapper.plusViews(vo);
	}

	@Override
	public int plusLike(CourseBoardLikeVO vo) {
		return courseBoardMapper.plusLike(vo);
	}

	@Override
	public int minusLike(CourseBoardLikeVO vo) {
		return courseBoardMapper.minusLike(vo);
	}

	@Override
	public int countLike(CourseBoardVO vo) {
		return courseBoardMapper.countLike(vo);
	}

	@Override
	public int checkLike(CourseBoardLikeVO vo) {
		return courseBoardMapper.checkLike(vo);
	}

	@Override
	public List<CourseBoardVO> getWriter(String writer) {
		return courseBoardMapper.getWriter(writer);
	}

	@Override
	public List<CourseBoardVO> getUserCourseList(@Param("writer")String writer, @Param("cri")Criteria cri) {
		//마이페이지 나의 여행코스 조회
		return courseBoardMapper.getUserCourseList(writer,cri);
	}

}
