package com.yedam.possable.app.community.qna.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.possable.app.community.qna.domain.QnaAnswerVO;

public interface QnaAnswerMapper {

	public int insert(QnaAnswerVO vo);
	
	public int update(QnaAnswerVO vo);
	
	public int delete(QnaAnswerVO vo);
	
	public List<QnaAnswerVO> getList(@Param("seq") Long qnaSeq);
}
