package com.yedam.possable.app.community.qna.service;

import java.util.List;

import com.yedam.possable.app.common.domain.Criteria;
import com.yedam.possable.app.community.qna.domain.QnaVO;

public interface QnaService {

	public QnaVO read(QnaVO vo);
	
	public int insert(QnaVO vo);
	
	public int update(QnaVO vo);
	
	public int delete(QnaVO vo);
	
	public List<QnaVO> getList(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
}
