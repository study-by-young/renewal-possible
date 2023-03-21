package com.possible.community.qna.service;

import java.util.List;

import com.yedam.possable.app.community.qna.domain.QnaAnswerVO;

public interface QnaAnswerService {

	public int insert(QnaAnswerVO vo);
	
	public int update(QnaAnswerVO vo);
	
	public int delete(QnaAnswerVO vo);
	
	public QnaAnswerVO read(QnaAnswerVO vo);
	
	public List<QnaAnswerVO> getList(Long qnaSeq);
	
}
