package com.yedam.possable.app.community.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.possable.app.common.criteria.domain.Criteria;
import com.yedam.possable.app.community.qna.domain.QnaVO;
import com.yedam.possable.app.community.qna.mapper.QnaMapper;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	QnaMapper qnaMapper;
	
	
	@Override
	public QnaVO read(QnaVO vo) {
		// TODO Auto-generated method stub
		return qnaMapper.read(vo);
	}

	@Override
	public int insert(QnaVO vo) {
		// TODO Auto-generated method stub
		return qnaMapper.insert(vo);
	}

	@Override
	public int update(QnaVO vo) {
		// TODO Auto-generated method stub
		return qnaMapper.update(vo);
	}

	@Override
	public int delete(QnaVO vo) {
		// TODO Auto-generated method stub
		return qnaMapper.delete(vo);
	}

	@Override
	public List<QnaVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return qnaMapper.getList(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return qnaMapper.getTotalCount(cri);
	}

	@Override
	public List<QnaVO> getMyQna(Long memSeq) {
		// TODO Auto-generated method stub
		return qnaMapper.getMyQna(memSeq);
	}

}
