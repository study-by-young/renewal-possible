package com.yedam.possable.app.community.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.possable.app.community.qna.domain.QnaAnswerVO;
import com.yedam.possable.app.community.qna.mapper.QnaAnswerMapper;

@Service
public class QnaAnswerServiceImpl implements QnaAnswerService {
	
	@Autowired QnaAnswerMapper qnaAnswerMapper;

	@Override
	public int insert(QnaAnswerVO vo) {
		// TODO Auto-generated method stub
		return qnaAnswerMapper.insert(vo);
	}

	@Override
	public int update(QnaAnswerVO vo) {
		// TODO Auto-generated method stub
		return qnaAnswerMapper.update(vo);
	}

	@Override
	public int delete(QnaAnswerVO vo) {
		// TODO Auto-generated method stub
		return qnaAnswerMapper.delete(vo);
	}

	@Override
	public List<QnaAnswerVO> getList(Long qnaSeq) {
		// TODO Auto-generated method stub
		return qnaAnswerMapper.getList(qnaSeq);
	}

	

}
