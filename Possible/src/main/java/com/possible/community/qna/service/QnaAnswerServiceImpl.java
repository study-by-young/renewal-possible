package com.possible.community.qna.service;

import com.possible.community.qna.mapper.QnaAnswerMapper;
import com.possible.community.qna.mapper.QnaMapper;
import com.yedam.possable.app.community.qna.domain.QnaAnswerVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QnaAnswerServiceImpl implements QnaAnswerService {
	
	@Autowired
	QnaAnswerMapper qnaAnswerMapper;
	@Autowired
	QnaMapper qnaMapper;

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
