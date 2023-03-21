package com.possible.community.course.service;

import com.possible.common.criteria.domain.Criteria;
import com.possible.community.course.domain.CourseBoardCmtVO;
import com.possible.community.course.mapper.CourseBoardCmtMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
