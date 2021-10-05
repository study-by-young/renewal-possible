package com.yedam.possable.app.community.qna.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.possable.app.community.qna.domain.QnaAnswerVO;

public interface QnaAnswerService {

	public int insert(QnaAnswerVO vo);
	
	public int update(QnaAnswerVO vo);
	
	public int delete(QnaAnswerVO vo);
	
	public List<QnaAnswerVO> getList(@Param("seq") Long qnaSeq);
	
}
