package com.yedam.possable.app.community.course.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.possable.app.community.course.domain.CourseBoardVO;
import com.yedam.possable.app.community.course.mapper.CourseBoardMapper;

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

}
