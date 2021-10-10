package com.yedam.possable.app.community.course.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.possable.app.community.course.domain.CourseVO;
import com.yedam.possable.app.community.course.mapper.CourseMapper;

@Service
public class CourseServiceImpl implements CourseService {
	
	@Autowired CourseMapper courseMapper;

	@Override
	public int insert(CourseVO vo) {
		return courseMapper.insert(vo);
	}

}
