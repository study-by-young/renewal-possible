package com.possible.community.course.service;

import com.possible.community.course.domain.CourseVO;
import com.possible.community.course.mapper.CourseMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CourseServiceImpl implements CourseService {
	
	@Autowired
	CourseMapper courseMapper;

	@Override
	public int insert(CourseVO vo) {
		return courseMapper.insert(vo);
	}

}
