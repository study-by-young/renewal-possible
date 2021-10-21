package com.yedam.possable.app.community.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.possable.app.community.qna.domain.QnaAnswerVO;
import com.yedam.possable.app.community.qna.mapper.QnaAnswerMapper;
import com.yedam.possable.app.community.qna.mapper.QnaMapper;

@Service
public class QnaAnswerServiceImpl implements QnaAnswerService {
	
	@Autowired QnaAnswerMapper qnaAnswerMapper;
	@Autowired QnaMapper qnaMapper;

	@Override
	public int insert(QnaAnswerVO vo) {
		qnaMapper.updateAnswerCnt(vo.getQnaSeq(), 1L);
		return qnaAnswerMapper.insert(vo);
	}

	@Override
	public int update(QnaAnswerVO vo) {
		return qnaAnswerMapper.update(vo);
	}

	@Override
	public int delete(QnaAnswerVO vo) {
		qnaMapper.updateAnswerCnt(vo.getQnaSeq(), -1L);
		return qnaAnswerMapper.delete(vo);
	}
	
	@Override
	public QnaAnswerVO read(QnaAnswerVO vo) {
		return qnaAnswerMapper.read(vo);
	}

	@Override
	public List<QnaAnswerVO> getList(Long qnaSeq) {
		return qnaAnswerMapper.getList(qnaSeq);
	}

}
