package com.possible.community.qna_finish_delete.mapper;

import java.util.List;

import com.yedam.possable.app.community.qna.domain.QnaAnswerVO;

public interface QnaAnswerMapper {

	public int insert(QnaAnswerVO vo);
	
	public int update(QnaAnswerVO vo);
	
	public int delete(QnaAnswerVO vo);
	
	public QnaAnswerVO read(QnaAnswerVO vo);
	
	public List<QnaAnswerVO> getList(Long qnaSeq);
	
	// 해당 게시글의 답변 수(답변이 1이면 답변완료, 0이면 미답변)
	public int getCountBySeq(Long qnaSeq);

}
