package com.yedam.possable.app.community.course.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.possable.app.common.criteria.domain.Criteria;
import com.yedam.possable.app.community.course.domain.CourseBoardVO;
import com.yedam.possable.app.community.course.domain.CourseVO;
import com.yedam.possable.app.community.course.mapper.CourseBoardMapper;
import com.yedam.possable.app.community.tour.domain.TestVO;

@Service
public class CourseBoardServiceImpl implements CourseBoardService {

	@Autowired CourseBoardMapper courseBoardMapper;

	@Override
	public List<CourseBoardVO> getList() {
		return courseBoardMapper.getList();
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
	public int courseInsert(CourseVO[] list, Long num) {
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
	public Long maxSeq() {
		return courseBoardMapper.maxSeq();
	}

}
