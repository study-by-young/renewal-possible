package com.yedam.possable.app.community.course.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.possable.app.common.criteria.domain.Criteria;
import com.yedam.possable.app.community.course.domain.CourseBoardCmtVO;
import com.yedam.possable.app.community.course.domain.CourseBoardVO;
import com.yedam.possable.app.community.course.mapper.CourseBoardCmtMapper;

@Service
public class CourseBoardCmtServiceImpl implements CourseBoardCmtService {
	
	@Autowired
	CourseBoardCmtMapper courseBoardCmtMapper;

	@Override
	public List<CourseBoardCmtVO> getList(Criteria cri, CourseBoardCmtVO vo) {
		return courseBoardCmtMapper.getList(cri, vo);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return courseBoardCmtMapper.getTotalCount(cri);
	}

	@Override
	public int insert(CourseBoardCmtVO vo) {
		return courseBoardCmtMapper.insert(vo);
	}
	
	@Override
	public int delete(Long seq) {
		return courseBoardCmtMapper.delete(seq);
	}

	@Override
	public CourseBoardCmtVO read(CourseBoardCmtVO vo) {
		return courseBoardCmtMapper.read(vo);
	}

}
